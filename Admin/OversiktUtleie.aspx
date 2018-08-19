<%@ page title="Lille Frogneseter- Søk Oversikt Utleie" language="VB" masterpagefile="~/MasterPage.master" autoeventwireup="false" CodeFile="~/Admin/OversiktUtleie.aspx.vb" inherits="Admin_OversiktUtleie" stylesheettheme="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <h2>OVERSIKT UTLEIE </h2>
    <br />
    <p class="hjelpeTekst ">Velg de søkekriteriene du ønsker. Du kan kombinere eller ikke velge noen. <br />
    Om du vil se alt ufiltrert, trykker du bare på SØK !<br />
    Her kan du og slette reservasjoner helt!</p>


    <hr />

   
    <div class=" sokBoxLeft ">
        <p>Se utleie pr. bruker</p>
        <p>Velg Bruker:</p>
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="LFAndelseiere" DataTextField="fornavn" DataValueField="andelId">
        </asp:DropDownList>
    </div>



    <div class="sokBoxRight ">
        <p>Se hvem brukere som har fått tilsendt faktura  eller ikke.</p>
        <p>Sendt Faktura?</p>
        <asp:RadioButtonList ID="RadbtnLstFaktura" runat="server" AutoPostBack="True">
            <asp:ListItem Value="2">Ja</asp:ListItem>
            <asp:ListItem Value="1">Nei</asp:ListItem>
        </asp:RadioButtonList>
    </div>


    <div class=" sokBoxLeft ">
        <p>Se hvem som har betalt eller ikke.</p>
        <p>Betalt?</p>
        <asp:RadioButtonList ID="RadBtnLstBet" runat="server" AutoPostBack="True">
            <asp:ListItem Value="2">Ja</asp:ListItem>
            <asp:ListItem Value="1">Nei</asp:ListItem>
        </asp:RadioButtonList>
    </div>

    <div class="sokBoxRight ">
        <p>Sorter reservasjoner på Søknad, Godkjent eller Avvist</p>
        <asp:RadioButtonList ID="RadBtnLstAvvist" runat="server" AutoPostBack="True" >
            <asp:ListItem Value="1">Søknad</asp:ListItem>
            <asp:ListItem Value="2">Godkjent</asp:ListItem>
            <asp:ListItem Value="3">Avvist</asp:ListItem>
        </asp:RadioButtonList>
    </div>

    <%--<hr class="clear " />--%>
      
    <p class="hjelpeTekst ">Du søker følgende kriterier:</p>
    <p>
        <br />
        Faktura Sendt: &nbsp;<asp:Label ID="lblFakturaSvar" runat="server" ForeColor="Red" Text="[----]" />
        <br />
        Faktura Betalt: &nbsp;<asp:Label ID="lblBetalSvar" runat="server" ForeColor="Red" Text="[----]" />
        <br />
        For Bruker: &nbsp;<asp:Label ID="lblBruker" runat="server" ForeColor="Red" Text="[----]" />
        <br />
        Søknad:&nbsp;<asp:Label ID="lblAvvist" runat="server" ForeColor="Red" Text="[----]" />
    </p>
    
    

    <br />

    <asp:Button ID="BtnSearch" runat="server" Text="SØK" />&nbsp;<asp:Button ID="btnReset" runat="server" Text="Reset Alle Bokser" />

    <asp:SqlDataSource ID="LFAndelseiere" runat="server"
        ConnectionString="<%$ ConnectionStrings:lillefrognerConnectionString %>"
        SelectCommand="SELECT * FROM [andelseiere]"></asp:SqlDataSource>

</asp:Content>

