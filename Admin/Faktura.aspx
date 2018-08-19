<%@ page title="Lille Frogneseter - Faktura" language="VB" masterpagefile="~/MasterPage.master"  CodeFile="~/Admin/Faktura.aspx.vb" autoeventwireup="false" inherits="Admin_Faktura" stylesheettheme="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <h2>
        FAKTURA</h2>
    <strong>Trykk på VIS til høyre for hver reservasjon, for å se reservasjonen du vil sende
        faktura på.</strong>
    <hr />
   
    <div  class="wide">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="resId,andelId1"
            DataSourceID="LFGridFaktura" GridLines="None" EmptyDataText="INGEN FLERE RESERVASJONER TIL FAKTURERING!">
            <Columns>
                <asp:BoundField DataField="resId" HeaderText="Res.ID" InsertVisible="False"
                    ReadOnly="True" SortExpression="resId">
                    <ItemStyle Wrap="False" CssClass="GridCellClear" />
                    <HeaderStyle HorizontalAlign="Left" CssClass="GridHeadStyle" />
                </asp:BoundField>
               <%-- <asp:BoundField DataField="fornavn" HeaderText="Fornavn" SortExpression="fornavn">
                    <ItemStyle Wrap="False" CssClass="GridCellClear"  />
                    <HeaderStyle HorizontalAlign="Left" CssClass="GridHeadStyle" />
                </asp:BoundField>--%>
                <asp:BoundField DataField="etternavn" HeaderText="Etternavn" SortExpression="etternavn">
                    <ItemStyle Wrap="False" CssClass="GridCellClear"  />
                    <HeaderStyle HorizontalAlign="Left" CssClass="GridHeadStyle" />
                </asp:BoundField>
                <asp:BoundField DataField="epost" HeaderText="E-post" SortExpression="epost">
                    <ItemStyle Wrap="False" CssClass="GridCellClear"  />
                    <HeaderStyle HorizontalAlign="Left" CssClass="GridHeadStyle" />
                </asp:BoundField>
                <asp:HyperLinkField DataNavigateUrlFields="resId" DataNavigateUrlFormatString="~/Admin/Faktura.aspx?ID={0}"
                    Text="VIS">
                    <ItemStyle Wrap="False" CssClass="GridCellClear" />
                </asp:HyperLinkField>
            </Columns>
            <PagerSettings Mode="NumericFirstLast" />
            <PagerStyle CssClass="GridFootStyle" HorizontalAlign="Center" />
            <HeaderStyle CssClass="GridHeadStyle" />
            <AlternatingRowStyle CssClass="textbglt" />
        </asp:GridView>
        </div>
  
    
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="resId,andelId1" DataSourceID="LFGodkjenn"
        Visible="False" CssClass="soknadbox">
        <ItemTemplate>
            Reservasjons ID : (<asp:Label ID="resIdLabel" runat="server" Text='<%# Eval("resId") %>' />
            )<br />
            Andelseier:
            <asp:Label ID="fornavnLabel" runat="server" Text='<%# Bind("fornavn") %>' />
            ,
            <asp:Label ID="etternavnLabel" runat="server" Text='<%# Bind("etternavn") %>' />
            <br />
            Epost:
            <asp:Label ID="epostLabel" runat="server" Text='<%# Bind("epost")%>' />
            <br />
            For følgende dager:<br />
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="retidId" DataSourceID="LFLeideDager">
                <ItemSeparatorTemplate>
                </ItemSeparatorTemplate>
                <ItemTemplate>
                    <li style="">
                        <asp:Label ID="resdatoLabel" runat="server" Text='<%# Eval("resdato", "{0:d}")%>' />
                    </li>
                </ItemTemplate>
                <LayoutTemplate>
                    <ul id="itemPlaceholderContainer" runat="server" style="list-style-type: circle">
                        <li runat="server" id="itemPlaceholder" />
                    </ul>
                    <div style="">
                    </div>
                </LayoutTemplate>
            </asp:ListView>
            Antall netter:
            <asp:Label ID="lblAntall" runat="server"></asp:Label><br />
            Sum:
            <asp:Label ID="lblSum" runat="server"></asp:Label>
            <br />
            <asp:Button ID="btnSend" runat="server" OnClick="btnSend_Click" Text="Send Faktura"
                SkinID="Button1" />
            &nbsp;<asp:Button ID="btnAvbryt" runat="server" PostBackUrl="javascript:history.go(-1)"
                SkinID="Button1" Text="Avbryt" />
        </ItemTemplate>
    </asp:FormView>
    <asp:Label ID="lblFerdig" runat="server"></asp:Label>
    <%--</div>--%>
    <br />
    <asp:Label ID="lblPris" runat="server" Visible="False" />
    <asp:Label ID="lblEpost" runat="server" Visible="False" />
    <asp:Label ID="lblKonto" runat="server" Visible="False" />
    <asp:SqlDataSource ID="LFLeideDager" runat="server" ConnectionString="<%$ ConnectionStrings:lillefrognerConnectionString %>"
        SelectCommand="SELECT * FROM [retid] WHERE ([resId] = @resId)">
        <SelectParameters>
            <asp:ControlParameter ControlID="FormView1" Name="resId" PropertyName="SelectedValue"
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="LFGodkjenn" runat="server" ConnectionString="<%$ ConnectionStrings:lillefrognerConnectionString %>"
        SelectCommand="SELECT * FROM [reservasjon] INNER JOIN [andelseiere] ON andelseiere.andelId = reservasjon.andelId WHERE ([resId] = @resId)">
        <SelectParameters>
            <asp:QueryStringParameter Name="resId" QueryStringField="ID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="LFGridFaktura" runat="server" ConnectionString="<%$ ConnectionStrings:lillefrognerConnectionString %>"
        SelectCommand="SELECT * FROM ([reservasjon] INNER JOIN [andelseiere] ON andelseiere.andelId = reservasjon.andelId) WHERE reservasjon.sendtFaktura = 1 AND reservasjon.godkjent = 2">
        <DeleteParameters>
            <asp:Parameter Name="resId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="andelId" Type="Int32" />
            <asp:Parameter DbType="Date" Name="oppdato" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="andelId" Type="Int32" />
            <asp:Parameter DbType="Date" Name="oppdato" />
            <asp:Parameter Name="resId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
