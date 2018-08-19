<%@ page title="Lille Frogneseter - Users" language="VB" masterpagefile="~/MasterPage.master" autoeventwireup="false" inherits="Admin_Users" CodeFile="~/Admin/Users.aspx.vb" stylesheettheme="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2>OPPRETT BRUKER</h2>
    <asp:CreateUserWizard 
        ID="CreateUserWizard1" 
        runat="server" 
        CancelButtonText="Avbryt" 
        CompleteSuccessText="Bruker er vellykket opprettet." 
        ConfirmPasswordCompareErrorMessage="Passord og Bekreft Passord må være like." 
        ConfirmPasswordLabelText="Bekreft passord:" 
        ConfirmPasswordRequiredErrorMessage="Bekreft Passord må fylles ut." 
        ContinueButtonText="Fortsett" 
        ContinueDestinationPageUrl="~/Admin/Users.aspx" 
        CreateUserButtonText="Opprett Bruker" 
        DuplicateEmailErrorMessage="E-post adressen du skrev inn er allerede i bruk.  Skriv inn en annen e-post adresse." 
        DuplicateUserNameErrorMessage="Skriv inn et annet brukernavn." 
        EmailLabelText="E-post:" 
        EmailRegularExpressionErrorMessage="Skriv en annen E-post" 
        EmailRequiredErrorMessage="E-post må fylles ut." 
        FinishCompleteButtonText="Ferdig" 
        FinishPreviousButtonText="Forrige" 
        InvalidEmailErrorMessage="Skriv inn en gyldig e-post adresse." 
        InvalidPasswordErrorMessage="Passord lengde minimum: {0}. Ikke numerisk tegn påkrevd:: {1}." 
        LoginCreatedUser="False" 
        PasswordLabelText="Passord:" 
        PasswordRegularExpressionErrorMessage="Oppgi et annet passord." 
        PasswordRequiredErrorMessage="Passord må fylles ut." 
        StartNextButtonText="Neste" 
        StepNextButtonText="Neste" 
        StepPreviousButtonText="Forrige" 
        UnknownErrorMessage="Bruker ble ikke opprettet. Prøv igjen." 
        UserNameLabelText="Bruker navn:" 
        UserNameRequiredErrorMessage="Brukernavn må fylles ut.">
        <WizardSteps>
            <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server" Title="Legg til bruker">
                <ContentTemplate>
                    <table>
                        <tr>
                            <td align="center" class="GridHeadStyle" colspan="2" style="color: #FFFFFF">Legg til bruker</td>
                        </tr>
                        <tr>
                            <td align="right" style="padding-top: 8px">Brukernavn</td>
                            <td style="padding-top: 8px">
                                <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Passord:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">Bekreft Passord</td>
                            <td>
                                <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword" ErrorMessage="Confirm Password is required." ToolTip="Confirm Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">E-post:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="Email" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email" ErrorMessage="E-mail is required." ToolTip="E-mail is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                       <%-- <tr>
                            <td align="center" colspan="2">Passord og Bekreft Passord må være like.</td>
                        </tr>--%>
                        <tr>
                            <td align="center" colspan="2" style="color:Red;">
                                <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:CreateUserWizardStep>
            <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server" Title="Bruker er opprettet">
            </asp:CompleteWizardStep>
        </WizardSteps>
    </asp:CreateUserWizard>

</asp:Content>

