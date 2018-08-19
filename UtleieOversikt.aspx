<%@ page title="Lille Frogneseter - Utleie" language="VB" masterpagefile="~/MasterPage.master" autoeventwireup="false" CodeFile="~/UtleieOversikt.aspx.vb" inherits="Users_Utleie" stylesheettheme="Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">

    <h2>OVERSIKT UTLEIE</h2>


    <asp:Calendar ID="Calendar1" runat="server" BackColor="White"
        BorderColor="#C4D3E8" BorderWidth="1px" DayNameFormat="Full"
        Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" Height="200px"
        ShowGridLines="True" Width="650px" Visible="true" CssClass="kalender" 
        SelectionMode="None">
        <DayHeaderStyle BorderStyle="Solid" BorderWidth="2px" />
        <DayStyle BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" Height="50px" />
        <NextPrevStyle Font-Size="9pt" ForeColor="Black" />
        <OtherMonthDayStyle ForeColor="Black" />
        <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
        <SelectorStyle BackColor="Black" />
        <TitleStyle BackColor="#AFD6F7" Font-Bold="True" Font-Size="9pt"
            ForeColor="Black" />
        <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
    </asp:Calendar>







    <br />
    
    <p class="hjelpeTekst">Om det er mange bestillinger, vil det ta litt tid å vise kalenderen. Opp til 10 sekunder.
        <asp:Button ID="btnReservasjon" runat="server" Text="Gå til reservasjon" />





  


</asp:Content>
