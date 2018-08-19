
Partial Class Admin_Underliste
    Inherits System.Web.UI.Page
   

    'Databinder lbxRoller og reinitierer tekstbokser og knapper
    Protected Sub UpdateListe()
        tbxUnderliste.Text = ""
        btnEdit.Enabled = False
        btnDelete.Enabled = False
        lbxUnderlister.DataBind()
        BtnNew.Enabled = True


    End Sub

    'Ved valg av rolle oppdateres tekstbokser og knapper aktiveres
    Protected Sub lbxUnderlister_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles lbxUnderlister.SelectedIndexChanged
        Dim ListeId As String = lbxUnderlister.SelectedValue
        tbxUnderliste.Text = Util.LFExec("SELECT tekst FROM underListe WHERE underListeId = " & ListeId)
        btnEdit.Enabled = True
        btnDelete.Enabled = True
        BtnNew.Enabled = False

    End Sub

    'Endrer aktiv rolleoppføring
    Protected Sub btnEdit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEdit.Click
        If tbxUnderliste.Text = "" Then Exit Sub
        Util.LFExec("UPDATE underListe SET tekst = '" & tbxUnderliste.Text & "' WHERE underListeId = " & lbxUnderlister.SelectedValue)
        UpdateListe()
    End Sub

    'Sletter aktiv rolleoppføring
    Protected Sub btnDelete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnDelete.Click
        Util.LFExec("DELETE FROM underListe WHERE underListeId = " & lbxUnderlister.SelectedValue)
        UpdateListe()
    End Sub

    'Oppretter en ny rolleoppføring
    Protected Sub btnNew_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnNew.Click
        If tbxUnderliste.Text = "" Then Exit Sub
        Dim LID = Request.QueryString("ID")
        Util.LFExec("INSERT INTO underListe VALUES (" & LID & ", '" & tbxUnderliste.Text & "')")
        UpdateListe()
    End Sub

    
    
    
    Protected Sub btnTilbake_Click(sender As Object, e As EventArgs) Handles btnTilbake.Click
        Dim QID As String = CType(FormView1.Controls(0).FindControl("nyIdLabel"), Label).Text
        Response.Redirect("~\Admin\Liste.aspx?ID= " & QID)
    End Sub

   
    Protected Sub btnBlank_Click(sender As Object, e As EventArgs) Handles btnBlank.Click
        Response.Redirect("~/Admin/Underliste.aspx?ID= " & Request.QueryString("ID"))
    End Sub
End Class
