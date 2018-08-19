
Partial Class Nyhet
    Inherits System.Web.UI.Page



    Dim LID As String
    Dim NID As String

    Protected Sub LinkButton1_Click(sender As Object, e As EventArgs)
        Response.Redirect("~/Admin/Rediger.aspx?ID=" & Request.QueryString("ID"))
    End Sub


    Protected Sub LinkButton3_Click(sender As Object, e As EventArgs)
        Util.LFExec("UPDATE nyheter SET arkiv = 1  WHERE nyId = " & Request.QueryString("ID"))
        Response.Redirect("~/Nyheter.aspx")
    End Sub

    Protected Sub LinkButton2_Click(sender As Object, e As EventArgs)
        If Not IsNumeric(Request.QueryString("ID")) Then Exit Sub

        Dim NID As String = Request.QueryString("ID") 'listeId
        Dim tittel As String = Util.LFExec("SELECT tittel FROM nyheter WHERE nyId = " & NID)
        CType(LoginView1.Controls(0).FindControl("lblSlett"), Label).Text = "Bekreft at du vil slette nyhet med tittel : " & tittel
        CType(LoginView1.Controls(0).FindControl("lbBekreft"), LinkButton).Visible = True
        CType(LoginView1.Controls(0).FindControl("lbAvbryt"), LinkButton).Visible = True

    End Sub


    Protected Sub lbBekreft_Click(sender As Object, e As EventArgs)
        NID = Request.QueryString("ID") 'listeId
        LID = CStr(Util.LFExec("SELECT listeId FROM liste WHERE nyId = " & NID)) 'Finne listeId som underliste er knyttet mot

        If LID > "" Then
            Util.LFExec("DELETE FROM underListe WHERE listeId = " & LID)
        End If
        Util.LFExec("DELETE FROM liste WHERE nyId = " & NID)
        Util.LFExec("DELETE FROM avsnitt WHERE nyId = " & NID)
        Util.LFExec("DELETE FROM nyheter WHERE nyId = " & NID)

        Response.Redirect("~/Nyheter.aspx")

    End Sub

    Protected Sub skjulSlett()
        If Request.QueryString("ID") = 2 Then
            'CType(DetailsView1.Controls(0).FindControl("BtnLeggTilListe"), Button).Enabled = False
            CType(LoginView1.Controls(0).FindControl("LinkButton2"), LinkButton).Visible = False
        ElseIf Request.QueryString("ID") = 3 Then
            CType(LoginView1.Controls(0).FindControl("LinkButton2"), LinkButton).Visible = False
        ElseIf Request.QueryString("ID") = 4 Then
            CType(LoginView1.Controls(0).FindControl("LinkButton2"), LinkButton).Visible = False
        ElseIf Request.QueryString("ID") = 5 Then
            CType(LoginView1.Controls(0).FindControl("LinkButton2"), LinkButton).Visible = False
        ElseIf Request.QueryString("ID") = 6 Then
            CType(LoginView1.Controls(0).FindControl("LinkButton2"), LinkButton).Visible = False
        ElseIf Request.QueryString("ID") = 7 Then
            CType(LoginView1.Controls(0).FindControl("LinkButton2"), LinkButton).Visible = False

        End If
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Page.MaintainScrollPositionOnPostBack = True
        skjulSlett()
    End Sub

    
  
End Class
