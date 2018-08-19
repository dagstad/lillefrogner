
Partial Class Admin_Andelseiere
    Inherits System.Web.UI.Page




    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If IsNumeric(Request.QueryString("ID")) Then

            GridView1.Visible = False
            Panel1.Visible = False
            DetailsView1.Visible = True

        End If

    End Sub



    Protected Sub btnSave_Click(sender As Object, e As EventArgs)
        Util.LFExec("UPDATE andelseiere SET fornavn = '" & CType(DetailsView1.Controls(0).FindControl("tbxFornavn"), TextBox).Text & "', etternavn = '" & CType(DetailsView1.Controls(0).FindControl("tbxEtternavn"), TextBox).Text & "', epost = '" & CType(DetailsView1.Controls(0).FindControl("tbxEPost"), TextBox).Text & "', mobil = " & CType(DetailsView1.Controls(0).FindControl("tbxMobil"), TextBox).Text & " WHERE andelseiere.andelId = '" & Request.QueryString("ID") & "'")
        CType(DetailsView1.Controls(0).FindControl("lblMessage"), Label).Text = "Medlem oppdatert!"
        CType(DetailsView1.Controls(0).FindControl("btnCancel"), Button).Text = "Tilbake"
    End Sub

    Protected Sub btnDelete_Click(sender As Object, e As EventArgs)
        Dim aid As Integer = Request.QueryString("ID")
        Dim cretid As Integer = CInt(Util.LFExec("SELECT COUNT (*) FROM retid WHERE andelId = " & aid))
        Dim cres As Integer = CInt(Util.LFExec("SELECT COUNT (*) FROM reservasjon WHERE andelId = " & aid))
        CType(DetailsView1.Controls(0).FindControl("lblMessage"), Label).Text = cres & " reservasjoner vil bli slettet. <br />" & cretid & " reserverte dager på medlemmet vil bli slettet.<br /> <br /> Bekreft om du er sikker."
        CType(DetailsView1.Controls(0).FindControl("btnDelete"), Button).Enabled = False
        CType(DetailsView1.Controls(0).FindControl("btnSave"), Button).Enabled = False
        CType(DetailsView1.Controls(0).FindControl("btnBekreft"), Button).Visible = True

    End Sub

    Protected Sub btnBekreft_Click(sender As Object, e As EventArgs)
        Dim aid As Integer = Request.QueryString("ID")
        Dim userId As String = Util.LFExec("SELECT UserId from aspnet_Users WHERE UserName = '" & CType(DetailsView1.Controls(0).FindControl("lblBruker"), Label).Text & "'")

        Dim bruker As String = Util.LFExec("SELECT  bruker FROM andelseiere WHERE andelId= " & aid)
        Util.LFExec("DELETE FROM retid WHERE andelId = " & aid)
        Util.LFExec("DELETE FROM reservasjon WHERE andelId = " & aid)
        Util.LFExec("DELETE FROM andelseiere WHERE andelId = " & aid)
        If userId > "" Then
            Util.LFExec("DELETE FROM aspnet_Membership WHERE UserId = '" & userId & "'")
            Util.LFExec("DELETE FROM aspnet_Profile WHERE UserId = '" & userId & "'")
            Util.LFExec("DELETE FROM aspnet_Users WHERE UserId = '" & userId & "'")
        End If


        CType(DetailsView1.Controls(0).FindControl("lblMessage"), Label).Text = "Medlem slettet!"
        CType(DetailsView1.Controls(0).FindControl("btnCancel"), Button).Text = "Tilbake"
        CType(DetailsView1.Controls(0).FindControl("btnBekreft"), Button).Visible = False

    End Sub

    Protected Sub btnCancel_Click(sender As Object, e As EventArgs)
        GridView1.Visible = True
        Panel1.Visible = True
        DetailsView1.Visible = False
        Response.Redirect("~/Admin/Andelseiere.aspx")
        CType(DetailsView1.Controls(0).FindControl("lblMessage"), Label).Text = ""
        CType(DetailsView1.Controls(0).FindControl("btnDelete"), Button).Enabled = True
        CType(DetailsView1.Controls(0).FindControl("btnSave"), Button).Enabled = True
        CType(DetailsView1.Controls(0).FindControl("btnCancel"), Button).Text = "Avbryt"
    End Sub


   
End Class
