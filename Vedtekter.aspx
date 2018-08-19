<%@ page title="Lille Frogneseter - Vedtekter" language="VB" masterpagefile="~/MasterPage.master" autoeventwireup="false" CodeFile="~/Vedtekter.aspx.vb" inherits="Vedtekter" stylesheettheme="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
<asp:panel ScrollBars="Vertical" runat="server" Height="600px" CssClass="panel"> 
    <asp:FormView ID="FormView1" runat="server" DataSourceID="LFOverskrift">
        <ItemTemplate>
            <h2>
                <asp:Label ID="tittelLabel" runat="server" Text='<%# Bind("tittel") %>' /></h2>
        </ItemTemplate>
    </asp:FormView>

    <asp:DataList ID="DataList1" runat="server" DataKeyField="listeId" DataSourceID="LFVedtekter" RepeatLayout="Flow" ShowFooter="False" ShowHeader="False">
        <ItemTemplate>
            <asp:Label ID="listeIdLabel" runat="server" Text='<%# Eval("listeId") %>' Visible="False" />

            <h3>
                <asp:Label ID="overskriftLabel" runat="server" Text='<%# Eval("overskrift") %>' /></h3>

            <p>
                <asp:Label ID="tekstLabel" runat="server" Text='<%# Eval("tekst") %>' />
            </p>

            <asp:ListView ID="ListView1" runat="server" DataKeyNames="underListeId" DataSourceID="LFUnderliste">

                <ItemTemplate>
                    <li style="">
                        <asp:Label ID="tekstLabel" runat="server" Text='<%# Eval("tekst") %>' />
                    </li>
                </ItemTemplate>
                <LayoutTemplate>
                    <ul id="itemPlaceholderContainer" runat="server" style="">
                        <li runat="server" id="itemPlaceholder" />
                    </ul>
                    <div style="">
                    </div>
                </LayoutTemplate>

            </asp:ListView>
            <asp:SqlDataSource ID="LFUnderliste" runat="server" ConnectionString="<%$ ConnectionStrings:lillefrognerConnectionString %>" SelectCommand="SELECT * FROM [underListe] WHERE ([listeId] = @listeId)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="listeIdLabel" Name="listeId" PropertyName="Text" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>

        </ItemTemplate>
    </asp:DataList>
    </asp:panel>
    <asp:LoginView ID="LoginView1" runat="server">
        <RoleGroups>
            <asp:RoleGroup Roles="Admin">
                <ContentTemplate>

                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Admin/Rediger.aspx?ID=3" CssClass="hyperlink">Rediger</asp:HyperLink>

                </ContentTemplate>
            </asp:RoleGroup>
        </RoleGroups>
    </asp:LoginView>


    <asp:SqlDataSource ID="LFOverskrift" runat="server" ConnectionString="<%$ ConnectionStrings:lillefrognerConnectionString %>" SelectCommand="SELECT [tittel] FROM [nyheter] WHERE ([nyId] = @nyId)">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="3" Name="nyId" QueryStringField="ID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="LFVedtekter" runat="server" ConnectionString="<%$ ConnectionStrings:lillefrognerConnectionString %>" SelectCommand="SELECT * FROM [liste]  WHERE ([nyId] = @nyId)">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="3" Name="nyId" QueryStringField="ID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>



</asp:Content>

