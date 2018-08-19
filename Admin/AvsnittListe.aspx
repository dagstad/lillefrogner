<%@ page title="Lille Frogneseter - Avsnitt-Liste" language="VB" masterpagefile="~/MasterPage.master"  CodeFile="AvsnittListe.aspx.vb" autoeventwireup="false" inherits="Admin_AvsnittListe" stylesheettheme="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2>LEGG TIL LISTE TIL AVSNITT</h2>
    <br />
    <p class ="hjelpeTekst ">Lister som er lagt til:</p>
    <asp:ListBox ID="lbxListe" runat="server" AutoPostBack="True" DataSourceID="LFLister" DataTextField="tekst" DataValueField="listeId" Width="400px"/>
    <asp:SqlDataSource ID="LFLister" runat="server" ConnectionString="<%$ ConnectionStrings:lillefrognerConnectionString %>" SelectCommand="SELECT * FROM [liste] WHERE ([nyId] = @nyId)">
        <SelectParameters>
            <asp:QueryStringParameter Name="nyId" QueryStringField="ID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:TextBox ID="tbxListe" runat="server" TextMode="MultiLine" Rows="5" Width="400px" />
    <br />
    <asp:Button ID="btnLagre" runat="server" Text="Lagre" />

</asp:Content>

