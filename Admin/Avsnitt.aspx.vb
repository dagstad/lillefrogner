Imports KDM.Utilities
Imports System

Partial Class Admin_Avsnitt
    Inherits System.Web.UI.Page

    Protected Sub kategorivalg()
        Dim NYID As Integer = Request.QueryString("ID")
        Dim kategori As String = Convert.ToString(Util.LFExec("SELECT katId FROM nyheter WHERE nyId= " & NYID))
        If kategori = "1" Then
            Response.Redirect("~/Nyhet.aspx?ID=" & Request.QueryString("ID"))
        ElseIf kategori = "2" Then
            Response.Redirect("~/Default.aspx?ID=" & Request.QueryString("ID"))
        ElseIf kategori = "3" Then
            Response.Redirect("~/Vedtekter.aspx?ID=" & Request.QueryString("ID"))
        ElseIf kategori = "4" Then
            Response.Redirect("~/Oppfordring.aspx?ID=" & Request.QueryString("ID"))
        ElseIf kategori = "5" Then
            Response.Redirect("~/Vannpumpe.aspx?ID=" & Request.QueryString("ID"))
        ElseIf kategori = "6" Then
            Response.Redirect("~/Hytteregler.aspx?ID=" & Request.QueryString("ID"))
        ElseIf kategori = "7" Then
            Response.Redirect("~/Utleieregler.aspx?ID=" & Request.QueryString("ID"))
        End If
    End Sub

    Protected Sub BtnFerdig_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnFerdig.Click
        kategorivalg()
    End Sub

    Protected Sub BtnAvbryt_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnAvbryt.Click
        Response.Redirect("~/Admin/Rediger.aspx?ID=" & Request.QueryString("ID"))
    End Sub


    'Databinder lbxRoller og reinitierer tekstbokser og knapper
    Protected Sub UpdateListe()
        tbxHeading.Text = ""
        tbxAvsnitt.Text = ""
        btnEdit.Enabled = False
        btnDelete.Enabled = False
        lbxAvsnitt.DataBind()
    End Sub

    'Ved valg av avsnitt oppdateres tekstbokser og knapper aktiveres
    Protected Sub lbxAvsnitt_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles lbxAvsnitt.SelectedIndexChanged
        Dim AID As Integer = lbxAvsnitt.SelectedValue
        tbxHeading.Text = Util.LFExec("SELECT heading FROM avsnitt WHERE avsnittId = " & AID)
        tbxAvsnitt.Text = Util.LFExec("SELECT tekst FROM avsnitt WHERE avsnittId = " & AID)
        btnEdit.Enabled = True
        btnDelete.Enabled = True
        btnNew.Enabled = False
    End Sub

    'Endrer aktiv avsnitt
    Protected Sub btnEdit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEdit.Click
        If tbxAvsnitt.Text = "" And tbxHeading.Text = "" Then Exit Sub
        tbxAvsnitt.Text = tbxAvsnitt.Text.Replace("'", "''") 'Hindre SQL hijacking.
        Util.LFExec("UPDATE avsnitt SET tekst = '" & tbxAvsnitt.Text & "', heading = '" & tbxHeading.Text & "' WHERE avsnittId = " & lbxAvsnitt.SelectedValue)
        UpdateListe()
    End Sub

    'Sletter aktivt avsnitt
    Protected Sub btnDelete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnDelete.Click
        Util.LFExec("DELETE FROM avsnitt WHERE avsnittId = " & lbxAvsnitt.SelectedValue)
        UpdateListe()
    End Sub

    'Oppretter en nytt avsnitt
    Protected Sub btnNew_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnNew.Click
        If tbxAvsnitt.Text = "" And tbxHeading.Text = "" Then Exit Sub
        Util.LFExec("INSERT INTO avsnitt VALUES (" & Request.QueryString("ID") & ", '" & tbxHeading.Text & "', '" & tbxAvsnitt.Text & "')")
        UpdateListe()
    End Sub

   
    Protected Sub btnBlank_Click(sender As Object, e As EventArgs) Handles btnBlank.Click
        Response.Redirect("~/Admin/Avsnitt.aspx?ID=" & Request.QueryString("ID"))
    End Sub

   
    Protected Sub btnUnderliste_Click(sender As Object, e As EventArgs) Handles btnUnderliste.Click
        Response.Redirect("~/Admin/AvsnittListe.aspx?ID=" & Request.QueryString("ID") & "&AID=" & Server.UrlEncode(lbxAvsnitt.SelectedValue))
    End Sub

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Page.MaintainScrollPositionOnPostBack = True
    End Sub
End Class

