<%@ page title="" language="VB" masterpagefile="~/MasterPage.master" autoeventwireup="false" CodeFile="~/Sitemap.aspx.vb" inherits="Sitemap" stylesheettheme="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

   <h2>
        Sidekart</h2>
    <br />
    <div class="wide">
        <asp:TreeView ID="TreeView1" runat="server" DataSourceID="SiteMapDataSource1" ImageSet="Arrows">
            <HoverNodeStyle Font-Underline="True" ForeColor="#5555DD" />
            <NodeStyle Font-Names="Tahoma" Font-Size="10pt" ForeColor="Black" HorizontalPadding="5px"
                NodeSpacing="0px" VerticalPadding="0px" />
            <ParentNodeStyle Font-Bold="False" />
            <SelectedNodeStyle Font-Underline="True" ForeColor="#5555DD" HorizontalPadding="0px"
                VerticalPadding="0px" />
        </asp:TreeView>
    </div>
    <asp:SiteMapDataSource ID="SiteMapDataSource1" runat="server" />


</asp:Content>

