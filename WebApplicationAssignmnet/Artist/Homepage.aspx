<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/WebArt.Master" CodeBehind="Homepage.aspx.cs" Inherits="WebApplicationAssignmnet.Homepage" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="../lib/css/Homepage.css" rel="stylesheet" />
    <div>
        <!-- Slideshow container -->
        <div class="slideshow-container">

            <!-- Full-width images with number and caption text -->
            <div class="mySlides fade">
                <img src="../assets/Images/Homepage/slide1.jpg" style="width: 100%" height="500">
                <div class="text">We are TAYY ART which provide platforms to artist and art lover.</div>
                <button class="btn abtUs">READ MORE</button>
            </div>

            <div class="mySlides fade">
                <img src="../assets/Images/Homepage/slide2.jpg" style="width: 100%" height="500">
                <div class="text">Interested in joining us as an artist?</div>
                <button class="btn artist">JOIN US</button>
            </div>

            <div class="mySlides fade">
                <img src="../assets/Images/Homepage/slide3.jpg" style="width: 100%" height="500">
                <div class="text">Browse and enjoy arts.</div>
                <button class="btn prod">FIND ART YOU LOVE</button>
            </div>

            <!-- Next and previous buttons -->
            <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
            <a class="next" onclick="plusSlides(1)">&#10095;</a>
        </div>
        <br>

        <!-- The dots/circles -->
        <div style="text-align: center">
            <span class="dot" onclick="currentSlide(1)"></span>
            <span class="dot" onclick="currentSlide(2)"></span>
            <span class="dot" onclick="currentSlide(3)"></span>
        </div>

        <div class="caterRow">
            <div class="caterColumn">
                <asp:HyperLink ID="HyperLink1" runat="server" ImageUrl="~/assets/Images/homepage/homecaterap.jpg" NavigateUrl="ProductGallery.aspx"></asp:HyperLink>
                <div class="homeCater">Arcylic Painting</div>
            </div>
            <div class="caterColumn">
                <asp:HyperLink ID="HyperLink2" runat="server" ImageUrl="~/assets/Images/homepage/homecaterop.jpg" NavigateUrl="ProductGallery.aspx"></asp:HyperLink>
                <div class="homeCater">Oil Painting</div>
            </div>
            <div class="caterColumn">
                <asp:HyperLink ID="HyperLink3" runat="server" ImageUrl="~/assets/Images/homepage/homecaters.jpg" NavigateUrl="ProductGallery.aspx"></asp:HyperLink>
                <div class="homeCater">Sculpture</div>
            </div>
            <div class="caterColumn">
                <asp:HyperLink ID="HyperLink4" runat="server" ImageUrl="~/assets/Images/homepage/homecaterwp.jpg" NavigateUrl="ProductGallery.aspx"></asp:HyperLink>
                <div class="homeCater">Watercolor Artwork</div>
            </div>
        </div>

    </div>

    <h3 class="homePart artistMon">Artist of the month April - Jonathan Kueh</h3>
    <div class="artistRow">
        <div class="artistColumn">
            <img src="../assets/product/watercolor/square.jpg" style="width: 100%">
            <img src="../assets/product/watercolor/beauty of west.jpg" style="width: 100%">
        </div>
        <div class="artistColumn">
            <img src="../assets/product/watercolor/Boat.jpg" style="width: 100%" height="650">
            <img src="../assets/product/watercolor/vally.jpg" style="width: 100%">
        </div>

    </div>
    <h3 class="homePart highNew">Highlighted News</h3>
    <div class="newsPart">
        <asp:Repeater ID="highlightedNews" runat="server" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                <table>
                    <tr>
                        <td class="news">
                            <asp:Image ID="news1" runat="server" ImageUrl='<%# Eval("ImgPath") %>' CssClass="newsImg" />
                        </td>
                        <td class="newsDesc">
                            <asp:Label ID="Title" runat="server" Text='<%# Eval("NewsTitle") %>' Font-Bold="True" ></asp:Label><br />
                            <br />
                            <asp:Label ID="Description" runat="server" Text='<%# Eval("NewsDesc") %>' ></asp:Label>
                            <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl='<%# Eval("ReferenceLink") %>'>Read more</asp:HyperLink><br />
                            <br />
                            Date:
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("StartDate","{0:dd/M/yyyy}") %>' ></asp:Label>
                            - 
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("EndDate","{0:dd/M/yyyy}") %>'></asp:Label><br />
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:Repeater>
    </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [NewsDesc], [StartDate], [EndDate], [ImgPath], [NewsTitle], [referenceLink] FROM [News]"></asp:SqlDataSource>

    <script src="../lib/js/Homepage.js"></script>
</asp:Content>
