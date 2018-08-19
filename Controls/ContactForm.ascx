<%@ Control Language="VB" AutoEventWireup="false" CodeFile="ContactForm.ascx.vb" Inherits="Controls_WebUserControl" %>
<table  runat ="server" id ="FormTable" style="border: thin solid #C0C0C0">
    <tr>
        <td colspan="3">
            <h2>Kontakt styret:</h2>
        </td>
    </tr>
    <tr>
        <td>Navn</td>
        <td>
            <asp:TextBox ID="tbxName" runat="server" Width="400px"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbxName" CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="Skriv inn navnet ditt">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>E-post</td>
        <td>
            <asp:TextBox ID="tbxEpost" runat="server" Width="400px"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbxEpost" CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="Skriv inn E-post adresse">*</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tbxEpost" CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="Skriv en gyldig E-post adresse" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td>Gjenta E-post</td>
        <td>
            <asp:TextBox ID="tbxGjentaEpost" runat="server" Width="400px"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="tbxGjentaEpost" CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="Bekreft E-post adressen">*</asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="tbxGjentaEpost" ControlToValidate="tbxEpost" CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="Gjenta E-post adressen">*</asp:CompareValidator>
        </td>
    </tr>
    <tr>
        <td>Melding</td>
        <td>
            <asp:TextBox ID="tbxKommentar" runat="server" Height="131px" TextMode="MultiLine" Width="400px"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="tbxKommentar" CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="Skriv inn din melding">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td colspan="3">
            <asp:Button ID="btnSend" runat="server" Text="Send" />
        </td>
    </tr>
    <tr>
        <td colspan="3">
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
        </td>
    </tr>
    </table>

<asp:Label ID="Messages" runat="server" Text="Melding er sendt til styret i Lille Frogneseter." Visible ="false" ></asp:Label>
