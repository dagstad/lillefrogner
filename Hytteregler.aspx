<%@ page title="Lille Frogneseter - Hytteregler" language="VB" masterpagefile="~/MasterPage.master" autoeventwireup="false" CodeFile="~/Hytteregler.aspx.vb" inherits="Hytteregler" stylesheettheme="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
<asp:panel ID="Panel1" ScrollBars="Auto" runat="server" Height="600px" CssClass="panel">
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="nyId" DataSourceID="LFHytteregler">

        <ItemTemplate>

            <h2>
                <asp:Label ID="tittelLabel" runat="server" Text='<%# Eval("tittel") %>' /></h2>

            <asp:Image ID="Image1" runat="server" CssClass="nyhetImg" ImageUrl='<%# Eval("bilde") %>' />
            <br />
            <br />
            <br />
            <div class="clear"></div>
            <span class="dato">
                <asp:Label ID="brukerLabel" runat="server" Text='<%# Bind("bruker") %>' />
                /<asp:Label ID="datoLabel" runat="server" Text='<%# Bind("dato", "{0:d}")%>' />
            </span>
        </ItemTemplate>
    </asp:FormView>

    <%--    <asp:ListView ID="ListView1" runat="server" DataKeyNames="listeId" DataSourceID="LFReglerListe">

                <ItemTemplate>

                    <li style="list-style-type: decimal;">
                        <asp:Label ID="overskriftLabel" runat="server"   Text='<%# Eval("overskrift") %>' Font-Bold="True" />
                        <br />
                        <asp:Label ID="tekstLabel" runat="server" Text='<%# Eval("tekst") %>' />
                    </li>
                    <br />
                </ItemTemplate>
                <LayoutTemplate>
                    <ul id="itemPlaceholderContainer" runat="server" style="">
                        <li runat="server" id="itemPlaceholder" />
                    </ul>
                    <div style="">
                    </div>
                </LayoutTemplate>
            </asp:ListView>--%>




    <asp:DataList ID="DataList1" runat="server" DataKeyField="listeId" DataSourceID="LFReglerListe" RepeatLayout="Flow" ShowFooter="False">
        <ItemTemplate>
            <asp:Label ID="listeIdLabel" runat="server" Text='<%# Eval("listeId") %>' Visible="False" />

            <h3>
                <asp:Label ID="overskriftLabel" runat="server" Text='<%# Eval("overskrift") %>' /></h3>

            <p>
                <asp:Label ID="tekstLabel" runat="server" Text='<%# Eval("tekst") %>' />
            </p>

            <asp:ListView ID="ListView1" runat="server" DataKeyNames="underListeId" DataSourceID="LFUnderliste">

                <ItemTemplate>
                    <li style="list-style-type: none;">
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

                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Admin/Rediger.aspx?ID=6" CssClass="hyperlink">Rediger</asp:HyperLink>

                </ContentTemplate>
            </asp:RoleGroup>
        </RoleGroups>
    </asp:LoginView>
    <%--    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="hyperlink">Rediger</asp:LinkButton>--%>



    <asp:SqlDataSource ID="LFHytteregler" runat="server" ConnectionString="<%$ ConnectionStrings:lillefrognerConnectionString %>" SelectCommand="SELECT * FROM [nyheter] WHERE ([nyId] = @nyId)">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="6" Name="nyId" QueryStringField="ID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="LFReglerListe" runat="server" ConnectionString="<%$ ConnectionStrings:lillefrognerConnectionString %>" SelectCommand="SELECT * FROM [liste] WHERE ([nyId] = @nyId)">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="6" Name="nyId" QueryStringField="ID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
