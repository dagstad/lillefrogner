<%@ Page Title="Lille Frogneseter - Nyheter" Language="VB" MasterPageFile="~/MasterPage.master"
    AutoEventWireup="false" CodeFile="Nyheter.aspx.vb" Inherits="Nyheter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <h2>
        TOP 5 NYHETER</h2>
    <br />
    <div class="wide">
        <asp:DataList ID="DataList1" runat="server" DataKeyField="nyId" DataSourceID="LFNyheter"
            RepeatLayout="Flow" ShowFooter="False" ShowHeader="False" RepeatDirection="Horizontal"
            Width="660px" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
            Font-Underline="False" HorizontalAlign="Left" RepeatColumns="2">
            <ItemTemplate>
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("nyId", "Nyhet.aspx?ID={0}") %>'>
                    <hr />
                    <h3>
                        <asp:Label ID="tittelLabel" runat="server" Text='<%# Eval("tittel") %>' /></h3>
                    <span class="dato">
                        <asp:Label ID="brukerLabel" runat="server" Text='<%# Eval("bruker") %>' />
                        /&nbsp;-
                        <asp:Label ID="datoLabel" runat="server" Text='<%# Eval("dato", "{0:d}") %>' /></span>
                    <br />
                    <asp:Image ID="Image1" runat="server" CssClass="oversiktTumb" ImageUrl='<%# Util.imgURL(Eval("bilde","{0}"), "~/Elementer/styre.jpg")%>' />
                    &nbsp;<asp:Label ID="ingressLabel" runat="server" Text='<%# Eval("ingress") %>' />
                    <br />
                    <span class="hjelpeTekst">Les mer...</span>
                </asp:HyperLink>
                <br />
                <hr />
            </ItemTemplate>
            <SeparatorStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                Font-Underline="False" />
        </asp:DataList>
        <br />
    </div>
      <asp:LoginView ID="LoginView1" runat="server">
        <RoleGroups>
            <asp:RoleGroup Roles="Admin">
                <ContentTemplate>

                   
                        <a href="Admin/Rediger.aspx" class="hyperlink">Legg til nyhet</a> |
                    

                </ContentTemplate>
            </asp:RoleGroup>
        </RoleGroups>
    </asp:LoginView>
    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/NyhetArkiv.aspx" CssClass="hyperlink">Arkiv</asp:HyperLink>|<asp:HyperLink
        ID="HyperLink3" runat="server" NavigateUrl="~/AlleNyheter.aspx" CssClass="hyperlink">Se alle Nyheter</asp:HyperLink>
    <asp:SqlDataSource ID="LFNyheter" runat="server" ConnectionString="<%$ ConnectionStrings:lillefrognerConnectionString %>"
        SelectCommand="SELECT TOP 5 * FROM [nyheter] WHERE ([katId] = @katId) AND ([arkiv] = 0) ORDER BY [dato] DESC">
        <SelectParameters>
            <asp:Parameter Name="katId" Type="Int32" Size="1" DefaultValue="1" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
