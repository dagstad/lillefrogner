
Partial Class Admin_Konfigurer
    Inherits System.Web.UI.Page

    Protected Sub visKonfigurer()
        tbxEpost.Enabled = True
        tbxKonto.Enabled = True
        tbxPris.Enabled = True
        btnAction.Enabled = True
    End Sub

    Protected Sub hideKonfigurer()
        tbxEpost.Enabled = False
        tbxKonto.Enabled = False
        tbxPris.Enabled = False
        btnAction.Enabled = False
        btnForandre.Enabled = True
    End Sub

    Protected Sub btnAction_Click(sender As Object, e As EventArgs) Handles btnAction.Click
        If tbxEpost.Text > "" And tbxKonto.Text > "" And tbxPris.Text > "" Then
            lblMessage.Text = ""
            Util.LFExec("UPDATE konfigurer SET kontonr = " & tbxKonto.Text & ", epost = '" & tbxEpost.Text & "', pris = " & tbxPris.Text & " WHERE konfigId = 2")
            hentKonfigurer()
            lblMessage.Text = "Alle poster oppdatert."
            hideKonfigurer()

        Else
            lblMessage.Text = "Alle poster må være fylt ut."
        End If
    End Sub

    Protected Sub btnForandre_Click(sender As Object, e As EventArgs) Handles btnForandre.Click
        lblMessage.Text = ""
        visKonfigurer()
        btnForandre.Enabled = False
    End Sub

    Protected Sub hentKonfigurer()
        Dim kontonr As Int64 = Util.LFExec("SELECT kontonr FROM [konfigurer]")
        Dim epost As String = Util.LFExec("SELECT epost FROM [konfigurer]")
        Dim pris As Integer = Util.LFExec("SELECT pris FROM [konfigurer]")
        tbxEpost.Text = epost
        tbxKonto.Text = kontonr
        tbxPris.Text = pris
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            lblMessage.Text = ""
            hentKonfigurer()
        End If
    End Sub
End Class
