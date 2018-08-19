<%@ Page Title="Lille Frogneseter - Liste" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Liste.aspx.vb" Inherits="Admin_Liste" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <h2>LISTER</h2>
    <br />
    <strong>Overskrift:</strong>
    <br />
    <asp:TextBox ID="tbxOverskrift" runat="server" Width="300px"></asp:TextBox>
    <br />
    <strong>Liste-punkt:</strong>


    <asp:TextBox ID="tbxListePunkt" runat="server" Width="75%" Rows="3" TextMode="MultiLine"></asp:TextBox>
    <br />
    <asp:Button ID="btnNew" runat="server" SkinID="Button1" Text="Opprett" />
    &nbsp;<asp:Button ID="btnEdit" runat="server" Enabled="False" SkinID="Button1" 
        Text="Lagre" />
    &nbsp;<br />
    <asp:Button ID="btnBlank" runat="server" SkinID="Button1" Text="Blank ut felt for å legge til nytt listepunkt." Width="375px" />
    <br />
    <br />
    <p class="hjelpeTekst">Listepunkter lagt til:</p>
    <asp:ListBox ID="lbxListe" runat="server" DataSourceID="LFListe" DataTextField="tekst" DataValueField="listeId" Width="75%" AutoPostBack="True" Rows="8"></asp:ListBox>

    <br />
    <asp:Button ID="btnDelete" runat="server" Enabled="False" SkinID="Button1" Text="Slett" />
    &nbsp;
    <asp:Label ID="lblMsg" runat="server" ForeColor="Red" Text="Label" Visible="False"></asp:Label>
    &nbsp;<asp:Button ID="btnDelete0" runat="server" Text="Slett" Visible="False" SkinID="Button1" />
    &nbsp;<asp:Button ID="btnAvbryt0" runat="server" Text="Avbryt" Visible="False" SkinID="Button1" />
    <br />
    <asp:Button ID="btnUnderliste0" runat="server" Enabled="False" SkinID="Button1" Text="Legg til underliste til valgt listepunkt over" />
    <br />
    <p class="hjelpeTekst">Velg et listepunkt over, som du ønsker å legge underliste til.</p>
    <br />
    <hr />

    <p class="hjelpeTekst">Eksisterende underliste(r) til listepunkt du valgte over:</p>

    <asp:ListBox ID="lbxUnderliste" runat="server" AutoPostBack="True" DataSourceID="LFUnderlister" DataTextField="tekst" DataValueField="underListeId" Width="75%"></asp:ListBox>
    <br />
    <asp:Button ID="btnUnderliste" runat="server" SkinID="Button1" Text="Endre underliste til valgt listepunkt over" Enabled="False" />
    <br />
    <br />



    <asp:Button ID="BtnAvbryt" runat="server" Text="Avbryt" SkinID="Button1" />&nbsp;<asp:Button ID="BtnFerdig" runat="server" Text="Ferdig" SkinID="Button1" />


    <asp:SqlDataSource ID="LFDetailListe" runat="server" ConnectionString="<%$ ConnectionStrings:lillefrognerConnectionString %>" DeleteCommand="DELETE FROM [liste] WHERE [listeId] = @listeId" InsertCommand="INSERT INTO [liste] ([nyId], [overskrift], [tekst]) VALUES (@nyId, @overskrift, @tekst)" SelectCommand="SELECT * FROM [liste] WHERE ([listeId] = @listeId)" UpdateCommand="UPDATE [liste] SET [nyId] = @nyId, [overskrift] = @overskrift, [tekst] = @tekst WHERE [listeId] = @listeId">
        <DeleteParameters>
            <asp:Parameter Name="listeId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="nyId" Type="Int32" />
            <asp:Parameter Name="overskrift" Type="String" />
            <asp:Parameter Name="tekst" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="lbxListe" Name="listeId" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="nyId" Type="Int32" />
            <asp:Parameter Name="overskrift" Type="String" />
            <asp:Parameter Name="tekst" Type="String" />
            <asp:Parameter Name="listeId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="LFListe" runat="server" ConnectionString="<%$ ConnectionStrings:lillefrognerConnectionString %>" SelectCommand="SELECT * FROM [liste] WHERE ([nyId] = @nyId)">
        <SelectParameters>
            <asp:QueryStringParameter Name="nyId" QueryStringField="ID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="LFValgtListePunkt" runat="server" ConnectionString="<%$ ConnectionStrings:lillefrognerConnectionString %>" SelectCommand="SELECT * FROM [liste] WHERE ([nyId] = @nyId)">
        <SelectParameters>
            <asp:QueryStringParameter Name="nyId" QueryStringField="ID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="LFUnderlister" runat="server" ConnectionString="<%$ ConnectionStrings:lillefrognerConnectionString %>" SelectCommand="SELECT * FROM [underListe] WHERE ([listeId] = @listeId)">
        <SelectParameters>
            <asp:ControlParameter ControlID="lbxListe" Name="listeId" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>

