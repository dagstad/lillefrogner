<%@ page title="Lille Frogneseter - Konfigurer" language="VB" masterpagefile="~/MasterPage.master"  CodeFile="~/Admin/Konfigurer.aspx.vb" autoeventwireup="false" inherits="Admin_Konfigurer" stylesheettheme="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <h2>KONFIGURER</h2>


    <div class="soknadbox">
        <table>
            <caption>Endre parametre.
                <br />
                Dette vil også vises i faktura som blir sendt.</caption>
            <tr>
                <td>Kontonummer:&nbsp;</td>
                <td>
                    <asp:TextBox ID="tbxKonto" runat="server" Enabled="False" /></td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="tbxKonto" runat="server" ErrorMessage="Kun tall er tillatt. Ingen mellomrom." ValidationExpression="\d+"></asp:RegularExpressionValidator>
            </tr>
            <tr>
                <td>E-post:&nbsp;(må være samme som e-post adressen til Lillefrogneseter sin mail)</td>
                <td>
                    <asp:TextBox ID="tbxEpost" runat="server" Height="16px" Width="196px" Enabled="False" /></td>

            </tr>
            <tr>
                <td>Pris som beregnes pr. natt:&nbsp;</td>
                <td>
                    <asp:TextBox ID="tbxPris" runat="server" Width="55px" Enabled="False" /></td>

            </tr>

        </table>


        &nbsp;<asp:Button ID="btnForandre" runat="server" Text="Endre" />
        &nbsp;<asp:Button ID="btnAction" runat="server" Text="Utfør" Enabled="False" />
        &nbsp;<asp:Label ID="lblMessage" runat="server" ForeColor="Red" />
    </div>

</asp:Content>

