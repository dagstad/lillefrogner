<%@ page title="Lille Frogneseter - Kart" language="VB" masterpagefile="~/MasterPage.master" autoeventwireup="false" CodeFile="~/Kart.aspx.vb" inherits="Kart" stylesheettheme="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2>Veibeskrivelse og kart til Lille Frogneseter</h2>
    <asp:Image ID="Image1" runat="server" ImageUrl="~/Elementer/vei.JPG" />
    <p><b>ADKOMST</b>: <br /> Fra Bø til venstre inn til Lifjell og ca. 2,2 km.
mot hotellet. <br />Til venstre ved stein med påle merket "Raukleiv",
fortsett videre over en bro til venstre ved skilt Vesta.<br />
Fortsetter til nytt dele og til høyre rett fram til hytta.<br />
Bilveg frem.</p>
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="http://kart.finn.no/?lng=9.05665&lat=59.43173&tab=routeplanner&zoom=13&mapType=normap&markers=9.06930,59.41299,r,B%C3%B8&activetab=routeplanner&waypoints=from%3AB%C3%B8%40163646.95712265,6601046.0021475+to%3ARaukleiv,+B%C3%B8%40162215,6605267" CssClass="hyperlink">Se rutebeskrivelse og kart fra Bø til hytta.</asp:HyperLink>
    <br />
</asp:Content>

