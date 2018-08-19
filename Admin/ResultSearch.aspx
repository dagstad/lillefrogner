<%@ Page Title="Lille Frogneseter - Resultat Søk" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="ResultSearch.aspx.vb" Inherits="Admin_ResultSearch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2>RESULTAT SØK</h2>
    <br />

     <p class="hjelpeTekst">Her vises alle reservasjoner du har søkt på. <br /> 
     Godkjent statuser:<br />
    Status 1 er Søknad<br />
    Status 2 er Godkjent søknad<br />
    Status 3 er Avvist søknad<br />
   Her kan du også slette reservasjoner!</p>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="resId" DataSourceID="LFResultat" EmptyDataText="INGEN RESERVASJONER ETTER DINE SØKE KRITERIER FUNNET!" GridLines="None">
        <Columns>
            <asp:BoundField DataField="andelId" HeaderText="Andel" 
                SortExpression="andelId" >
            </asp:BoundField>
            <asp:BoundField DataField="resId" HeaderText="Reservasjons Id" SortExpression="resId" InsertVisible="False" ReadOnly="True" >
            </asp:BoundField>
            <asp:BoundField DataField="godkjent" HeaderText="Godkjent" 
                SortExpression="godkjent" >
            </asp:BoundField>
            <asp:BoundField DataField="bruker" HeaderText="Bruker" SortExpression="bruker" >
            </asp:BoundField>
            <asp:BoundField DataField="fornavn" HeaderText="Fornavn" 
                SortExpression="fornavn" >
            </asp:BoundField>
             <asp:BoundField DataField="etternavn" HeaderText="Etternavn" 
                SortExpression="etternavn" />
            <asp:HyperLinkField DataNavigateUrlFields="resId" 
                DataNavigateUrlFormatString="~/Admin/ResultSearch.aspx?ID={0}" Text="SLETT" />
        </Columns>
        <PagerSettings Mode="NumericFirstLast" />
        <PagerStyle CssClass="GridFootStyle" HorizontalAlign="Center"  />
        <HeaderStyle CssClass="GridHeadStyle"  />
        <AlternatingRowStyle CssClass="textbglt" />
    </asp:GridView>
    <br />
    <asp:Button ID="btnBack" runat="server" Text="Tilbake til Søk" />

    <br />
     <asp:FormView ID="FormView1" runat="server" DataKeyNames="resId,andelId1" Width="75%" DataSourceID="LFSlett" CssClass="soknadbox">
        <ItemTemplate>
            Reservasjons ID : (<asp:Label ID="resIdLabel" runat="server" Text='<%# Bind("resId") %>' />
            )<br />
            Andelseier:
            <asp:Label ID="fornavnLabel" runat="server" Text='<%# Bind("fornavn") %>' />
            ,
            <asp:Label ID="etternavnLabel" runat="server" Text='<%# Bind("etternavn") %>' />
            <br />
            Epost:
            <asp:Label ID="epostLabel" runat="server" Text='<%# Bind("epost")%>' />

            <br />
            Reservert for følgende dager:
            <br />
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="retidId" DataSourceID="LFresDager">

                <ItemTemplate>
                    <span style="">
                        <asp:Label ID="resdatoLabel" runat="server" Text='<%# Bind("resdato", "{0:d}")%>' />
                        <br />
                    </span>
                </ItemTemplate>
                <LayoutTemplate>
                    <div id="itemPlaceholderContainer" runat="server" style="">
                        <span runat="server" id="itemPlaceholder" />
                    </div>
                    <div style="">
                    </div>
                </LayoutTemplate>

            </asp:ListView>
            <br />
            <asp:Label ID="lblAntall" runat="server"></asp:Label>
           
            <br />
            <asp:Button ID="btnSlett" runat="server" OnClick="btnSlett_Click" Text="Slett" SkinID="Button1" />&nbsp;
            &nbsp;<asp:Button ID="Button1" runat="server" PostBackUrl="javascript:history.go(-1)" SkinID="Button1" Text="Avbryt" />
            <br />
            <asp:Label ID="lblMsg" runat="server" />
            &nbsp;<asp:Button ID="btnBekreftSlett" runat="server" onclick="Button2_Click" 
                Text="Bekreft" Visible="False"  /> 
            <br />

        </ItemTemplate>
    </asp:FormView>

     <asp:SqlDataSource ID="LFSlett" runat="server" ConnectionString="<%$ ConnectionStrings:lillefrognerConnectionString %>" SelectCommand="SELECT * FROM [reservasjon] INNER JOIN [andelseiere] ON andelseiere.andelId = reservasjon.andelId WHERE ([resId] = @resId)">
        <SelectParameters>
            <asp:QueryStringParameter Name="resId" QueryStringField="ID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

     <asp:SqlDataSource ID="LFresDager" runat="server" ConnectionString="<%$ ConnectionStrings:lillefrognerConnectionString %>" SelectCommand="SELECT * FROM [retid] WHERE ([resId] = @resId)">
        <SelectParameters>
            <asp:QueryStringParameter Name="resId" QueryStringField="ID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="LFResultat" runat="server" ConnectionString="<%$ ConnectionStrings:lillefrognerConnectionString %>" 
        SelectCommand="SELECT reservasjon.andelId, reservasjon.resId, reservasjon.godkjent, andelseiere.bruker, andelseiere.fornavn, andelseiere.etternavn FROM [reservasjon] JOIN [andelseiere] ON andelseiere.andelId = reservasjon.andelId"></asp:SqlDataSource>

</asp:Content>

