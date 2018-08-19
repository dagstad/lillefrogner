<%@ page title="" language="VB" masterpagefile="~/MasterPage.master" autoeventwireup="false"  CodeFile="~/Admin/RegistrerBetaling.aspx.vb" inherits="Admin_RegistrerBetaling" stylesheettheme="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2>REGISTRER BETALING</h2>
    <p><strong>Viser oversikt over reservasjoner som er godkjent og det er sendtfaktura på.</strong></p>
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="resId,andelId1" DataSourceID="LFBetaling" EmptyDataText="INGEN RESERVASJONER Å REGISTRERE SOM BETALT IGJEN!">
        <Columns>
            <asp:BoundField DataField="resId" HeaderText="Res Id" InsertVisible="False" ReadOnly="True" SortExpression="resId" >
                <ItemStyle Wrap="False" CssClass="GridCellClear" />
                <HeaderStyle HorizontalAlign="Left" CssClass="GridHeadStyle" />
            </asp:BoundField>
            <asp:BoundField DataField="andelId" HeaderText="Andel Id" SortExpression="andelId">
                <ItemStyle Wrap="False" CssClass="GridCellClear" />
                <HeaderStyle HorizontalAlign="Left" CssClass="GridHeadStyle" />
            </asp:BoundField>
            <asp:BoundField DataField="bruker" HeaderText="Bruker" SortExpression="bruker" >
                <ItemStyle Wrap="False" CssClass="GridCellClear" />
                <HeaderStyle HorizontalAlign="Left" CssClass="GridHeadStyle" />
            </asp:BoundField>
            <asp:BoundField DataField="fornavn" HeaderText="Fornavn" SortExpression="fornavn" >
                <ItemStyle Wrap="False" CssClass="GridCellClear" />
                <HeaderStyle HorizontalAlign="Left" CssClass="GridHeadStyle" />
            </asp:BoundField>
            <asp:BoundField DataField="etternavn" HeaderText="Etternavn" SortExpression="etternavn" >
                <ItemStyle Wrap="False" CssClass="GridCellClear" />
                <HeaderStyle HorizontalAlign="Left" CssClass="GridHeadStyle" />
            </asp:BoundField>
            
            <asp:HyperLinkField DataNavigateUrlFields="ResId" DataNavigateUrlFormatString="~/Admin/RegistrerBetaling.aspx?ID={0}" 
                Text="VIS" >
             <ItemStyle Wrap="False" CssClass="GridCellClear" />
            </asp:HyperLinkField>

        </Columns>
            <PagerSettings Mode="NumericFirstLast" />
        <PagerStyle CssClass="GridFootStyle" HorizontalAlign="Center"  />
        <HeaderStyle CssClass="GridHeadStyle"  />
        <AlternatingRowStyle CssClass="textbglt" />
            
        
    </asp:GridView>
    <br />
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="resId" DataSourceID="LFReservasjon" CssClass="soknadbox">
       
        <ItemTemplate>
            Reservasjons Id: <asp:Label ID="resIdLabel" runat="server" Text='<%# Eval("resId") %>' />
            <br />
            <br />
            Bruker:
            <asp:Label ID="brukerLabel" runat="server" Text='<%# Bind("bruker") %>' />
            <br />
            Navn:<asp:Label ID="fornavnLabel" runat="server" Text='<%# Bind("fornavn") %>' />
            ,&nbsp;<asp:Label ID="etternavnLabel" runat="server" Text='<%# Bind("etternavn") %>' />
            <br />
            <br />
            <asp:Button ID="btnBetalt" runat="server" Text="Registrer Betaling" OnClick="btnBetalt_Click" />
            &nbsp;<asp:Button ID="btnAvbryt" runat="server" PostBackUrl="javascript:history.go(-1)" Text="Avbryt" />
            <br />

        </ItemTemplate>
    </asp:FormView>

    <asp:SqlDataSource ID="LFReservasjon" runat="server" ConnectionString="<%$ ConnectionStrings:lillefrognerConnectionString %>" 
        SelectCommand="SELECT reservasjon.resId, reservasjon.andelId, andelseiere.bruker, andelseiere.fornavn, andelseiere.etternavn FROM [reservasjon] JOIN [andelseiere] ON andelseiere.andelId = reservasjon.andelId WHERE ([resId] = @resId)">
        <SelectParameters>
            <asp:QueryStringParameter Name="resId" QueryStringField="ID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="LFBetaling" runat="server" ConnectionString="<%$ ConnectionStrings:lillefrognerConnectionString %>" 
        SelectCommand="SELECT * FROM [reservasjon] JOIN andelseiere ON andelseiere.andelId = reservasjon.andelId WHERE (([betalt] = @betalt) AND ([godkjent] = @godkjent) AND ([sendtFaktura] = @sendtFaktura))">
        <SelectParameters>
            <asp:Parameter DefaultValue="1" Name="betalt" Type="Int32" />
            <asp:Parameter DefaultValue="2" Name="godkjent" Type="Int32" />
            <asp:Parameter DefaultValue="2" Name="sendtFaktura" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>

