<%@ page title="Lille Frogneseter - Test Kalender" language="VB" masterpagefile="~/MasterPage.master" autoeventwireup="false" CodeFile="~/TestKalender.aspx.vb" inherits="TestKalender" stylesheettheme="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">


    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="resId,retidId,andelId1" DataSourceID="LFTestKalender">
        <Columns>
            <asp:BoundField DataField="oppdato" HeaderText="oppdato" SortExpression="oppdato" />
            <asp:BoundField DataField="resId1" HeaderText="resId1" SortExpression="resId1" />
            <asp:BoundField DataField="godkjent" HeaderText="godkjent" SortExpression="godkjent" />
            <asp:BoundField DataField="andelId1" HeaderText="andelId1" InsertVisible="False" ReadOnly="True" SortExpression="andelId1" />
            <asp:BoundField DataField="bruker" HeaderText="bruker" SortExpression="bruker" />
            <asp:BoundField DataField="retidId" HeaderText="retidId" InsertVisible="False" ReadOnly="True" SortExpression="retidId" />
            <asp:BoundField DataField="resdato" HeaderText="resdato" SortExpression="resdato" />
            <asp:BoundField DataField="opptatt" HeaderText="opptatt" SortExpression="opptatt" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="LFTestKalender" runat="server" ConnectionString="<%$ ConnectionStrings:lillefrognerConnectionString %>" SelectCommand="SELECT * FROM (([reservasjon] JOIN [retid] ON retid.resId = reservasjon.resId) JOIN andelseiere on andelseiere.andelId = reservasjon.andelId)"></asp:SqlDataSource>
</asp:Content>

