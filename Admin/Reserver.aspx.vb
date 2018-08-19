Imports System.IO
Imports System.Net.Mail
Imports System.Data
Imports System.Data.SqlClient

Partial Class Admin_Reserver
    Inherits System.Web.UI.Page
    Protected dsHolidays As DataSet
    Dim epost As String = Util.LFExec("SELECT epost FROM [konfigurer]")

    Protected Sub Page_Load1(sender As Object, e As EventArgs) Handles Me.Load

        If IsNumeric(Request.QueryString("ID")) Then
            FormView1.Visible = True
            GridView1.Visible = False

            Dim antallDager As Integer = CInt(Util.LFExec("SELECT COUNT(*) FROM [retid] WHERE resId = " & Request.QueryString("ID")))
            CType(FormView1.Controls(0).FindControl("lblAntall"), Label).Text = "Antall netter: " & (antallDager - 1)

        End If
        If Not IsPostBack Then
            VisibleDate()
            HytteresCal1()
            lblFerdig.Visible = False

        End If
    End Sub


    Protected Sub HytteresCal1()
        Dim firstDate As New DateTime(Calendar1.VisibleDate.Year, Calendar1.VisibleDate.Month, 1)
        Dim lastDate As DateTime = GetFirstDayOfNextMonthCal1()
        dsHolidays = GetCurrentMonthData(firstDate, lastDate)
    End Sub

    Protected Function GetFirstDayOfNextMonthCal1() As DateTime
        Dim monthNumber, yearNumber As Integer
        If Calendar1.VisibleDate.Month = 12 Then
            monthNumber = 1
            yearNumber = Calendar1.VisibleDate.Year + 1
        Else
            monthNumber = Calendar1.VisibleDate.Month + 1
            yearNumber = Calendar1.VisibleDate.Year
        End If
        Dim lastDate As New DateTime(yearNumber, monthNumber, 1)
        Return lastDate
    End Function

    Protected Sub VisibleMonthChanged(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.MonthChangedEventArgs) _
            Handles Calendar1.VisibleMonthChanged

        HytteresCal1()

    End Sub

    Function GetCurrentMonthData(ByVal firstDate As DateTime, ByVal lastDate As DateTime) As DataSet
        Dim dsMonth As New DataSet
        Dim cs As ConnectionStringSettings
        cs = ConfigurationManager.ConnectionStrings("lillefrognerConnectionString")
        Dim connString As String = cs.ConnectionString
        Dim dbConnection As New SqlConnection(connString)
        Dim query As String
        query = ("SELECT resdato FROM retid join reservasjon ON reservasjon.resId = retid.resId" & _
            " WHERE resdato >= @firstDate AND resdato < @lastDate")

        Dim dbCommand As New SqlCommand(query, dbConnection)
        dbCommand.Parameters.Add(New SqlParameter("@firstDate", firstDate))
        dbCommand.Parameters.Add(New SqlParameter("@lastDate", lastDate))

        Dim sqlDataAdapter As New SqlDataAdapter(dbCommand)
        Try
            sqlDataAdapter.Fill(dsMonth)
        Catch
        End Try
        Return dsMonth
    End Function

    Protected Sub DayRender(ByVal sender As Object, _
            ByVal e As System.Web.UI.WebControls.DayRenderEventArgs) _
            Handles Calendar1.DayRender

        If e.Day.IsOtherMonth Then
            e.Day.IsSelectable = False
            e.Cell.ForeColor = System.Drawing.Color.White
            e.Cell.BackColor = System.Drawing.Color.LightGray

        End If

        Dim nextDate As DateTime

        If Not dsHolidays Is Nothing And IsPostBack Then
            For Each dr As DataRow In dsHolidays.Tables(0).Rows

                nextDate = CType(dr("resdato"), DateTime)
                'Dim countDatoOpptatt As String = Util.LFExec("SELECT COUNT(*) FROM retid WHERE resdato = " & "'" & nextDate.ToString("yyyy-MM-dd") & "'")
                Dim bruker As String = Util.LFExec("SELECT bruker FROM ((reservasjon inner join retid on retid.resId = reservasjon.resId) inner join andelseiere on andelseiere.andelId = reservasjon.andelId) WHERE retid.resdato = '" & nextDate.ToString("yyyy-MM-dd") & "' AND (godkjent = 2)")
                'Dim godkjent As String = Util.LFExec("SELECT godkjent FROM [reservasjon] INNER JOIN [retid] ON retid.resId = reservasjon.resId WHERE retid.resdato = '" & nextDate.ToString("yyyy-MM-dd") & "'")
                'Dim status As String = Util.LFExec("SELECT opptatt FROM retid WHERE resdato = " & "'" & nextDate.ToString("yyyy-MM-dd") & "'")
                Dim checkDate As String = Util.LFExec("SELECT SUM (opptatt) FROM retid JOIN reservasjon ON retid .resId = reservasjon .resId WHERE resdato = " & "'" & nextDate.ToString("MM-dd-yyyy") & "'" & " AND godkjent = 2")

                If nextDate = e.Day.Date Then

                    'If godkjent = "1" Then
                    '    e.Cell.Text += (e.Day.DayNumberText & " " & bruker & " ønsker å leie <br/>")
                    '    e.Cell.BackColor = System.Drawing.Color.LightGreen
                    'End If

                    If checkDate = "1" Then
                        'lys blå er ledig frem til 16.00 Kan velges som til dato
                        e.Cell.BackColor = System.Drawing.Color.LightBlue
                        e.Cell.Text = (e.Day.DayNumberText & "<br/>" & "Ledig til kl. 16.00 <br/> Utleid fra kl. 16.00 <br/>")

                    ElseIf checkDate = "2" Then
                        e.Cell.Text = (e.Day.DayNumberText & "<br/> Utleid " & bruker)
                        e.Cell.BackColor = System.Drawing.Color.LightSalmon

                    ElseIf checkDate = "3" Then
                        'Lys grønn er ledig fra 16.00 Kan velges som fra dato
                        e.Cell.BackColor = System.Drawing.Color.LightGreen
                        e.Cell.Text = (e.Day.DayNumberText & "<br/>" & "Utleid til kl. 16.00 <br/> Ledig fra kl. 16.00 <br/>")

                    ElseIf checkDate = "4" Then
                        e.Cell.Text = (e.Day.DayNumberText & "<br/>" & "Utleid til kl. 16.00 <br/> Utleid fra kl. 16.00 <br/>")
                        e.Cell.BackColor = System.Drawing.Color.LightSalmon



                    End If
                End If


            Next
        End If
    End Sub

    Protected Sub Initier(ByVal sender As Object, ByVal e As System.EventArgs) Handles Calendar1.Init
        VisibleDate()
        HytteresCal1()

    End Sub

    Protected Sub VisibleDate()
        Calendar1.VisibleDate = DateTime.Today

    End Sub


    Protected Sub btnVis_Click(sender As Object, e As EventArgs) Handles btnVis.Click
        If (Calendar1.Visible) Then
            Calendar1.Visible = False
        Else
            Calendar1.Visible = True

        End If
    End Sub



    Protected Sub btnGodkjenn_Click(sender As Object, e As EventArgs)
        Dim id As Integer = Request.QueryString("ID")
        If CType(FormView1.Controls(0).FindControl("epostLabel"), Label).Text = "" Then
            lblFerdig.Text = "Ingen E-postadresse registrert på bruker. Du må sende svar i post."

        Else
            lblFerdig.Text = "Reservasjon godkjent. Se kalender. Bekreftelse sendes til andelseier på mail."
            Dim fileName As String = Server.MapPath("~/App_Data/Godkjent.txt")
            Dim mailBody As String = File.ReadAllText(fileName)


            mailBody = mailBody.Replace("##ResId##", CType(FormView1.Controls(0).FindControl("resIdLabel"), Label).Text)
            mailBody = mailBody.Replace("##Fornavn##", CType(FormView1.Controls(0).FindControl("fornavnLabel"), Label).Text)
            mailBody = mailBody.Replace("##Netter##", CType(FormView1.Controls(0).FindControl("lblAntall"), Label).Text)
            Dim myMessage As MailMessage = New MailMessage()
            myMessage.Subject = "Godkjent reservasjon Lille Frogneseter"
            myMessage.Body = mailBody
            myMessage.From = New MailAddress(epost, "Lillefrogner")
            myMessage.To.Add(New MailAddress(CType(FormView1.Controls(0).FindControl("epostLabel"), Label).Text))
            Dim mySmtpClient As SmtpClient = New SmtpClient()
            mySmtpClient.Send(myMessage)
        End If
        Util.LFExec("UPDATE reservasjon SET godkjent = 2 WHERE resId = " & ID)
        GridView1.DataBind()
        FormView1.Visible = False
        Response.Redirect("~/Admin/Reserver.aspx")
        lblFerdig.Text = "Reservasjon godkjent. Se kalender. Bekreftelse sendes til andelseier på mail."
        GridView1.Visible = True
    End Sub

    Protected Sub btnAvvis_Click(sender As Object, e As EventArgs)
        Dim id As Integer = Request.QueryString("ID")
        If CType(FormView1.Controls(0).FindControl("epostLabel"), Label).Text = "" Then
            lblFerdig.Text = "Ingen E-postadresse registrert på bruker. Du må sende svar i post."

        Else
            lblFerdig.Text = "Reservasjon Avvist. Bekreftelse sendes til andelseier på mail."
            Dim fileName As String = Server.MapPath("~/App_Data/Avvis.txt")
            Dim mailBody As String = File.ReadAllText(fileName)
            mailBody = mailBody.Replace("##ResId##", CType(FormView1.Controls(0).FindControl("resIdLabel"), Label).Text)
            mailBody = mailBody.Replace("##Fornavn##", CType(FormView1.Controls(0).FindControl("fornavnLabel"), Label).Text)
            Dim myMessage As MailMessage = New MailMessage()
            myMessage.Subject = "Avvist søknad Lille Frogneseter"
            myMessage.Body = mailBody
            myMessage.From = New MailAddress(epost, "Lillefrogner")
            myMessage.To.Add(New MailAddress(CType(FormView1.Controls(0).FindControl("epostLabel"), Label).Text))
            Dim mySmtpClient As SmtpClient = New SmtpClient()
            mySmtpClient.Send(myMessage)
        End If
        Util.LFExec("UPDATE reservasjon SET godkjent = 3 WHERE resId = " & ID)
        GridView1.DataBind()
        FormView1.Visible = False
        Response.Redirect("~/Admin/Reserver.aspx")

    End Sub

    Protected Sub btnSjekk_Click(sender As Object, e As EventArgs)
        'LØKKE FOR Å LEGGE TIL DATO I EN DATABASE MELLOM ET TIDSROM.
        Dim endDate As Date = CDate(Util.LFExec("SELECT TOP 1 resdato FROM retid WHERE resId = " & CType(FormView1.Controls(0).FindControl("resIdLabel"), Label).Text & "ORDER BY retidId DESC"))
        Dim currentDate As Date = CDate(Util.LFExec("SELECT TOP 1 resdato FROM retid WHERE resId = " & CType(FormView1.Controls(0).FindControl("resIdLabel"), Label).Text & "ORDER BY retidId ASC"))
        If currentDate < Date.Now Then
            lblFeil.Visible = True
            lblFeil.Text = "DATO ER ALLEREDE PASSERT! "
            lblFeil0.Visible = True
            lblFeil0.Text = "Du må avvise reservasjonen. "
            Exit Sub
        End If


        Dim currentDate2 As Date = CDate(Util.LFExec("SELECT TOP 1 resdato FROM retid WHERE resId = " & CType(FormView1.Controls(0).FindControl("resIdLabel"), Label).Text & "ORDER BY retidId ASC"))
        Dim opptatt As Integer = 0
        'Løkke for å sjekke igjennom alle datoene som er valgt og se at alle dagene er ledig.
        While currentDate2 <= endDate
            Dim checkDate As String = Util.LFExec("SELECT SUM (opptatt) FROM retid JOIN reservasjon ON retid .resId = reservasjon .resId WHERE resdato = " & "'" & currentDate2.ToString("MM-dd-yyyy") & "'" & " AND godkjent = 2")
            If currentDate2 = currentDate Then
                If checkDate = "1" Then
                    opptatt += 1
                End If
            End If
            If currentDate2 = endDate Then
                If checkDate = "3" Then
                    opptatt += 1
                End If
            End If
            If currentDate2 <> endDate And currentDate2 <> currentDate Then
                If checkDate = "2" Or checkDate = "4" Then
                    opptatt += 1
                End If
            End If

            currentDate2 = currentDate2.AddDays(1)
        End While
        If opptatt > 0 Then
            lblFeil.Visible = True
            lblFeil.Text = "HYTTEN ER UTLEID I PERIODEN DU ØNSKER! "
            lblFeil0.Visible = True
            lblFeil0.Text = "Du må avvise reservasjonen. "


        Else
            CType(FormView1.Controls(0).FindControl("btnGodkjenn"), Button).Enabled = True
            lblFerdig.Visible = True
            lblFerdig.Text = "Hytten er tilgjengelig."
        End If

    End Sub
End Class
