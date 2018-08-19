
Partial Class Admin_TotalUtleie
    Inherits System.Web.UI.Page


    Protected Sub btnBeregn_Click(sender As Object, e As System.EventArgs) Handles btnBeregn.Click

        Dim currentDate As Date = tbxFraDato.Text
        Dim currentDate2 As Date = tbxTilDato.Text

        Dim pris As Integer = Util.LFExec("Select pris FROM konfigurer")

        Dim antallDager As Integer = Util.LFExec("Select  COUNT(DISTINCT resdato) as 'Antall Dager Utleid' FROM retid where resdato between" & "'" & currentDate.ToString("MM-dd-yyyy") & "'" & " and " & "'" & currentDate2.ToString("MM-dd-yyyy") & "'")
        lblAntallDager.Text = "Antall dager utleid fra " & currentDate & " til " & currentDate2 & " er " & antallDager & " dager."
        lblTotalSum.Text = "Sum: " & (antallDager * pris) & ",-"

        tbxFraDato.Text = ""
        tbxTilDato.Text = ""
        btnBeregn.Enabled = False



    End Sub

    Protected Sub tbxTilDato_TextChanged(sender As Object, e As System.EventArgs) Handles tbxTilDato.TextChanged
        btnBeregn.Enabled = True
        lblAntallDager.Enabled = True
        lblTotalSum.Enabled = True
       




    End Sub
End Class
