<%@ Page Title="Lille Frogneseter - Reserver" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Reserver.aspx.vb" Inherits="Admin_Reserver" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <h2>ADMINISTRERE SØKNADER</h2>

    <br />
    <asp:Calendar ID="Calendar1" runat="server" BackColor="White"
        BorderColor="Black" BorderWidth="1px" DayNameFormat="Full"
        Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="200px"
        ShowGridLines="True" Width="650px" Visible="false" CssClass="kalender" 
        SelectionMode="None">
        <DayHeaderStyle BorderStyle="Solid" BorderWidth="2px" Font-Bold="True" />
        <DayStyle BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" Height="50px" />
        <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
        <OtherMonthDayStyle ForeColor="#CC9966" />
        <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
        <SelectorStyle BackColor="#FFFFCC" />
        <TitleStyle BackColor="#3E90CC" Font-Bold="True" Font-Size="9pt"
            ForeColor="#FFFFCC" />
        <TodayDayStyle BackColor="#3399FF" ForeColor="White" />
    </asp:Calendar>
    <asp:Button ID="btnVis" runat="server" Text="Vis/Skjul Kalender" SkinID="Button1" /><p class ="hjelpeTekst ">Det kan ta opptil 10 sek. å få opp kalender.</p>
    <br />
    <br />
    <strong>Trykk på VIS til høyre for reservasjonen for å få opp reservasjonen.</strong>
    <hr />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="resId,andelId1" DataSourceID="LFGridReservasjon" AllowSorting="True" GridLines="None" EmptyDataText="INGEN FLERE SØKNADER!">

        <Columns>
            <asp:BoundField DataField="resId" HeaderText="ResId" InsertVisible="False" ReadOnly="True" SortExpression="resId">
                <ItemStyle Wrap="False" CssClass="GridCellClear" />
                <HeaderStyle HorizontalAlign="Left" CssClass="GridHeadStyle" />
            </asp:BoundField>
            <asp:BoundField DataField="andelId" HeaderText="AndelId" SortExpression="andelId">
                <ItemStyle Wrap="False" CssClass="GridCellClear" />
                <HeaderStyle HorizontalAlign="Left" CssClass="GridHeadStyle" />
            </asp:BoundField>
            <asp:BoundField DataField="bruker" HeaderText="Bruker" SortExpression="bruker">
                <ItemStyle Wrap="False" CssClass="GridCellClear" />
                <HeaderStyle HorizontalAlign="Left" CssClass="GridHeadStyle" />
            </asp:BoundField>
            <asp:BoundField DataField="oppdato" HeaderText="Opprettet" SortExpression="oppdato" DataFormatString="{0:d}">
                <ItemStyle Wrap="False" CssClass="GridCellClear" />
                <HeaderStyle HorizontalAlign="Left" CssClass="GridHeadStyle" />
            </asp:BoundField>
            <asp:BoundField DataField="fraUke" HeaderText="Fra Uke" SortExpression="fraUke">
                <ItemStyle Wrap="False" CssClass="GridCellClear" HorizontalAlign="Center" />
                <HeaderStyle HorizontalAlign="Left" CssClass="GridHeadStyle" />
            </asp:BoundField>
            <asp:BoundField DataField="tilUke" HeaderText="Til Uke" SortExpression="tilUke">
                <ItemStyle Wrap="False" CssClass="GridCellClear" HorizontalAlign="Center" />
                <HeaderStyle HorizontalAlign="Left" CssClass="GridHeadStyle" />
            </asp:BoundField>
          <%--  <asp:BoundField DataField="godkjent" HeaderText="Godkjent Status" SortExpression="godkjent">
                <ItemStyle Wrap="False" CssClass="GridCellClear" HorizontalAlign="Center" />
                <HeaderStyle HorizontalAlign="Left" CssClass="GridHeadStyle" />
            </asp:BoundField>--%>
            <asp:HyperLinkField DataNavigateUrlFields="resId" DataNavigateUrlFormatString="~/Admin/Reserver.aspx?ID={0}" Text="VIS">
                <ItemStyle Wrap="False" CssClass="GridCellClear" />
            </asp:HyperLinkField>
        </Columns>
        <PagerSettings Mode="NumericFirstLast" />
        <PagerStyle CssClass="GridFootStyle" HorizontalAlign="Center" />
        <HeaderStyle CssClass="GridHeadStyle" />
        <AlternatingRowStyle CssClass="textbglt" />
    </asp:GridView>

    <br />


    <asp:FormView ID="FormView1" runat="server" DataKeyNames="resId,andelId1" Width="75%" DataSourceID="LFGodkjenn" Visible="False" CssClass="soknadbox">
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
            Reserver for følgende dager:
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
            <asp:Button ID="btnSjekk" runat="server" Text="Sjekk tilgjengelighet" OnClick="btnSjekk_Click" SkinID="Button1" />
            <br />
            <asp:Button ID="btnGodkjenn" runat="server" OnClick="btnGodkjenn_Click" Text="Godkjenn" Enabled="False" SkinID="Button1" />&nbsp;<asp:Button ID="btnAvvis" runat="server" Text="Avvis" OnClick="btnAvvis_Click" SkinID="Button1" />
            &nbsp;<asp:Button ID="Button1" runat="server" PostBackUrl="javascript:history.go(-1)" SkinID="Button1" Text="Avbryt" />
            <br />

        </ItemTemplate>
    </asp:FormView>
    <br />
    <asp:Label ID="lblFerdig" runat="server" CssClass="soknadbox" />


    <asp:Label ID="lblFeil" runat="server" CssClass="feilBoks" Visible="False" />
    <br />
    <br />
    <asp:Label ID="lblFeil0" runat="server" CssClass="feilBoks" Visible="False" />
    <br />


    <br />



    <asp:SqlDataSource ID="LFresDager" runat="server" ConnectionString="<%$ ConnectionStrings:lillefrognerConnectionString %>" SelectCommand="SELECT * FROM [retid] WHERE ([resId] = @resId)">
        <SelectParameters>
            <asp:QueryStringParameter Name="resId" QueryStringField="ID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="LFGodkjenn" runat="server" ConnectionString="<%$ ConnectionStrings:lillefrognerConnectionString %>" SelectCommand="SELECT * FROM [reservasjon] INNER JOIN [andelseiere] ON andelseiere.andelId = reservasjon.andelId WHERE ([resId] = @resId)">
        <SelectParameters>
            <asp:QueryStringParameter Name="resId" QueryStringField="ID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="LFGridReservasjon" runat="server"
        ConnectionString="<%$ ConnectionStrings:lillefrognerConnectionString %>"
        DeleteCommand="DELETE FROM [reservasjon] WHERE [resId] = @resId"
        InsertCommand="INSERT INTO [reservasjon] ([andelId], [oppdato]) VALUES (@andelId, @oppdato)"
        SelectCommand="SELECT * FROM ([reservasjon] INNER JOIN [andelseiere] ON andelseiere.andelId = reservasjon.andelId) WHERE reservasjon.godkjent = 1"
        UpdateCommand="UPDATE [reservasjon] SET [andelId] = @andelId, [oppdato] = @oppdato WHERE [resId] = @resId">
        <DeleteParameters>
            <asp:Parameter Name="resId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="andelId" Type="Int32" />
            <asp:Parameter DbType="Date" Name="oppdato" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="andelId" Type="Int32" />
            <asp:Parameter DbType="Date" Name="oppdato" />
            <asp:Parameter Name="resId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>


</asp:Content>

