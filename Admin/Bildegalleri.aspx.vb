
Partial Class Admin_Bildegalleri
    Inherits System.Web.UI.Page


    'Brukervalgt fil lastes opp til server og databundet nøkkel oppdateres
    Protected Sub ListView1_ItemInserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ListViewInsertEventArgs) Handles ListView1.ItemInserting

        Dim fbx As Object = CType(ListView1.InsertItem.Controls(0).FindControl("FileUpload2"), FileUpload)

        If fbx.HasFile Then
            If fbx.PostedFile.ContentType.ToLower.IndexOf("image") < 0 Or fbx.PostedFile.ContentLength > 81920000 Then
                e.Cancel = "true"
            Else
                fbx.SaveAs(Server.MapPath("~/Bilder\" & fbx.FileName))
                e.Values.Item("bilde") = "~/Bilder/" & fbx.FileName
                lblMsg.Text = "Filen er vellykket lastet opp!"

            End If
        End If

        e.Values("bruker") = User.Identity.Name

    End Sub

End Class
