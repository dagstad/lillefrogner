Imports System.IO
Imports System.Net.Mail

Imports System.Data
Imports System.Data.SqlClient

Partial Class Admin_Faktura
    Inherits System.Web.UI.Page
    Dim epost As String = Util.LFExec("SELECT epost FROM konfigurer ")
    Dim konto As String = Util.LFExec("SELECT kontonr FROM konfigurer ")
    Dim pris As String = Util.LFExec("SELECT pris FROM konfigurer ")
    Protected Sub Page_Load1(sender As Object, e As EventArgs) Handles Me.Load

        lblEpost.Text = epost
        lblKonto.Text = konto
        lblPris.Text = pris

        If IsNumeric(Request.QueryString("ID")) Then
            FormView1.Visible = True
            GridView1.Visible = False
            Dim antallDager As Integer = CInt(Util.LFExec("SELECT COUNT(*) FROM [retid] WHERE resId = " & Request.QueryString("ID")))
            CType(FormView1.Controls(0).FindControl("lblAntall"), Label).Text = (antallDager - 1)
            CType(FormView1.Controls(0).FindControl("lblSum"), Label).Text = (antallDager - 1) * lblPris.Text
        End If

    End Sub



    Protected Sub btnSend_Click(sender As Object, e As EventArgs)

        Dim today As System.DateTime
        Dim forfall As System.DateTime
        today = System.DateTime.Now
        forfall = today.AddDays(10)

        Dim id As Integer = Request.QueryString("ID")
        Dim fileName As String = Server.MapPath("~/App_Data/Faktura.txt")
        Dim mailBody As String = File.ReadAllText(fileName)

        mailBody = mailBody.Replace("##ResId##", CType(FormView1.Controls(0).FindControl("resIdLabel"), Label).Text)
        mailBody = mailBody.Replace("##Fornavn##", CType(FormView1.Controls(0).FindControl("fornavnLabel"), Label).Text)
        mailBody = mailBody.Replace("##Etternavn##", CType(FormView1.Controls(0).FindControl("etternavnLabel"), Label).Text)
        mailBody = mailBody.Replace("##Epost##", CType(FormView1.Controls(0).FindControl("epostLabel"), Label).Text)
        mailBody = mailBody.Replace("##Netter##", CType(FormView1.Controls(0).FindControl("lblAntall"), Label).Text)
        mailBody = mailBody.Replace("##Sum##", CType(FormView1.Controls(0).FindControl("lblSum"), Label).Text)
        mailBody = mailBody.Replace("##Dato##", forfall)
        mailBody = mailBody.Replace("##Kontonummer##", lblKonto.Text)


        Dim myMessage As MailMessage = New MailMessage()
        myMessage.Subject = "Faktura"
        myMessage.Body = mailBody

        myMessage.From = New MailAddress(lblEpost.Text, "Lillefrogner")
        myMessage.To.Add(New MailAddress(CType(FormView1.Controls(0).FindControl("epostLabel"), Label).Text))

        Dim mySmtpClient As SmtpClient = New SmtpClient()
        mySmtpClient.Send(myMessage)
        Util.LFExec("UPDATE reservasjon SET sendtFaktura = 2 WHERE resId = " & id)
        GridView1.DataBind()
        FormView1.Visible = False
        Response.Redirect("~/Admin/Faktura.aspx")
        lblFerdig.Text = "Faktura sendes."
    End Sub


End Class
