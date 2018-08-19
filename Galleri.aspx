<%@ page title="Lille Frogneseter - Galleri" language="VB" masterpagefile="~/MasterPage.master" autoeventwireup="false" CodeFile="~/Galleri.aspx.vb" inherits="Galleri" stylesheettheme="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <h2>Bildegalleri</h2>



    <asp:FormView ID="FormView1" runat="server" DataKeyNames="bildeId" DataSourceID="LFViseBilde">

        <ItemTemplate>
            <asp:Image ID="Image2" runat="server" CssClass="storeIMG" ImageUrl='<%# Eval("bilde") %>' AlternateText='<%# Eval("tittel")%>' ToolTip='<%# Eval("tittel")%>' />
            <br />
            <asp:Label ID="Label1" runat="server" Text='<%# Eval("tittel")%>' />
            <br />
        </ItemTemplate>
    </asp:FormView>
    <hr style="color: #0000FF" />
    <asp:DataList ID="DataList1" runat="server" DataKeyField="bildeId" DataSourceID="LFBilder" RepeatDirection="Horizontal" RepeatLayout="Flow" ShowFooter="False" ShowHeader="False">
        <ItemTemplate>
            <asp:HyperLink ID="HyperLink2" NavigateUrl='<%# Eval("bildeId", "Galleri.aspx?ID={0}")%>' runat="server">
                <asp:Image ID="Image1" runat="server" CssClass="oversiktTumb" ImageUrl='<%# Eval("bilde") %>' />
            </asp:HyperLink>
        </ItemTemplate>
    </asp:DataList>
    <br />
    <strong>Klikk på det bildet du vil se!</strong>

    <br />
    <br />
    <br />


    <asp:LoginView ID="LoginView1" runat="server">
        <RoleGroups>
            <asp:RoleGroup Roles="Admin">
                <ContentTemplate>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Admin/Bildegalleri.aspx" CssClass="hyperlink">Administrer bilder</asp:HyperLink>
                </ContentTemplate>
            </asp:RoleGroup>
        </RoleGroups>
    </asp:LoginView>


    <asp:SqlDataSource ID="LFBilder" runat="server"
        ConnectionString="<%$ ConnectionStrings:lillefrognerConnectionString %>"
        SelectCommand="SELECT * FROM [bilder]"></asp:SqlDataSource>


    <br />
    <asp:SqlDataSource ID="LFViseBilde" runat="server" ConnectionString="<%$ ConnectionStrings:lillefrognerConnectionString %>"
        SelectCommand="SELECT * FROM [bilder] WHERE ([bildeId] = @bildeId)">
        <SelectParameters>
            <asp:QueryStringParameter Name="bildeId" QueryStringField="ID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>


</asp:Content>

