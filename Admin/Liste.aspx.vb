
Partial Class Admin_Liste
    Inherits System.Web.UI.Page


    Protected Sub BtnFerdig_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnFerdig.Click
        Dim NYID As Integer = Request.QueryString("ID")
        Dim kategori As String = Convert.ToString(Util.LFExec("SELECT katId FROM nyheter WHERE nyId= " & NYID))
        If kategori = 1 Then
            Response.Redirect("~/Nyhet.aspx?ID=" & Request.QueryString("ID"))
        ElseIf kategori = 2 Then
            Response.Redirect("~/Default.aspx?ID=" & Request.QueryString("ID"))
        ElseIf kategori = 3 Then
            Response.Redirect("~/Vedtekter.aspx?ID=" & Request.QueryString("ID"))
        ElseIf kategori = 4 Then
            Response.Redirect("~/Oppfordring.aspx?ID=" & Request.QueryString("ID"))
        ElseIf kategori = 5 Then
            Response.Redirect("~/Vannpumpe.aspx?ID=" & Request.QueryString("ID"))
        ElseIf kategori = 6 Then
            Response.Redirect("~/Hytteregler.aspx?ID=" & Request.QueryString("ID"))
        ElseIf kategori = 7 Then
            Response.Redirect("~/Utleieregler.aspx?ID=" & Request.QueryString("ID"))
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then
            UpdateListe()
            btnNew.Enabled = True
            If tbxListePunkt.Text = "" And tbxOverskrift.Text = "" Then
                btnBlank.Enabled = False
            End If
        End If
    End Sub


    Protected Sub BtnAvbryt_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnAvbryt.Click
        Response.Redirect("~/Admin/Rediger.aspx?ID=" & Request.QueryString("ID"))
    End Sub

    'Databinder lbxRoller og reinitierer tekstbokser og knapper
    Protected Sub UpdateListe()
        tbxOverskrift.Text = ""
        tbxListePunkt.Text = ""
        btnEdit.Enabled = False
        btnDelete.Enabled = False
        btnUnderliste.Enabled = False
        btnUnderliste0.Enabled = False
        lbxListe.DataBind()
        lbxUnderliste.DataBind()
    End Sub

    'Ved valg av rolle oppdateres tekstbokser og knapper aktiveres
    Protected Sub lbxListe_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles lbxListe.SelectedIndexChanged
        Dim LID As String = lbxListe.SelectedValue
        tbxOverskrift.Text = Util.LFExec("SELECT overskrift FROM liste WHERE listeId = " & LID)
        tbxListePunkt.Text = Util.LFExec("SELECT tekst FROM liste WHERE listeId = " & LID)
        btnEdit.Enabled = True
        btnDelete.Enabled = True
        btnUnderliste.Enabled = True
        btnUnderliste0.Enabled = True
        btnNew.Enabled = False
        btnBlank.Enabled = True
    End Sub

    'Endrer aktiv listepunkt
    Protected Sub btnEdit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEdit.Click
        If tbxListePunkt.Text = "" Then Exit Sub
        Util.LFExec("UPDATE liste SET tekst = '" & tbxListePunkt.Text & "', overskrift = '" & tbxOverskrift.Text & "' WHERE listeId = " & lbxListe.SelectedValue)
        UpdateListe()
    End Sub

    'Sletter aktiv liste med underlister tilknyttet
    Protected Sub btnDelete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnDelete.Click

        
        Dim ListeID As String = lbxListe.SelectedValue
      
        'Teller forekomster av underlister knyttet til liste (ListeID)

        Dim ULCN As Integer = CInt(Util.LFExec("SELECT COUNT(*) FROM underListe WHERE listeId = " & ListeID))
        If ULCN = 0 Then
            'Sum kryssreferanser er lik 0
            lblMsg.Text = "Det er ingen underlister tilknyttet denne listen"
        Else
            'Antall kryssreferanser oppføres i label lblMSG
            If ULCN > 0 Then lblMsg.Text = "&nbsp;" & ULCN & " underlister vil bli slettet til valgt listepunkt og selve listepunktet<br/>"
        End If

        lblMsg.Visible = True
        btnDelete0.Visible = True
        btnAvbryt0.Visible = True


    End Sub




    'Oppretter en ny liste
    Protected Sub btnNew_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnNew.Click
        If tbxListePunkt.Text = "" Then Exit Sub
       
        Util.LFExec("INSERT INTO liste (nyId, overskrift, tekst) VALUES (" & Request.QueryString("ID") & ", '" & tbxOverskrift.Text & "', '" & tbxListePunkt.Text & "' )")

        UpdateListe()


    End Sub

    Protected Sub btnUnderliste_Click(sender As Object, e As EventArgs) Handles btnUnderliste.Click, btnUnderliste0.Click
        Dim LID As String = lbxListe.SelectedValue

        Response.Redirect("~/Admin/Underliste.aspx?ID=" & LID)
    End Sub

    Protected Sub btnDelete0_Click(sender As Object, e As EventArgs) Handles btnDelete0.Click
        Dim ListeID As String = lbxListe.SelectedValue
        Util.LFExec("DELETE FROM underListe WHERE listeId = " & ListeID)
        Util.LFExec("DELETE FROM liste WHERE listeId = " & lbxListe.SelectedValue)
        Response.Redirect("Liste.aspx?ID=" & Request.QueryString("ID"))
    End Sub

    Protected Sub btnAvbryt0_Click(sender As Object, e As EventArgs) Handles btnAvbryt0.Click
        Response.Redirect("Liste.aspx?ID=" & Request.QueryString("ID"))
    End Sub

    Protected Sub btnBlank_Click(sender As Object, e As EventArgs) Handles btnBlank.Click
        Response.Redirect("~/Admin/Liste.aspx?ID= " & Request.QueryString("ID"))
    End Sub

End Class
