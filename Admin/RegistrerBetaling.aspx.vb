
Partial Class Admin_RegistrerBetaling
    Inherits System.Web.UI.Page

    Protected Sub btnBetalt_Click(sender As Object, e As EventArgs)
        Util.LFExec("UPDATE reservasjon SET betalt = 2 WHERE resId = " & Request.QueryString("ID"))
        Response.Redirect("~/Admin/RegistrerBetaling.aspx")
    End Sub
End Class
