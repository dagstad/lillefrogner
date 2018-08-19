Imports System.IO
Imports System.Net.Mail
Imports System.Data
Imports System.Data.SqlClient

Partial Class Users_Utleie
    Inherits System.Web.UI.Page
    Protected dsHolidays As DataSet



    Protected Sub HytteresCal1()
        Dim firstDate As New DateTime(Calendar1.VisibleDate.Year, Calendar1.VisibleDate.Month, 1)
        Dim lastDate As DateTime = GetFirstDayOfNextMonthCal()
        dsHolidays = GetCurrentMonthData(firstDate, lastDate)
    End Sub

    Protected Function GetFirstDayOfNextMonthCal() As DateTime
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

 

    Protected Sub Initier(ByVal sender As Object, ByVal e As System.EventArgs) Handles Calendar1.Init
        VisibleDate()
        HytteresCal1()

    End Sub

    Protected Sub VisibleDate()
        Calendar1.VisibleDate = DateTime.Today
    End Sub

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
        End If
        Dim nextDate As DateTime
        If Not dsHolidays Is Nothing Then
            For Each dr As DataRow In dsHolidays.Tables(0).Rows
                nextDate = CType(dr("resdato"), DateTime)
                ' Dim bruker As String = Util.LFExec("SELECT bruker FROM ((reservasjon inner join retid on retid.resId = reservasjon.resId) inner join andelseiere on andelseiere.andelId = reservasjon.andelId) WHERE retid.resdato = '" & nextDate.ToString("yyyy-MM-dd") & "'")
                'Dim status As Integer = CInt(Util.LFExec("SELECT opptatt FROM retid WHERE resdato = " & "'" & nextDate.ToString("yyyy-MM-dd") & "'"))
                'Dim godkjent As Integer = CInt(Util.LFExec("SELECT godkjent FROM [reservasjon] JOIN [retid] ON retid.resId = reservasjon.resId WHERE retid.resdato = '" & nextDate.ToString("yyyy-MM-dd") & "'"))
                'Dim godkjentCount As Integer = CInt(Util.LFExec("SELECT COUNT(*) FROM [reservasjon] JOIN [retid] ON retid.resId = reservasjon.resId WHERE retid.resdato = '" & nextDate.ToString("yyyy-MM-dd") & "'" & " AND godkjent = 2"))
                Dim checkDate As String = Util.LFExec("SELECT SUM (opptatt) FROM retid JOIN reservasjon ON retid .resId = reservasjon .resId WHERE resdato = " & "'" & nextDate.ToString("MM-dd-yyyy") & "'" & " AND godkjent = 2")
                If nextDate = e.Day.Date Then
                    If checkDate = "1" Then
                        'lys blå er ledig frem til 16.00 Kan velges som til dato
                        e.Cell.BackColor = System.Drawing.Color.LightBlue
                        e.Cell.Text = (e.Day.DayNumberText & "<br/>" & "Ledig til kl. 16.00 <br/> Utleid fra kl. 16.00")
                    ElseIf checkDate = "2" Then
                        e.Cell.Text = (e.Day.DayNumberText & "<br/> Utleid ")
                        e.Cell.BackColor = System.Drawing.Color.LightSalmon
                    ElseIf checkDate = "3" Then
                        'Lys grønn er ledig fra 16.00 Kan velges som fra dato
                        e.Cell.BackColor = System.Drawing.Color.LightGreen
                        e.Cell.Text = (e.Day.DayNumberText & "<br/>" & "Utleid til kl. 16.00 <br/> Ledig fra kl. 16.00")
                    ElseIf checkDate = "4" Then
                        e.Cell.Text = (e.Day.DayNumberText & "<br/>" & "Utleid til kl. 16.00 <br/> Utleid fra kl. 16.00")
                        e.Cell.BackColor = System.Drawing.Color.LightSalmon
                    End If
                End If
            Next
        End If
    End Sub

  

 

  


    Protected Sub btnReservasjon_Click(sender As Object, e As System.EventArgs) Handles btnReservasjon.Click
        Response.Redirect("~\Users\Utleie.aspx")
    End Sub
End Class
