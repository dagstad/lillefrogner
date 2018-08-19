<%@ page title="Lille Frogneseter - Nyhetsarkiv" language="VB" masterpagefile="~/MasterPage.master" autoeventwireup="false" CodeFile="~/NyhetArkiv.aspx.vb" inherits="NyhetArkiv" stylesheettheme="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2>Arkiv Nyheter:</h2>

    <asp:LoginView ID="LoginView1" runat="server">
        <RoleGroups>
            <asp:RoleGroup Roles="Admin">
                <ContentTemplate>
                    <p class="hjelpeTekst">For å aktivisere en nyhete igjen, kan du klikke på lenken og vise den.
                        <br />
                        Deretter kan du redigere den. Da vil status som arkivert bli borte,
                        <br />
                        og den vises som en normal nyhet igjen.</p>
                </ContentTemplate>
            </asp:RoleGroup>
        </RoleGroups>
    </asp:LoginView>
   <br />    

    <asp:DataList ID="DataList2" runat="server" DataSourceID="LFNyhetArkiv" DataKeyField="nyId" RepeatLayout="Flow" ShowFooter="False" ShowHeader="False">
        <ItemTemplate>
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Eval("nyId", "Nyhet.aspx?ID={0}")%>'>
                <asp:Label ID="datoLabel" runat="server" Text='<%# Eval("dato", "{0:d}") %>' CssClass="dato" />&nbsp;-&nbsp;
                <asp:Label ID="tittelLabel" runat="server" Text='<%# Eval("tittel") %>' CssClass="nyhetListeTekst" />
            </asp:HyperLink></ItemTemplate></asp:DataList><asp:SqlDataSource ID="LFNyhetArkiv" runat="server" ConnectionString="<%$ ConnectionStrings:lillefrognerConnectionString %>"
        SelectCommand="SELECT [nyId], [tittel], [dato] FROM [nyheter] WHERE [arkiv] = 1 ORDER BY [dato] DESC"></asp:SqlDataSource>

</asp:Content>

