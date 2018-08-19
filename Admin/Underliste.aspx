<%@ Page Title="Lille Frogneseter - Underliste" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Underliste.aspx.vb" Inherits="Admin_Underliste" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2>UNDERLISTE</h2>
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="listeId" DataSourceID="LFValgtListePunkt" Width="75%">
   
        <ItemTemplate>
            
           <asp:Label ID="listeIdLabel" runat="server" Text='<%# Eval("listeId") %>' Visible="False" />
            <br />
            <asp:Label ID="nyIdLabel" runat="server" Text='<%# Bind("nyId") %>' Visible="False" />
            <br />
            <p class="hjelpeTekst">Dette er liste-punktet du ønsker å legge til underliste til:</p> 
            <br />
            <span class="brukerBoxUtleie">
                <h4>
                    <asp:Label ID="overskriftLabel" runat="server" Text='<%# Bind("overskrift") %>' /></h4>
                <p>
                    <asp:Label ID="tekstLabel" runat="server" Text='<%# Bind("tekst") %>' />
                </p>
            </span>
        </ItemTemplate>
    </asp:FormView>
    
   
    <br />
      <p class="hjelpeTekst">Disse underlistepunktene eksisterer for valgte listepunkt. <br />Velg i boksen her for å endre et eksisterende underlistepunkt</p>
    
    <asp:ListBox ID="lbxUnderlister" runat="server" AutoPostBack="True" DataSourceID="LFUnderliste" DataTextField="tekst" DataValueField="underListeId" Width="75%"></asp:ListBox>
    
    <br />
    <asp:Button ID="btnDelete" runat="server" Text="Slett" SkinID="Button1" Enabled="False" />
    <br />
   
    
    <p class="hjelpeTekst">Legg til tekst til Underliste her,<br /> eller endre det underlistepunktet du valgte over:</p>
    <asp:TextBox ID="tbxUnderliste" runat="server" Rows="3" TextMode="MultiLine" Width="75%"></asp:TextBox>
    <br />
    <asp:Button ID="BtnNew" runat="server" Text="Opprett" SkinID="Button1" />&nbsp;<asp:Button 
        ID="btnEdit" runat="server" Text="Lagre" SkinID="Button1" Enabled="False" />
    &nbsp;<asp:Button ID="btnBlank" runat="server" SkinID="Button1" Text="Blank ut felt for å legge til nytt punkt" />
   
    <br />
    <asp:Button ID="btnTilbake" runat="server" SkinID="Button1" Text="Tilbake" />

    <asp:SqlDataSource ID="LFValgtListePunkt" runat="server" ConnectionString="<%$ ConnectionStrings:lillefrognerConnectionString %>" SelectCommand="SELECT * FROM [liste] WHERE ([listeId] = @listeId)">
        <SelectParameters>
            <asp:QueryStringParameter Name="listeId" QueryStringField="ID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="LFUnderliste" runat="server" ConnectionString="<%$ ConnectionStrings:lillefrognerConnectionString %>" SelectCommand="SELECT * FROM [underListe] WHERE ([listeId] = @listeId)">
        <SelectParameters>
            <asp:ControlParameter ControlID="FormView1" Name="listeId" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    
    <br />
    </asp:Content>

