Imports System.IO
Imports System.Net.Mail
Partial Class Controls_WebUserControl
    Inherits System.Web.UI.UserControl

    Protected Sub btnSend_Click(sender As Object, e As EventArgs) Handles btnSend.Click
        If Page.IsValid Then
            Dim fileName As String = Server.MapPath("~/App_Data/ContactForm.txt")
            Dim mailBody As String = File.ReadAllText(fileName)
            Dim epost As String = Util.LFExec("SELECT epost FROM konfigurer")
            mailBody = mailBody.Replace("##Name##", tbxName.Text)
            mailBody = mailBody.Replace("##Email##", tbxEpost.Text)
            mailBody = mailBody.Replace("##Comments##", tbxKommentar.Text)

            Dim myMessage As MailMessage = New MailMessage()
            myMessage.Subject = "Beskjed fra webside"
            myMessage.Body = mailBody

            myMessage.From = New MailAddress(tbxEpost.Text, tbxName.Text)
            myMessage.To.Add(New MailAddress(epost, "Lillefrogner"))

            Dim mySmtpClient As SmtpClient = New SmtpClient()
            mySmtpClient.Send(myMessage)

            Messages.Visible = True
            FormTable.Visible = True

            tbxEpost.Text = ""
            tbxGjentaEpost.Text = ""
            tbxKommentar.Text = ""
            tbxName.Text = ""

        End If
    End Sub
End Class
