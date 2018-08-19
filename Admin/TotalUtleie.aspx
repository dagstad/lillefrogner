<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="TotalUtleie.aspx.vb" Inherits="Admin_TotalUtleie" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
  <script type="text/javascript" src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script  type="text/javascript" src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>

 <script type ="text/javascript">
     $(function () {
         $("#MainContent_tbxFraDato").datepicker({
             dateFormat: "dd-mm-yy",
             //defaultDate: "-1m",
             changeMonth: true,
             numberOfMonths: 1
             //onClose: function (selectedDate) {
            //     $("#MainContent_TextBox2").datepicker("option", "minDate", selectedDate);
           //  }
         });
         $("#MainContent_tbxTilDato").datepicker({
             dateFormat: "dd-mm-yy",
             //defaultDate: "+1w",
             changeMonth: true,
             numberOfMonths: 1,
             onClose: function (selectedDate) {
                 $("#MainContent_tbxFraDato").datepicker("option", "maxDate", selectedDate);
             }
         });
     });
  </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<h2>Total utleie for perioden</h2>
<br />
  <p>Velg dato: </p>
  <p>Fra: <asp:TextBox ID="tbxFraDato" runat="server" AutoPostBack="True"/></p> 
  <p>Til: <asp:TextBox ID="tbxTilDato" runat="server" AutoPostBack="True"/></p>
    <asp:Button ID="btnBeregn" runat="server" Text="Beregn" Enabled="False" />
<p> <asp:Label ID="lblAntallDager" runat="server" Enabled="False" /></p>
 <p>   <asp:Label ID="lblTotalSum" runat="server" Enabled="False" /></p>

</asp:Content>

