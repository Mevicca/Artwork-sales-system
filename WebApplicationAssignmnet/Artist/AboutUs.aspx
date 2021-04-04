<%@ Page Language="C#" MasterPageFile="~/WebArt.Master" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="WebApplicationAssignmnet.AboutUs" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="../lib/css/AboutUs.css" rel="stylesheet" />
    <form id="form1" runat="server">
        <div>
            <div class="aboutUs-container">
                <div class="aboutUs-Imgcontainer">
                    <div class="bannerTitle">ABOUT US</div>
                </div>

                <div class="aboutUs-text">
                    <div class="imgAboutUs">
                        <asp:Image ID="img1" ClientIDMode="Static" ImageUrl="~/assets/Images/AboutUs/drawing.png" runat="server" />
                    </div>
                    <div class="right-sideText">
                        <p>
                            TAYY Art is the online art gallery, connecting people with art and artists they love.
                        TAYY Art offers a beautiful selection of paintings and sculpture in various price ranges.
                        It provides artists in Malaysia with an expertly curated environment in which to exhibit and sell their work.
                             
                        </p>
                    </div>
                </div>

                <div class="aboutUs-img">
                    <div class="aboutUs-imgtext">
                        <p>
                            We exist so you can have the art you love. This means giving you easy access to incredible art images and top-notch craftsmanship. 
                            Because when you find art you love, you&#39;ll love your space more... and that&#39;s what it&#39;s all about.
                       
                        </p>
                    </div>
                </div>

                <div style="display: flex; flex-wrap: wrap; width: 100%">
                    <div class="aboutUs-text">
                        <p>
                            We act as a guide to, and commentator on, the art world. We use a combination of technology and traditional expertise to help those seeking high-quality art for any setting.
                                    Whether you&#39;re just curious about art or you&#39;re a seasoned collector, we&#39;re here to shine a light on the most exciting, talented, and culturally relevant artists of our time.
                        </p>
                    </div>
                    <div class="imgAboutUs">
                        <asp:Image ID="img2" ClientIDMode="Static" ImageUrl="~/assets/Images/AboutUs/art2.jpg" runat="server" />
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
