<%@ page title="Lille Frogneseter - Bildegalleri" language="VB" masterpagefile="~/MasterPage.master" CodeFile="~/Admin/Bildegalleri.aspx.vb" autoeventwireup="false" inherits="Admin_Bildegalleri" stylesheettheme="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <h2>BILDEGALLERI</h2>
    <br />
    <br />
    <p class="hjelpeTekst">Her kan du legge til nye bilder i albumet. Nedenfor kan du slette bilder i albumet.</p>

    <asp:Label ID="lblMsg" runat="server" ForeColor="Blue" Font-Bold="True" />

    <br />

    <asp:ListView ID="ListView1" runat="server" DataKeyNames="bildeId" DataSourceID="LFListeBilder" InsertItemPosition="LastItem">

        <InsertItemTemplate>
            <li style="">
                <br />
                <br />
                <strong>Her kan du legge til bilde!</strong>
                <br />
                <br />
                <hr />
                <strong>Velg bilde!</strong>
                <br />
                <asp:FileUpload ID="FileUpload2" runat="server" />
                <br />
                <br />
                <strong>Skriv inn en tittel til bildet!</strong>
                <br />
                <p>Tittel:</p>
                <asp:RequiredFieldValidator ID="reqTittel" ControlToValidate="tittelTextBox" runat="server" ErrorMessage="[Tittel på bildet]" Display="None"></asp:RequiredFieldValidator>
                <asp:TextBox ID="tittelTextBox" runat="server" Text='<%# Bind("tittel") %>' />
                <br />
                <br />
                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Sett inn" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Avbryt" CausesValidation="false" />
                <asp:ValidationSummary ID="ValidationSummary2" runat="server" DisplayMode="SingleParagraph" HeaderText="Mangler" Font-Bold="True" EnableViewState="True" ForeColor="Red" />
                <br />
            </li>

        </InsertItemTemplate>

        <ItemTemplate>
            <li style="">
                <br />
                <asp:Label ID="tittelLabel" runat="server" Text='<%# Eval("tittel") %>' />
                <br />
                <asp:Label ID="datoLabel" runat="server" Text='<%# Eval("dato", "{0:d}")%>' />
                <br />
                <asp:Label ID="brukerLabel" runat="server" Text='<%# Eval("bruker") %>' />
                <br />
                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("bilde") %>' />

                <br />
                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" CausesValidation="false" />
                <br />
                <br />
            </li>
        </ItemTemplate>
        <LayoutTemplate>
            <ul class="ItemContainer">
                <li runat="server" id="itemPlaceholder" />
            </ul>

        </LayoutTemplate>

    </asp:ListView>


    <asp:SqlDataSource ID="LFListeBilder" runat="server"
        ConnectionString="<%$ ConnectionStrings:lillefrognerConnectionString %>"
        DeleteCommand="DELETE FROM [bilder] WHERE [bildeId] = @bildeId"
        InsertCommand="INSERT INTO [bilder] ([tittel], [dato], [bruker],  [bilde]) VALUES (@tittel, GetDate(), @bruker, @bilde)"
        SelectCommand="SELECT * FROM [bilder]"
        UpdateCommand="UPDATE [bilder] SET [tittel] = @tittel, [dato] = GetDate(), [bruker] = @bruker,  [bilde] = @bilde WHERE [bildeId] = @bildeId">
        <DeleteParameters>
            <asp:Parameter Name="bildeId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="tittel" Type="String" />
            <asp:Parameter Name="dato" Type="DateTime" />
            <asp:Parameter Name="bruker" Type="String" />
            <asp:Parameter Name="bilde" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="tittel" Type="String" />
            <asp:Parameter Name="dato" Type="DateTime" />
            <asp:Parameter Name="bruker" Type="String" />
            <asp:Parameter Name="bilde" Type="String" />
            <asp:Parameter Name="bildeId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>




</asp:Content>

