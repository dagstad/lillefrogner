<%@ page title="Lille Frogneseter - Vannpumpe" language="VB" masterpagefile="~/MasterPage.master" autoeventwireup="false"  CodeFile="~/Vannpumpe.aspx.vb" inherits="Vannpumpe" stylesheettheme="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
<asp:panel ID="Panel1" ScrollBars="Auto" runat="server" Height="600px" CssClass="panel">
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="nyId" DataSourceID="LFVannpumpe">

        <ItemTemplate>
            <h2>
                <asp:Label ID="tittelLabel" runat="server" Text='<%# Bind("tittel") %>' /></h2>


            <br />
            <span class="dato">
                <asp:Label ID="brukerLabel" runat="server" Text='<%# Bind("bruker") %>' />

                &nbsp;/&nbsp;<asp:Label ID="datoLabel" runat="server" Text='<%# Bind("dato", "{0:d}")%>' /></span>
            <br />
            <br />
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="avsnittId" DataSourceID="LFVannpumpeAvsnitt">

                <ItemTemplate>
                    <asp:Label ID="tekstLabel" runat="server" Text='<%# Eval("tekst") %>' />
                    <br />
                    <br />
                </ItemTemplate>

            </asp:ListView>
            <asp:Image ID="Image1" runat="server" CssClass="nyhetImg" ImageUrl='<%# Eval("bilde") %>' />



        </ItemTemplate>
    </asp:FormView>
    </asp:panel>

    <br />
    <asp:LoginView ID="LoginView1" runat="server">
        <RoleGroups>
            <asp:RoleGroup Roles="Admin">
                <ContentTemplate>

                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Admin/Rediger.aspx?ID=5" CssClass="hyperlink">Rediger</asp:HyperLink>

                </ContentTemplate>
            </asp:RoleGroup>
        </RoleGroups>
    </asp:LoginView>


    <asp:SqlDataSource ID="LFVannpumpeAvsnitt" runat="server" ConnectionString="<%$ ConnectionStrings:lillefrognerConnectionString %>" SelectCommand="SELECT * FROM [avsnitt] WHERE ([nyId] = @nyId)">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="5" Name="nyId" QueryStringField="ID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>


    <asp:SqlDataSource ID="LFVannpumpe" runat="server" ConnectionString="<%$ ConnectionStrings:lillefrognerConnectionString %>" SelectCommand="SELECT * FROM [nyheter] WHERE ([nyId] = @nyId)">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="5" Name="nyId" QueryStringField="ID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>





</asp:Content>
