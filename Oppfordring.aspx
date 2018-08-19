<%@ page title="Lille Frogneseter - Oppfordring" language="VB" masterpagefile="~/MasterPage.master" autoeventwireup="false" CodeFile="~/Oppfordring.aspx.vb" inherits="Oppfordring" stylesheettheme="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
   
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="nyId" DataSourceID="LFOppfordring">
        
        <ItemTemplate>
           
               <h2> <asp:Label ID="tittelLabel" runat="server" Text='<%# Bind("tittel") %>' /></h2>
            <asp:Image ID="Image1" runat="server" CssClass="nyhetIMG" AlternateText ='<%# Bind("tittel") %>' ToolTip ='<%# Bind("ingress") %>' ImageUrl='<%# Eval("bilde") %>' />
              
           <div class ="right">
               <span class="dato">
                <asp:Label ID="brukerLabel" runat="server" Text='<%# Bind("bruker") %>' />
                /<asp:Label ID="datoLabel" runat="server" Text='<%# Bind("dato", "{0:d}")%>' />
            </span>
            <h3><asp:Label ID="ingressLabel" runat="server" Text='<%# Bind("ingress") %>' /></h3>
           </div>
                 </ItemTemplate>
    </asp:FormView>
 <br />
  <asp:ListView ID="ListView1" runat="server" DataKeyNames="listeId" DataSourceID="LFOppfordringListe">
                <ItemTemplate>
                  <ul><li>
                    <asp:Label ID="tekstLabel" runat="server" Text='<%# Eval("tekst") %>' />
                    </li></ul>
                   
                </ItemTemplate>
                </asp:ListView>
  
    
      <br />
     <asp:LoginView ID="LoginView1" runat="server">
        <RoleGroups>
            <asp:RoleGroup Roles="Admin">
                <ContentTemplate>

                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Admin/Rediger.aspx?ID=4" CssClass="hyperlink">Rediger</asp:HyperLink>

                </ContentTemplate>
            </asp:RoleGroup>
        </RoleGroups>
    </asp:LoginView>



    <br />
    
    <asp:SqlDataSource ID="LFOppfordringListe" runat="server" ConnectionString="<%$ ConnectionStrings:lillefrognerConnectionString %>" SelectCommand="SELECT * FROM [liste] WHERE ([nyId] = @nyId)">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="4" Name="nyId" QueryStringField="ID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
  
    <asp:SqlDataSource ID="LFOppfordring" runat="server" ConnectionString="<%$ ConnectionStrings:lillefrognerConnectionString %>" SelectCommand="SELECT * FROM [nyheter] WHERE ([nyId] = @nyId)">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="4" Name="nyId" QueryStringField="ID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    
    
    
  
</asp:Content>
