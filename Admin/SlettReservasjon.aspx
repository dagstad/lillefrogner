<%@ Page Title="Lille Frogneseter - Slett reservasjon" Language="VB" MasterPageFile="~/MasterPage.master" CodeFile="SlettReservasjon.aspx.vb" AutoEventWireup="false"  Inherits="Admin_SlettReservasjon" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<h2>ENDRE RESERVASJONER</h2>
    <br />
    <p class="hjelpeTekst">Her vises alle reservasjoner uavhengig av status. <br /> 
    Status 1 er Søknad<br />
    Status 2 er Godkjent søknad<br />
    Status 3 er Avvist søknad<br />
    Velg en reservasjon du ønsker å avvise. Andelseier mottar mail om at reservasjonen er avvist.<br />
    Du kan også aktivisere en avvist søknad om det er ledig på hytta.<br />
    Ønsker du å slette reservasjoner helt, må du gå på Admin-Søk. Der kan man slette reservasjonen helt.</p>
    <br />
 
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" DataKeyNames="resId" 
        DataSourceID="LFReservasjoner" BorderStyle="None" GridLines="None">
        <Columns>
            <asp:BoundField DataField="resId" HeaderText="ResId" InsertVisible="False" 
                ReadOnly="True" SortExpression="resId" >
                 <ItemStyle Wrap="False" CssClass="GridCellClear" />
                    <HeaderStyle HorizontalAlign="Left" CssClass="GridHeadStyle" />
                </asp:BoundField>
            <asp:BoundField DataField="andelId" HeaderText="AndelId" 
                SortExpression="andelId" >
                 <ItemStyle Wrap="False" CssClass="GridCellClear" />
                    <HeaderStyle HorizontalAlign="Left" CssClass="GridHeadStyle" />
                </asp:BoundField>
            <asp:BoundField DataField="godkjent" HeaderText="Status" 
                SortExpression="godkjent" />
            <asp:BoundField DataField="fraUke" HeaderText="Fra Uke" 
                SortExpression="fraUke" >
                 <ItemStyle Wrap="False" CssClass="GridCellClear" />
                    <HeaderStyle HorizontalAlign="Left" CssClass="GridHeadStyle" />
                </asp:BoundField>
            <asp:BoundField DataField="tilUke" HeaderText="Til Uke" 
                SortExpression="tilUke" >
                 <ItemStyle Wrap="False" CssClass="GridCellClear" />
                    <HeaderStyle HorizontalAlign="Left" CssClass="GridHeadStyle" />
                </asp:BoundField>
            <asp:HyperLinkField DataNavigateUrlFields="resId" 
                DataNavigateUrlFormatString="~/Admin/Reserver.aspx?ID={0}" Text="VIS" >
                <ItemStyle Wrap="False" CssClass="GridCellClear" />
                </asp:hyperlinkfield>
        </Columns>
           <PagerSettings Mode="NumericFirstLast" />
            <PagerStyle CssClass="GridFootStyle" HorizontalAlign="Center" />
            <HeaderStyle CssClass="GridHeadStyle" />
            <AlternatingRowStyle CssClass="textbglt" />
    </asp:GridView>
    <br />
    
  
    <asp:SqlDataSource ID="LFReservasjoner" runat="server" 
        ConnectionString="<%$ ConnectionStrings:lillefrognerConnectionString %>" 
        SelectCommand="SELECT * FROM [reservasjon]"></asp:SqlDataSource>
   
</asp:Content>

