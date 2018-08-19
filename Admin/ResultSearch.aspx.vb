
Partial Class Admin_ResultSearch
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load


        Dim Key As String = Request.QueryString("KEY")
        Dim Key2 As String = Request.QueryString("KEY2")
        Dim Key3 As String = Request.QueryString("KEY3") 'Søkenøkkel
        Dim ID As String = Request.QueryString("ID")        'Format ID
        Dim DL As String = " WHERE "
        Dim DL2 As String = " AND "
        Dim DL3 As String = " AND "
        Dim DL4 As String = " AND "         'Delimiter


        If IsNumeric(ID) AndAlso (ID) > 1 Then
            LFResultat.SelectCommand += DL & "(reservasjon.andelId = " & ID & ")"
        Else
            DL2 = " WHERE "
        End If


        'Legger til eventuell betingelseskontroll på formatkode
        If IsNumeric(Key) AndAlso (Key) > 0 Then
            LFResultat.SelectCommand += DL2 & "(reservasjon.betalt = " & Key & ")"
        ElseIf ID = 0 Then
            DL3 = " WHERE "
        End If

        If IsNumeric(Key2) AndAlso (Key2) > 0 Then
            LFResultat.SelectCommand += DL3 & "(reservasjon.sendtFaktura = " & Key2 & ")"
        ElseIf ID = 0 AndAlso Key = 0 Then
            DL4 = " WHERE "
        End If

        If IsNumeric(Key3) AndAlso (Key3) >= 0 Then
            LFResultat.SelectCommand += DL4 & "(reservasjon.godkjent = " & Key3 & ")"
        End If

        'Legger til sortering på reservasjon id
        LFResultat.SelectCommand += " ORDER BY reservasjon.resId"

    End Sub

   
    Protected Sub btnBack_Click(sender As Object, e As EventArgs) Handles btnBack.Click
        Response.Redirect("~/Admin/OversiktUtleie.aspx")
    End Sub

    Protected Sub btnSlett_Click(sender As Object, e As System.EventArgs)
        CType(FormView1.Controls(0).FindControl("lblMsg"), Label).Text = "BEKREFT AT DU ØNSKER Å SLETTE RESERVASJON MED ID: (" & Request.QueryString("ID") & ")"
        CType(FormView1.Controls(0).FindControl("btnBekreftSlett"), Button).Visible = True
    End Sub

    Protected Sub Button2_Click(sender As Object, e As System.EventArgs)
        Util.LFExec("DELETE FROM retid WHERE resId = " & Request.QueryString("ID"))
        Util.LFExec("DELETE FROM reservasjon WHERE resId = " & Request.QueryString("ID"))
        CType(FormView1.Controls(0).FindControl("lblMsg"), Label).Text = "SLETTET!"
        'CType(FormView1.Controls(0).FindControl("btnTilbakeTilSoek"), Button).Visible = True
        'CType(FormView1.Controls(0).FindControl("btnSlett"), Button).Visible = False
        'CType(FormView1.Controls(0).FindControl("btnBekreftSlett"), Button).Visible = False
        'CType(FormView1.Controls(0).FindControl("Button1"), Button).Visible = False
        Response.Redirect("~/Admin/OversiktUtleie.aspx")
    End Sub
End Class
