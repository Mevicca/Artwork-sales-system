<%@ Control Language="C#" CodeBehind="AboutUs.ascx.cs" Inherits="WebApplicationAssignmnet.DynamicData.FieldTemplates.AboutUs" %>

<link href="../lib/css/AboutUs.css" rel="stylesheet" />
<div>
    <div class="aboutUs-container">
        <div class="aboutUs-Imgcontainer">
            <div class="bannerTitle">ABOUT US</div>
        </div>

        <div class="aboutUs-text">
            <table class="aboutUs-table">
                <tr>
                    <td class="imgAboutUs">
                        <asp:Image ID="img1" ClientIDMode="Static" ImageUrl="~/assets/Images/AboutUs/drawing.png" runat="server" /></td>
                    <td class="right-sideText">
                        <p>
                            TAYY Art is the online art gallery, connecting people with art and artists they love.
                        TAYY Art offers a beautiful selection of paintings and sculpture in various price ranges.
                        It provides artists in Malaysia with an expertly curated environment in which to exhibit and sell their work.
                               
                        </p>
                    </td>
                </tr>
            </table>

        </div>

        <div class="aboutUs-img">
            <div class="aboutUs-imgtext">
                <p>
                    We exist so you can have the art you love. This means giving you easy access to incredible art images and top-notch craftsmanship. 
                            Because when you find art you love, you&#39;ll love your space more... and that&#39;s what it&#39;s all about.
                       
                </p>
            </div>
        </div>

        <div class="aboutUs-text">
            <table class="aboutUs-table">
                <tr>
                    <td class="left-sideText">
                        <p>
                            We act as a guide to, and commentator on, the art world. We use a combination of technology and traditional expertise to help those seeking high-quality art for any setting.
                                    Whether you&#39;re just curious about art or you&#39;re a seasoned collector, we&#39;re here to shine a light on the most exciting, talented, and culturally relevant artists of our time.
                               
                        </p>
                    </td>
                    <td class="imgAboutUs">
                        <asp:Image ID="img2" ClientIDMode="Static" ImageUrl="~/assets/Images/AboutUs/art2.jpg" runat="server" /></td>
                </tr>
            </table>
        </div>
    </div>
</div>
