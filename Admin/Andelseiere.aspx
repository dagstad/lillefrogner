<%@ page title="Lille Frogneseter - Andelseiere" language="VB" masterpagefile="~/MasterPage.master" autoeventwireup="false"  CodeFile ="Andelseiere.aspx.vb" inherits="Admin_Andelseiere" stylesheettheme="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <h2>ANDELSEIERE</h2>
    <br />
    <p class="hjelpeTekst">Her kan du endre opplysninger på andelseiere og slette profil 
        og bruker!</p>
    <asp:panel ID="Panel1" ScrollBars="Auto" runat="server" Height="600px" CssClass="panel">
    <div style ="width : 650px;" >

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="andelId" DataSourceID="LFAndelseiere" AllowPaging="True" 
            AllowSorting="True" BorderStyle="None" GridLines="None" PageSize="150" >
            <Columns>

                 <asp:HyperLinkField DataNavigateUrlFields="andelId" DataNavigateUrlFormatString="~/Admin/Andelseiere.aspx?ID={0}" Text="VIS">
                    <ItemStyle Wrap="False" CssClass="GridCellClear" />
                </asp:HyperLinkField>

                <asp:BoundField DataField="bruker" HeaderText="Bruker" SortExpression="bruker">
                    <ItemStyle Wrap="False" CssClass="GridCellClear" />
                    <HeaderStyle HorizontalAlign="Left" CssClass="GridHeadStyle" />
                </asp:BoundField>
                <asp:BoundField DataField="fornavn" HeaderText="Fornavn" SortExpression="fornavn">
                    <ItemStyle Wrap="False" CssClass="GridCellClear"  />
                    <HeaderStyle HorizontalAlign="Left" CssClass="GridHeadStyle" />
                    
                </asp:BoundField>
                <asp:BoundField DataField="etternavn" HeaderText="Etternavn" SortExpression="etternavn">
                    <ItemStyle Wrap="False" CssClass="GridCellClear"  />
                    <HeaderStyle HorizontalAlign="Left" CssClass="GridHeadStyle" />
                </asp:BoundField>
                <asp:BoundField DataField="epost" HeaderText="E-post" SortExpression="epost">
                    <ItemStyle Wrap="True" CssClass="GridCellClear" 
                    HorizontalAlign="NotSet"  Width="20%" />
                    <HeaderStyle HorizontalAlign="Left" CssClass="GridHeadStyle" />
                </asp:BoundField>

            </Columns>
            <PagerSettings Mode="NumericFirstLast" />
            <PagerStyle CssClass="GridFootStyle" HorizontalAlign="Center" />
            <HeaderStyle CssClass="GridHeadStyle" />
            <AlternatingRowStyle CssClass="textbglt" />
        </asp:GridView>
    </div>
    </asp:panel>
    <br />
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="andelId" DataSourceID="LFAndelseier" DefaultMode="Edit" Visible="False" BackColor="#CCCCCC">
        <FieldHeaderStyle CssClass="DBUpdateLead" HorizontalAlign="Right" />
        <Fields> 
            <asp:TemplateField HeaderText="Bruker" InsertVisible="False" 
                SortExpression="bruker">
                <EditItemTemplate>
                    <asp:Label ID="lblBruker" runat="server" Text='<%# Bind("bruker") %>' ></asp:Label>
                </EditItemTemplate>
               
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Fornavn" SortExpression="fornavn">
                <ControlStyle Width="400px" />
                <ItemStyle CssClass="DBUpdateCell" />
                <EditItemTemplate>
                    <asp:TextBox ID="tbxFornavn" runat="server" Text='<%# Bind("fornavn") %>' />
                    <br />
                </EditItemTemplate>

            </asp:TemplateField>
            <asp:TemplateField HeaderText="Etternavn" SortExpression="etternavn">
                <ControlStyle Width="400px" />
                <ItemStyle CssClass="DBUpdateCell" />
                <EditItemTemplate>
                    <asp:TextBox ID="tbxEtternavn" runat="server" Text='<%# Bind("etternavn") %>' />
                </EditItemTemplate>

            </asp:TemplateField>
            <asp:TemplateField HeaderText="E-post" SortExpression="epost">
                <ControlStyle Width="400px" />
                <ItemStyle CssClass="DBUpdateCell" />
                <EditItemTemplate>
                    <asp:TextBox ID="tbxEpost" runat="server" Text='<%# Bind("epost") %>' />
                </EditItemTemplate>

            </asp:TemplateField>
            <asp:TemplateField HeaderText="Mobil" SortExpression="mobil">
                <ControlStyle Width="400px" />
                <ItemStyle CssClass="DBUpdateCell" />
                <EditItemTemplate>
                    <asp:TextBox ID="tbxMobil" runat="server" Text='<%# Bind("mobil") %>' />
                </EditItemTemplate>

            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <ItemStyle CssClass="DBUpdateCell" />
                <EditItemTemplate>
                    <asp:Button ID="btnSave" runat="server" Text="Lagre" SkinID="Button1" OnClick="btnSave_Click" />&nbsp;<asp:Button ID="btnDelete" runat="server" Text="Slett" SkinID="Button1" OnClick="btnDelete_Click" />
                    <br />
                    <br />
                    <asp:Button ID="btnCancel" runat="server" Text="Avbryt" SkinID="Button1" OnClick="btnCancel_Click" />
                    <br />
                    <asp:Label ID="lblMessage" runat="server" ForeColor="Red" />&nbsp;<asp:Button ID="btnBekreft" runat="server" Text="Bekreft Sletting" Visible="False" OnClick="btnBekreft_Click" />
                    &nbsp;
                </EditItemTemplate>
            </asp:TemplateField>

           

        </Fields>
    </asp:DetailsView>
    <br />

    <asp:SqlDataSource ID="LFAndelseier" runat="server" ConnectionString="<%$ ConnectionStrings:lillefrognerConnectionString %>" SelectCommand="SELECT * FROM [andelseiere] WHERE ([andelId] = @andelId)">
        <SelectParameters>
            <asp:QueryStringParameter Name="andelId" QueryStringField="ID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="LFAndelseiere" runat="server" ConnectionString="<%$ ConnectionStrings:lillefrognerConnectionString %>" DeleteCommand="DELETE FROM [andelseiere] WHERE [andelId] = @andelId" InsertCommand="INSERT INTO [andelseiere] ([bruker], [fornavn], [etternavn], [epost], [mobil], [tlf], [poeng]) VALUES (@bruker, @fornavn, @etternavn, @epost, @mobil, @tlf, @poeng)" SelectCommand="SELECT * FROM [andelseiere] ORDER BY bruker" UpdateCommand="UPDATE [andelseiere] SET [bruker] = @bruker, [fornavn] = @fornavn, [etternavn] = @etternavn, [epost] = @epost, [mobil] = @mobil, [tlf] = @tlf, [poeng] = @poeng WHERE [andelId] = @andelId">
        <DeleteParameters>
            <asp:Parameter Name="andelId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="bruker" Type="String" />
            <asp:Parameter Name="fornavn" Type="String" />
            <asp:Parameter Name="etternavn" Type="String" />
            <asp:Parameter Name="epost" Type="String" />
            <asp:Parameter Name="mobil" Type="Int32" />
            <asp:Parameter Name="tlf" Type="Int32" />
            <asp:Parameter Name="poeng" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="bruker" Type="String" />
            <asp:Parameter Name="fornavn" Type="String" />
            <asp:Parameter Name="etternavn" Type="String" />
            <asp:Parameter Name="epost" Type="String" />
            <asp:Parameter Name="mobil" Type="Int32" />
            <asp:Parameter Name="tlf" Type="Int32" />
            <asp:Parameter Name="poeng" Type="Int32" />
            <asp:Parameter Name="andelId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>


    <%--<asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="andelId" DataSourceID="LFAndelseiere" AllowPaging="True" 
            AllowSorting="True" BorderStyle="None" GridLines="None" PageSize="150" >
            <Columns>

                <asp:HyperLinkField DataNavigateUrlFields="andelId" DataNavigateUrlFormatString="~/Admin/Andelseiere.aspx?ID={0}" Text="VIS">
                    <ItemStyle Wrap="False" CssClass="GridCellClear" />
                </asp:HyperLinkField>

                <asp:BoundField DataField="bruker" HeaderText="Bruker" SortExpression="bruker">
                    <ItemStyle Wrap="False" CssClass="GridCellClear" />
                    <HeaderStyle HorizontalAlign="Left" CssClass="GridHeadStyle" />
                </asp:BoundField>
                <asp:BoundField DataField="fornavn" HeaderText="Fornavn" SortExpression="fornavn">
                    <ItemStyle Wrap="False" CssClass="GridCellClear"  />
                    <HeaderStyle HorizontalAlign="Left" CssClass="GridHeadStyle" />
                    
                </asp:BoundField>
                <asp:BoundField DataField="etternavn" HeaderText="Etternavn" SortExpression="etternavn">
                    <ItemStyle Wrap="False" CssClass="GridCellClear"  />
                    <HeaderStyle HorizontalAlign="Left" CssClass="GridHeadStyle" />
                </asp:BoundField>
                <asp:BoundField DataField="epost" HeaderText="E-post" SortExpression="epost">
                    <ItemStyle Wrap="True" CssClass="GridCellClear" 
                    HorizontalAlign="Justify"  />
                    <HeaderStyle HorizontalAlign="Left" CssClass="GridHeadStyle" />
                </asp:BoundField>

            </Columns>
            <PagerSettings Mode="NumericFirstLast" />
            <PagerStyle CssClass="GridFootStyle" HorizontalAlign="Center" />
            <HeaderStyle CssClass="GridHeadStyle" />
            <AlternatingRowStyle CssClass="textbglt" />
        </asp:GridView>--%>


</asp:Content>

