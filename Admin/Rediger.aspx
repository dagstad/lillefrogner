<%@ Page Title="Lille Frogneseter - Rediger" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Rediger.aspx.vb" Inherits="Admin_Rediger" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">

    <h2>REDIGER NYHETER OG ANDRE SAKER</h2>
    <br />
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
        DataKeyNames="nyId" DataSourceID="LFRedigerNyheter" DefaultMode="Insert" 
        BackColor="#CCCCCC">
        <FieldHeaderStyle CssClass="DBUpdateLead" HorizontalAlign="Right" />
        <Fields>

            <asp:BoundField DataField="nyId" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="nyId" />

            <asp:TemplateField HeaderText="Tittel" SortExpression="tittel">
                <ControlStyle Width="400px" />
                <ItemStyle CssClass="DBUpdateCell" />
                <EditItemTemplate>
                    <asp:TextBox ID="tbxTittel" runat="server" Text='<%# Bind("tittel") %>'/>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbxTittel" Display="None" ErrorMessage="[Tittel/Overskrift]"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="tbxTittel" runat="server" Text='<%# Bind("tittel") %>'/>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbxTittel" Display="None" ErrorMessage="[Tittel/Overskrift]"></asp:RequiredFieldValidator>
                </InsertItemTemplate>
            </asp:TemplateField>
            

            <asp:TemplateField HeaderText="Kategori" SortExpression="katId">
                <ControlStyle Width="200px" />
                <ItemStyle CssClass="DBUpdateCell" />
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlKategori" runat="server" DataSourceID="LFKategori" DataTextField="tekst" DataValueField="katId" SelectedValue='<%# Bind("katId") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:DropDownList ID="ddlKategori" runat="server" DataSourceID="LFKategori" DataTextField="tekst" DataValueField="katId" SelectedValue='<%# Bind("katId") %>'>
                    </asp:DropDownList>
                </InsertItemTemplate>

            </asp:TemplateField>

            <asp:TemplateField HeaderText="Ingress" SortExpression="ingress">
                <ControlStyle Width="400px" />
                <ItemStyle CssClass="DBUpdateCell" />
                <EditItemTemplate>
                    <asp:TextBox ID="tbxIngress" runat="server" Rows="4" Text='<%# Bind("ingress") %>' TextMode="MultiLine"/>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="tbxIngress" runat="server" Rows="4" Text='<%# Bind("ingress") %>' TextMode="MultiLine"/>
                </InsertItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Bilde" SortExpression="bilde">
            <InsertItemTemplate>
            <asp:FileUpload ID="FileUpload1" runat="server" Enabled="False" />
                     <p class="hjelpeTekst ">Vent med å laste opp bildet til du har trykket OPPRETTE nedenfor.</p>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind ("bilde") %>' Enabled="False" />
            </InsertItemTemplate>
                <EditItemTemplate>
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                   <p class="hjelpeTekst ">NÅ KAN DU LEGGE TIL BILDE!<br /> TRYKK OPPDATER ETTERPÅ!</p>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind ("bilde") %>'/>
                </EditItemTemplate>

            </asp:TemplateField>

            <asp:BoundField DataField="bruker" HeaderText="Bruker" SortExpression="bruker" InsertVisible="False" ReadOnly="true" />
            <asp:BoundField DataField="dato" HeaderText="Dato" SortExpression="dato" InsertVisible="false" ReadOnly="true" />
            <asp:BoundField DataField="arkiv" HeaderText="Arkiv" SortExpression="arkiv" InsertVisible="false" ReadOnly="true" />

            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <br />
                    <br />
                    <asp:Button ID="BtnLeggTilAvsnitt" runat="server" OnClick="BtnLeggTilAvsnitt_Click" Text="Legg til\Endre avsnitt"
                        SkinID="Button1" Enabled="True" />
                    &nbsp;<asp:Button ID="BtnLeggTilListe" runat="server" Text="Legg til\Endre liste" SkinID="Button1" OnClick="BtnLeggTilListe_Click" Enabled="True" />
                    <br />
                    <br />
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Oppdater"/>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" OnClick="LinkButton2_Click" Text="Avbryt"/>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Insert" Text="Opprette"/>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" PostBackUrl="javascript:history.go(-1)" Text="Avbryt"/>
                </InsertItemTemplate>
            </asp:TemplateField>
        </Fields>
    </asp:DetailsView>
    <br />
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="SingleParagraph" ForeColor="Red" />

    <br />
    <p class="hjelpeTekst">Når du skal opprette en nyhet, må du lage et avsnitt først.<br />
        Om du skal lage en liste til avsnittet, kan du gjøre det etterpå.</p>


    <hr />

    <asp:SqlDataSource ID="LFRedigerNyheter" runat="server" ConnectionString="<%$ ConnectionStrings:lillefrognerConnectionString %>"
        InsertCommand="INSERT INTO [nyheter] ([tittel], [katId], [ingress], [bruker], [dato], [bilde], [arkiv]) VALUES (@tittel, @katId, @ingress, @bruker, getDate(), @bilde, default)"
        SelectCommand="SELECT * FROM [nyheter] WHERE ([nyId] = @nyId)"
        UpdateCommand="UPDATE [nyheter] SET [tittel] = @tittel, [katId] = @katId, [ingress] = @ingress, [bruker] = @bruker, [dato] = getDate(), [bilde] = @bilde, [arkiv] = default WHERE [nyId] = @nyId">

        <InsertParameters>
            <asp:Parameter Name="tittel" Type="String" />
            <asp:Parameter Name="katId" Type="Int32" />
            <asp:Parameter Name="ingress" Type="String" />
            <asp:Parameter Name="bruker" Type="String" />
            <asp:Parameter Name="dato" Type="DateTime" />
            <asp:Parameter Name="bilde" Type="String" />
            <asp:Parameter Name="arkiv" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="nyId" QueryStringField="ID" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="tittel" Type="String" />
            <asp:Parameter Name="katId" Type="Int32" />
            <asp:Parameter Name="ingress" Type="String" />
            <asp:Parameter Name="bruker" Type="String" />
            <asp:Parameter Name="dato" Type="DateTime" />
            <asp:Parameter Name="bilde" Type="String" />
            <asp:Parameter Name="arkiv" Type="Int32" />
            <asp:Parameter Name="nyId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="LFKategori" runat="server" ConnectionString="<%$ ConnectionStrings:lillefrognerConnectionString %>"
        SelectCommand="SELECT * FROM [kategori]"></asp:SqlDataSource>


</asp:Content>

