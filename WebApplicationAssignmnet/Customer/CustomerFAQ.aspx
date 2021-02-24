<%@ Page Title="FAQ|TAYY Art" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="CustomerFAQ.aspx.cs" Inherits="WebApplicationAssignmnet.CustomerFAQ" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <link href="../lib/css/FAQ.css" rel="stylesheet" />
    <div class="FAQcontainer">
        <div class="image-container">
            <div class="bannerText">FAQ</div>
        </div>
        <div class="contContainer">
            <p class="descp">
                Below you'll find answers to the questions we get asked the most about the use of TAYY Art. If this page doesn't help please sent an email to
        <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="mailto:tayyartwork@gmail.com">tayyartwork@gmail.com</asp:HyperLink>.
            </p>
            <div class="text">01. My account</div>
            <button class="accordion">How can I change my account details?</button>
            <div class="panel">
                <p>You could always go to your profile page to change your account details.</p>
            </div>

            <button class="accordion">I can't log in, how can I solve this?</button>
            <div class="panel">
                <p>
                    If you can’t log in, you can request a new password by clicking on ‘Forgot password’ in the
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Anonymous/Login.aspx">log in </asp:HyperLink>
                    window. A link will be sent to your email. 
    But, if you do not adhere the rules of TAYY Art, we reserves the right to cancel the account. We will always notify you.
                </p>

            </div>
            <button class="accordion">I didn't receive the confimation email after registered.</button>
            <div class="panel">
                <p>
                    It always end up in your spam/junk box if our system first time sent you an email. If you still have not received our confirmation, and you have checked your spam/junk inbox, please 
    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="mailto:tayyartwork@gmail.com">contact </asp:HyperLink>
                    us.
                </p>
            </div>
            <div class="text">02. Dispatch and delivery</div>
            <button class="accordion">When will I receive my pack?</button>
            <div class="panel">
                <p>
                    The artists are responsible for shipping the artwork. The artist has 72 hours to ship the artwork and fill in a track & trace code, and will notify you if more time is needed for shipment. 
    You will receive an e-mail with more details about the shipment if the track & trace code is filled.
                </p>

            </div>

            <button class="accordion">Why are the delivery charges so high?</button>
            <div class="panel">
                <p>The artist ensures safe shipping of the artwork. Sometimes a special box or crate needs to be made. Weight of the total package will play an important role. We aim to keep delivery charges as low as possible, but quality shipping for us is most important.</p>

            </div>
            <div class="text">03. No contact, or damage</div>
            <button class="accordion">I have paid for a artwork, but the artist does not react.</button>
            <div class="panel">
                <p>
                    The artist is asked to ship the artwork and fill in track & trace code in 72 hours. If you does not received any email after 72 hours, please
            <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="mailto:tayyartwork@gmail.com">contact </asp:HyperLink>
                    us.
                </p>

            </div>

            <button class="accordion">I have received an artwork but it is damaged/not as described.</button>
            <div class="panel">
                <p>
                    If you received an damaged work (during shipping or delivery), please report immediately to the artist. If both parties agree to annul the transaction, the delivery fee to return the work must be paid by the buyer. 
    If you received an work that is not as described, the 14-Day Buyers Guarantee of TAYY Art entitles you to claim. In case of a dispute, which you are not able to solve yourself, you may ask TAYY Art for our advice or intervention.
                </p>

            </div>
        </div>
    </div>
    <script src="../lib/js/FAQ.js"></script>
</asp:Content>
