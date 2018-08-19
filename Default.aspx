<%@ page title="Lille Frogneseter - Hjem" language="VB" masterpagefile="~/MasterPage.master" autoeventwireup="false" CodeFile="Default.aspx.vb"inherits="_Default" stylesheettheme="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
<asp:panel ID="Panel1" ScrollBars="Auto" runat="server" Height="600px" CssClass="panel"> 
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="nyId" DataSourceID="LFForside">

        <ItemTemplate>
            <h2>
                <asp:Image ID="Image1" runat="server" CssClass="forsideIMG" ImageUrl='<%# Eval("bilde") %>' />

                <asp:Label ID="ingressLabel" runat="server" Text='<%# Bind("ingress") %>' BorderStyle="None" /></h2>

            <hr class="clear" />
            <span class="dato">Skrevet av:
                <asp:Label ID="brukerLabel" runat="server" Text='<%# Bind("bruker") %>' />
                /
            <asp:Label ID="datoLabel" runat="server" Text='<%# Bind("dato", "{0:d}")%>' /></span>


        </ItemTemplate>
    </asp:FormView>

    <asp:DataList ID="DataList1" runat="server" DataKeyField="avsnittId" DataSourceID="LFAvsnitt" RepeatLayout="Flow" ShowFooter="False" ShowHeader="False">
        <ItemTemplate>
            <asp:Label ID="tekstLabel" runat="server" Text='<%# Eval("tekst") %>' />
            <br />
        </ItemTemplate>
    </asp:DataList>
    </asp:panel>
    <br />
    <br />
    <asp:LoginView ID="LoginView1" runat="server">
        <RoleGroups>
            <asp:RoleGroup Roles="Admin">
                <ContentTemplate>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Admin/Rediger.aspx?ID=2" CssClass="hyperlink ">Rediger</asp:HyperLink>
                </ContentTemplate>
            </asp:RoleGroup>
        </RoleGroups>
    </asp:LoginView>


    <asp:SqlDataSource ID="LFAvsnitt" runat="server" ConnectionString="<%$ ConnectionStrings:lillefrognerConnectionString %>" SelectCommand="SELECT * FROM [avsnitt] WHERE ([nyId] = @nyId)">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="2" Name="nyId" QueryStringField="ID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>



    <asp:SqlDataSource ID="LFForside" runat="server" ConnectionString="<%$ ConnectionStrings:lillefrognerConnectionString %>" SelectCommand="SELECT * FROM [nyheter] WHERE ([nyId] = @nyId)">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="2" Name="nyId" QueryStringField="ID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>


</asp:Content>

