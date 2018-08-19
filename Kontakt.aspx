<%@ page title="Lille Frogneseter - Kontakt" language="VB" masterpagefile="~/MasterPage.master" autoeventwireup="false" CodeFile="~/Kontakt.aspx.vb" inherits="Kontakt" stylesheettheme="Default" %>

<%@ Register Src="~/Controls/ContactForm.ascx" TagPrefix="uc1" TagName="ContactForm" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2>KONTAKT SKJEMA</h2>
    <br />
    <p>Send oss en tilbakemelding. OBS! Ikke for hyttereservering. Det kan du gjøre her: <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Users/Utleie.aspx" ForeColor="Blue">Reservasjon</asp:HyperLink></p>
    <uc1:ContactForm runat="server" ID="ContactForm" />

</asp:Content>

