
Partial Class MasterPage
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Kommer nederst på footer, holder på årets årstall
        SiteCopy.Text = "KDM &copy 2013 - " & Now.Year.ToString

        If Not HttpContext.Current.User.Identity.IsAuthenticated Then Exit Sub
        Dim str As String = ""
        If Profile.navn > "" Then str = "Du er pålogget som: <br />" & Profile.navn & "<br />"
        usrCred.Text = str


    End Sub

End Class

