<%@ page title="Lille Frogneseter - Alle Nyheter" language="VB" masterpagefile="~/MasterPage.master" autoeventwireup="false" CodeFile="~/AlleNyheter.aspx.vb" inherits="Admin_AlleNyheter" stylesheettheme="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2>ALLE NYHETER</h2>
    <br />
    <asp:DataList ID="DataList2" runat="server" DataSourceID="LFNyhetArkiv" DataKeyField="nyId" RepeatLayout="Flow" ShowFooter="False" ShowHeader="False">
        <ItemTemplate>
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Eval("nyId", "Nyhet.aspx?ID={0}")%>'>
                <asp:Label ID="datoLabel" runat="server" Text='<%# Eval("dato", "{0:d}") %>' CssClass="dato" />&nbsp;-&nbsp;
                <asp:Label ID="tittelLabel" runat="server" Text='<%# Eval("tittel") %>' CssClass="nyhetListeTekst" />
            </asp:HyperLink></ItemTemplate></asp:DataList><asp:SqlDataSource ID="LFNyhetArkiv" runat="server" ConnectionString="<%$ ConnectionStrings:lillefrognerConnectionString %>"
        SelectCommand="SELECT [nyId], [tittel], [dato] FROM [nyheter] WHERE [arkiv] = 0 AND [nyId] > 7 ORDER BY [dato] DESC"></asp:SqlDataSource>

</asp:Content>

