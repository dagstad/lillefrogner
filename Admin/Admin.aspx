<%@ Page Title="Lille Frogneseter - Admin" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Admin.aspx.vb" Inherits="Admin_Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

   <h2 >VELKOMMEN TIL ADMINISTRATORSIDEN.</h2>
   <strong> Her kan du godkjenne reservasjoner, administrere faktura, oversikt over andelseiere osv. </strong>
    <br />
<br />
<table style ="width:650px">
<tr>
<td><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Admin/Reserver.aspx" CssClass="hyperlink" >Administrer Søknader</asp:HyperLink></td>
<td><asp:HyperLink ID="HyperLink10" runat="server" NavigateUrl="~/Admin/SlettReservasjon.aspx" CssClass="hyperlink">Endre Søknader</asp:HyperLink></td>
<td><asp:HyperLink ID="HyperLink8" runat="server" NavigateUrl="~/Admin/OversiktUtleie.aspx" CssClass="hyperlink">Oversikt utleie (Søk)</asp:HyperLink></td>
</tr>
<tr>
<td colspan = "3"></td>
</tr>
<tr>
<td><asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Admin/Faktura.aspx" CssClass="hyperlink">Administrer Fakturaer</asp:HyperLink></td>
<td colspan ="2"><asp:HyperLink ID="HyperLink9" runat="server" NavigateUrl="~/Admin/RegistrerBetaling.aspx" CssClass="hyperlink">Registrer Betaling</asp:HyperLink></td>
</tr>
<tr>
<td colspan = "3"></td>
</tr>
<tr>
<td><asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="~/Admin/Andelseiere.aspx" CssClass="hyperlink">Administrer Andelseiere</asp:HyperLink></td>
<td colspan ="2"><asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/Admin/Users.aspx" CssClass="hyperlink">Legg til brukere</asp:HyperLink></td>
</tr>
<tr>
<td colspan = "3"></td>
</tr>
<tr>
<td ><asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Admin/Bildegalleri.aspx" CssClass="hyperlink">Administrer Bilder</asp:HyperLink></td>
<td ><asp:HyperLink ID="HyperLink7" runat="server" NavigateUrl="~/Admin/Rediger.aspx" CssClass="hyperlink">Legg til Nyhet</asp:HyperLink></td>
</tr>
<tr>
<td colspan = "3"></td>
</tr>
<tr>
<td colspan = "3"><asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/Admin/Konfigurer.aspx" CssClass="hyperlink">Administrer E-post, kontonummer og pris</asp:HyperLink></td>
</tr>
</table>
   


</asp:Content>

