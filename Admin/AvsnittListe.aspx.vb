
Partial Class Admin_AvsnittListe
    Inherits System.Web.UI.Page

    Protected Sub btnLagre_Click(sender As Object, e As EventArgs) Handles btnLagre.Click
        Dim aid As String = Request.QueryString("AID")
        Dim ID As String = Request.QueryString("ID")
        If IsNumeric(aid) AndAlso (aid) > 0 Then
            Util.LFExec("INSERT INTO liste VALUES (" & Request.QueryString("ID") & ", '', '" & tbxListe.Text & "', " & aid & ")")
        End If
        Response.Redirect("~/Admin/Avsnitt.aspx?ID=" & Request.QueryString("ID"))
    End Sub
End Class
