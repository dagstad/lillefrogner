
Partial Class Admin_OversiktUtleie
    Inherits System.Web.UI.Page

    Protected Sub RadbtnLstFaktura_SelectedIndexChanged(sender As Object, e As EventArgs) Handles RadbtnLstFaktura.SelectedIndexChanged
        lblFakturaSvar.Text = RadbtnLstFaktura.SelectedItem.Text
    End Sub

    Protected Sub RadBtnLstBet_SelectedIndexChanged(sender As Object, e As EventArgs) Handles RadBtnLstBet.SelectedIndexChanged
        lblBetalSvar.Text = RadBtnLstBet.SelectedItem.Text
    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownList1.SelectedIndexChanged
        lblBruker.Text = DropDownList1.SelectedItem.Text
    End Sub

    Protected Sub DropDownList1_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList1.DataBound
        sender.Items.FindByValue("1").Text = "Andelseier"
    End Sub

    Protected Sub BtnSearch_Click(sender As Object, e As EventArgs) Handles BtnSearch.Click
        Response.Redirect("~/Admin/ResultSearch.aspx?ID=" & Server.UrlEncode(DropDownList1.SelectedValue) & "&KEY=" & Server.UrlEncode(RadBtnLstBet.SelectedValue) & "&KEY2=" & Server.UrlEncode(RadbtnLstFaktura.SelectedValue) & "&KEY3=" & Server.UrlEncode(RadBtnLstAvvist.SelectedValue))

    End Sub

    Protected Sub RadBtnLstAvvist_SelectedIndexChanged(sender As Object, e As EventArgs) Handles RadBtnLstAvvist.SelectedIndexChanged
        lblAvvist.Text = RadBtnLstAvvist.SelectedItem.Text
    End Sub

    Protected Sub btnReset_Click(sender As Object, e As EventArgs) Handles btnReset.Click
        Response.Redirect("~/Admin/OversiktUtleie.aspx")
    End Sub

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Page.MaintainScrollPositionOnPostBack = True
    End Sub
End Class
