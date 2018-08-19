<%@ page title="Lille Frogneseter - Nyhet" language="VB" masterpagefile="~/MasterPage.master" autoeventwireup="false" CodeFile="~/Nyhet.aspx.vb" inherits="Nyhet" stylesheettheme="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:panel ID="Panel1" ScrollBars="Vertical" runat="server" Height="600px" CssClass="panel">
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="nyId,katId1" DataSourceID="LFNyhet">

        <ItemTemplate>
            <h2>
                <asp:Label ID="tittelLabel" runat="server" Text='<%# Bind("tittel") %>' /></h2>

            <asp:Image ID="Image1" runat="server" AlternateText='<%# Eval("tittel")%>' ImageUrl='<%# Util.imgURL(Eval("bilde","{0}"), "~/Elementer/styre.jpg")%>' ToolTip='<%# Eval("tittel") %>' CssClass="nyhetIMG" />

            <div class="right">
                <span class="dato">
                    <br />
                    <asp:Label ID="brukerLabel" runat="server" Text='<%# Bind("bruker") %>' />
                    /<asp:Label ID="datoLabel" runat="server" Text='<%# Bind("dato", "{0:d}")%>' />
                </span>
                <h3>
                    <asp:Label ID="ingressLabel" runat="server" Text='<%# Bind("ingress") %>' /></h3>
            </div>

            <br />
        </ItemTemplate>
    </asp:FormView>

    <br />

    <asp:DataList ID="DataList1" runat="server" DataKeyField="avsnittId" DataSourceID="LFDatalistAvsnitt">
        <ItemTemplate>
            <h3>
                <asp:Label ID="headingLabel" runat="server" Text='<%# Eval("heading") %>' /></h3>
            <br />
            <asp:Label ID="tekstLabel" runat="server" Text='<%# Eval("tekst") %>' />
            <br />
            <br />
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="listeId,avsnittId1" DataSourceID="LFListe">

                <ItemTemplate>
                    <span style="">


                        <asp:Label ID="tekstLabel" runat="server" Text='<%# Eval("tekst") %>' />
                        <br />

                        <br />
                    </span>
                </ItemTemplate>
                <LayoutTemplate>
                    <div style="" id="itemPlaceholderContainer" runat="server">
                        <span runat="server" id="itemPlaceholder" />
                    </div>
                    <div style="">
                    </div>
                </LayoutTemplate>

            </asp:ListView>
            <asp:SqlDataSource ID="LFListe" runat="server" ConnectionString="<%$ ConnectionStrings:lillefrognerConnectionString %>"
                SelectCommand="SELECT * FROM [liste] JOIN avsnitt ON avsnitt.avsnittId = liste.avsnittID WHERE ((liste.avsnittID = @avsnittId1) AND (liste.nyId = @nyId))">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DataList1" Name="avsnittID" PropertyName="SelectedValue" Type="Int32" />
                    <asp:QueryStringParameter Name="nyId" QueryStringField="ID" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <br />

        </ItemTemplate>
    </asp:DataList>
    </asp:panel>
    <hr />
    <asp:LoginView ID="LoginView1" runat="server">
        <RoleGroups>
            <asp:RoleGroup Roles="Admin">
                <ContentTemplate>

                    <p>
                        <a href="Admin/Rediger.aspx" class="hyperlink">Legg til nyhet</a> |
                        <asp:LinkButton ID="LinkButton3" runat="server" CssClass="hyperlink" OnClick="LinkButton3_Click">Legg Nyhet i Arkiv</asp:LinkButton>|
                        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="hyperlink" OnClick="LinkButton1_Click">Endre nyhet</asp:LinkButton>|
                        <asp:LinkButton ID="LinkButton2" runat="server" CssClass="hyperlink" OnClick="LinkButton2_Click">Slett nyhet</asp:LinkButton>
                        <br />
                        <br />
                        &nbsp;
                        <asp:Label ID="lblSlett" runat="server" ForeColor="Red"></asp:Label>&nbsp;
                        <asp:LinkButton ID="lbBekreft" runat="server" CssClass="hyperlink" Visible="False" OnClick="lbBekreft_Click">Bekreft Sletting</asp:LinkButton>
                        <asp:LinkButton ID="lbAvbryt" runat="server" CssClass="hyperlink " Visible="false" PostBackUrl="javascript:history.go(-1)">Avbryt</asp:LinkButton>
                    </p>

                </ContentTemplate>
            </asp:RoleGroup>
        </RoleGroups>
    </asp:LoginView>


    <asp:SqlDataSource ID="LFNyhet" runat="server" ConnectionString="<%$ ConnectionStrings:lillefrognerConnectionString %>"
        SelectCommand="SELECT * FROM [nyheter] JOIN [kategori] ON nyheter.katId = kategori.katId WHERE ([nyId] = @nyId)">
        <SelectParameters>
            <asp:QueryStringParameter Name="nyId" QueryStringField="ID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="LFDatalistAvsnitt" runat="server" ConnectionString="<%$ ConnectionStrings:lillefrognerConnectionString %>"
        SelectCommand="SELECT * FROM [avsnitt] WHERE ([nyId] = @nyId)">
        <SelectParameters>
            <asp:QueryStringParameter Name="nyId" QueryStringField="ID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>

