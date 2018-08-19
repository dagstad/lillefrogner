
Partial Class Admin_Rediger
    Inherits System.Web.UI.Page

    Protected Sub kategorivalg()
        Dim NYID As Integer = Request.QueryString("ID")
        Dim kategori As String = Util.LFExec("SELECT katId FROM nyheter WHERE nyId= " & NYID)
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

    Protected Sub visIngress()
        Dim kategori As Integer = CType(DetailsView1.Controls(0).FindControl("ddlKategori"), DropDownList).SelectedValue
        If kategori = 1 Then
            CType(DetailsView1.Controls(0).FindControl("tbxIngress"), TextBox).Visible = True
        ElseIf kategori = 2 Then
            CType(DetailsView1.Controls(0).FindControl("tbxIngress"), TextBox).Visible = True
        ElseIf kategori = 3 Then
            CType(DetailsView1.Controls(0).FindControl("tbxIngress"), TextBox).Visible = False
        ElseIf kategori = 4 Then
            CType(DetailsView1.Controls(0).FindControl("tbxIngress"), TextBox).Visible = False
        ElseIf kategori = 5 Then
            CType(DetailsView1.Controls(0).FindControl("tbxIngress"), TextBox).Visible = False
        ElseIf kategori = 6 Then
            CType(DetailsView1.Controls(0).FindControl("tbxIngress"), TextBox).Visible = False
        ElseIf kategori = 7 Then
            CType(DetailsView1.Controls(0).FindControl("tbxIngress"), TextBox).Visible = False
        End If
    End Sub

    Protected Sub visKnapper()

        Dim NYID As Integer = Request.QueryString("ID")
        Dim kategori As String = Util.LFExec("SELECT katId FROM nyheter WHERE nyId= " & NYID)



        If kategori = "1" Then
            CType(DetailsView1.Controls(0).FindControl("BtnLeggTilListe"), Button).Enabled = False
            CType(DetailsView1.Controls(0).FindControl("BtnLeggTilAvsnitt"), Button).Enabled = True
        ElseIf kategori = "2" Then
            CType(DetailsView1.Controls(0).FindControl("BtnLeggTilListe"), Button).Enabled = False
            CType(DetailsView1.Controls(0).FindControl("BtnLeggTilAvsnitt"), Button).Enabled = True
        ElseIf kategori = "3" Then
            CType(DetailsView1.Controls(0).FindControl("BtnLeggTilListe"), Button).Enabled = True
            CType(DetailsView1.Controls(0).FindControl("BtnLeggTilAvsnitt"), Button).Enabled = False
            CType(DetailsView1.Controls(0).FindControl("tbxIngress"), TextBox).Visible = False
        ElseIf kategori = "4" Then
            CType(DetailsView1.Controls(0).FindControl("BtnLeggTilListe"), Button).Enabled = True
            CType(DetailsView1.Controls(0).FindControl("BtnLeggTilAvsnitt"), Button).Enabled = True
            CType(DetailsView1.Controls(0).FindControl("tbxIngress"), TextBox).Visible = False
        ElseIf kategori = "5" Then
            CType(DetailsView1.Controls(0).FindControl("BtnLeggTilListe"), Button).Enabled = False
            CType(DetailsView1.Controls(0).FindControl("BtnLeggTilAvsnitt"), Button).Enabled = True
            CType(DetailsView1.Controls(0).FindControl("tbxIngress"), TextBox).Visible = False
        ElseIf kategori = "6" Then
            CType(DetailsView1.Controls(0).FindControl("BtnLeggTilListe"), Button).Enabled = True
            CType(DetailsView1.Controls(0).FindControl("BtnLeggTilAvsnitt"), Button).Enabled = False
            CType(DetailsView1.Controls(0).FindControl("tbxIngress"), TextBox).Visible = False
        ElseIf kategori = "7" Then
            CType(DetailsView1.Controls(0).FindControl("BtnLeggTilListe"), Button).Enabled = True
            CType(DetailsView1.Controls(0).FindControl("BtnLeggTilAvsnitt"), Button).Enabled = False
            CType(DetailsView1.Controls(0).FindControl("tbxIngress"), TextBox).Visible = False
        End If
    End Sub

    'Dersom siden åpnes uten en query ID settes siden til insert mode.
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsNumeric(Request.QueryString("ID")) Then
            DetailsView1.DefaultMode = DetailsViewMode.Edit


            CType(DetailsView1.Controls(0).FindControl("tbxIngress"), TextBox).Visible = True

            visKnapper()
        End If


    End Sub
    'Når en avbryter, sendes en tilbake til Nyhet.aspx med samme ID.
    Protected Sub LinkButton2_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        kategorivalg()


    End Sub

    'Når man oppdaterer kommer man tilbake til Nyhet.aspx med den samme ID
    Protected Sub DetailsView1_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdatedEventArgs) Handles DetailsView1.ItemUpdated
        kategorivalg()


    End Sub

    'Når en ny Nyhet opprettes, får den en ny ID, og man kommer til update modus for den Nyheten.
    Protected Sub DetailsView1_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertedEventArgs) Handles DetailsView1.ItemInserted
        Response.Redirect("~/Admin/Rediger.aspx?ID=" & Util.LFExec("SELECT IDENT_CURRENT('nyheter')"))
        visKnapper()

    End Sub



    'Brukervalgt fil lastes opp til server med ID som filnavn og databundet nøkkel oppdateres
    Protected Sub DetailsView1_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdateEventArgs) Handles DetailsView1.ItemUpdating
        Dim fbx As Object = CType(DetailsView1.Controls(0).FindControl("FileUpload1"), FileUpload)

        If fbx.HasFile And fbx.Visible Then
            If fbx.PostedFile.ContentType.ToLower.IndexOf("image") < 0 Or fbx.PostedFile.ContentLength > 8192000 Then
                e.Cancel = "true"
            Else
                Dim Ext As String = System.IO.Path.GetExtension(fbx.FileName).ToLower
                fbx.SaveAs(Server.MapPath("~/ImgNyhet\" & Request.QueryString("ID") & Ext))
                e.Keys.Item("bilde") = "~/ImgNyhet/" & Request.QueryString("ID") & Ext
            End If
        End If

        e.NewValues("bruker") = User.Identity.Name


    End Sub


    


    'Brukervalgt fil lastes opp til server og databundet nøkkel oppdateres
    Protected Sub DetailsView1_ItemInserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertEventArgs) Handles DetailsView1.ItemInserting

        Dim fbx As Object = CType(DetailsView1.Controls(0).FindControl("FileUpload1"), FileUpload)

        If fbx.HasFile Then
            If fbx.PostedFile.ContentType.ToLower.IndexOf("image") < 0 Or fbx.PostedFile.ContentLength > 8192000 Then
                e.Cancel = "true"
            Else
                fbx.SaveAs(Server.MapPath("ImgNyhet\" & fbx.FileName))
                e.Values.Item("bilde") = "~/ImgNyhet/" & fbx.FileName
            End If
        End If

        e.Values("bruker") = User.Identity.Name

    End Sub

    Protected Sub BtnLeggTilAvsnitt_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Response.Redirect("~/Admin/Avsnitt.aspx?ID=" & Request.QueryString("ID"))
    End Sub

    Protected Sub BtnLeggTilListe_Click(sender As Object, e As EventArgs)
        Response.Redirect("~/Admin/Liste.aspx?ID=" & Request.QueryString("ID"))
    End Sub

End Class
