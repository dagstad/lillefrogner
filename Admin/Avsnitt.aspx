<%@ Page Title="Lille Frogneseter - Avsnitt" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Avsnitt.aspx.vb" Inherits="Admin_Avsnitt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">

    <h2>AVSNITT</h2>
    <br />
   
    
    <p class="hjelpeTekst">Heading på avsnittet:(valgfritt)</p>
    <asp:TextBox ID="tbxHeading" runat="server" Width="300px"></asp:TextBox>
    <br />
    <br />
    <p class="hjelpeTekst">Avsnitt:(Skriv her for å lage et nytt avsnitt, trykk deretter Opprett)</p>
    <asp:TextBox ID="tbxAvsnitt" runat="server" Width="75%" Rows="8" TextMode="MultiLine"></asp:TextBox>
    <br />
    <asp:Button ID="btnNew" runat="server" Text="Opprett" SkinID="Button1" />

    &nbsp;
    <asp:Button ID="btnEdit" runat="server" Text="Lagre" SkinID="Button1" 
        Enabled="False" />&nbsp;<asp:Button ID="btnBlank" runat="server" SkinID="Button1" Text="Blank ut felt" />


    <br />
    <p class="hjelpeTekst">
        Velg et avsnitt fra denne listen. Den vil dukke opp i boksen &#39;Avsnitt&#39;Over. 
    <br />
        Trykk &#39;Slett&#39; for å slette avsnittet, eller endre teksten i boksen
        &#39;Avsnitt&#39; og trykk endre.<br />
        Ønsker du å legge til et nytt, skriver du inn
        ny tekst i &#39;Avsnitt&#39;
        <br />
        og eventuelt &#39;Heading&#39; og trykk så &#39;Endre&#39;.
    </p>
    <br />

    <asp:ListBox ID="lbxAvsnitt" runat="server" AutoPostBack="True" DataSourceID="LFLboxAvsnitt" DataTextField="tekst" DataValueField="avsnittId" Width="75%" Rows="10"></asp:ListBox>

    <br />
    <asp:Button ID="btnDelete" runat="server" Text="Slett" SkinID="Button1" />

    &nbsp;<asp:Button ID="btnUnderliste" runat="server" SkinID="Button1" Text="Legg til underliste" Enabled="False" />

    <br />
    <br />

    <asp:Button ID="BtnAvbryt" runat="server" SkinID="Button1" Text="Avbryt" />
    &nbsp;<asp:Button ID="BtnFerdig" runat="server" SkinID="Button1" Text="Ferdig" />

    <br />
    <asp:SqlDataSource ID="LFLboxAvsnitt" runat="server" ConnectionString="<%$ ConnectionStrings:lillefrognerConnectionString %>" SelectCommand="SELECT * FROM [avsnitt] WHERE ([nyId] = @nyId)">
        <SelectParameters>
            <asp:QueryStringParameter Name="nyId" QueryStringField="ID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="LFDvAvsnitt" runat="server" ConnectionString="<%$ ConnectionStrings:lillefrognerConnectionString %>" DeleteCommand="DELETE FROM [avsnitt] WHERE [avsnittId] = @avsnittId" InsertCommand="INSERT INTO [avsnitt] ([nyId], [heading], [tekst]) VALUES (@nyId, @heading, @tekst)" SelectCommand="SELECT * FROM [avsnitt] WHERE ([avsnittId] = @avsnittId)" UpdateCommand="UPDATE [avsnitt] SET [nyId] = @nyId, [heading] = @heading, [tekst] = @tekst WHERE [avsnittId] = @avsnittId">
        <DeleteParameters>
            <asp:Parameter Name="avsnittId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="nyId" Type="Int32" />
            <asp:Parameter Name="heading" Type="String" />
            <asp:Parameter Name="tekst" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="lbxAvsnitt" Name="avsnittId" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="nyId" Type="Int32" />
            <asp:Parameter Name="heading" Type="String" />
            <asp:Parameter Name="tekst" Type="String" />
            <asp:Parameter Name="avsnittId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>




</asp:Content>

