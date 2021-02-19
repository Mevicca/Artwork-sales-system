<%@ Page Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="ProductPage.aspx.cs" Inherits="WebApplicationAssignmnet.ProductPage" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
	<link href="lib/css/Login.css" rel="stylesheet" />
    <div class="container bg-white" style="margin-top:30px">
		<div class="row">
			<div class="col-xl-1"  style="text-align:right;padding-top:9em">
				<div class="prevIcon">
					<i class="fa fa-angle-left fa-2x" onclick="plusDivs(-1)"></i>
				</div>
			</div>
			<div class="col-sm-4" style="text-align:center">
				<div class="slides">
					<div class="img-magnifier-container">
					  <img class="slidesImg" src="assets/product/Acrylic/carlos pun DD.jpg" alt="carlos pun DD.jpg" style="width:199px;height:267px;margin-top:30px;"/>
					  <img class="slidesImg" src="assets/product/Acrylic/carlos pun B&L.jpg" alt="carlos pun B&L.jpg" style="width:199px;height:267px;margin-top:30px;display:none"/>
					  <img class="slidesImg" src="assets/product/Acrylic/carlos pun Marvin.jpeg" alt="carlos pun Marvin.jpeg" style="width:199px;height:267px;margin-top:30px;display:none"/>
					  <img class="slidesImg" src="assets/product/Acrylic/carlos pun MM.jpg" alt="carlos pun MM.jpg" style="width:199px;height:267px;margin-top:30px;display:none"/>
					</div>
				</div>
					
			</div>
			<div class="col-xl-1"  style="text-align:left;padding-top:9em">
				<div class="nextIcon">
					<i class="fa fa-angle-right fa-2x" onclick="plusDivs(1)"></i>
				</div>
			</div>
			<div class="col-sm-6">
					<h5 style="margin-top:80px">Name &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp: 
                        <input id="Name" class="textBox" placeholder="Mc Duck Success Treasure Hunt" type="text" disabled="disabled" /></h5>
					<hr />
					<h5>Artist Name &nbsp: 
                        <input id="ArtName" class="textBox" placeholder="Carlos Pun" type="text" disabled="disabled" /></h5>
					<hr />
					<h5>Release Date : 
                        <input id="RDate" class="textBox" placeholder="May 2019" type="text" disabled="disabled" /></h5>
					<hr />
					<h5>Price &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp:
						<input id="Price" class="textBox" placeholder=" <%String.Format("{0:0.00}", 33250); %> " type="text" disabled="disabled" /></h5>
					<h5>Desc &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp: 
						<textarea id="Desc" name="S1" style="resize:none;height:80px;width:300px;font-size:medium;text-align:left" >
Size: 150x110cm
Acrylic on canvas
Ready to Hang
Certificated included by artist Carlos Pun and Singulart
World Wide Shipping.
Collectors from over 15+ countries
						</textarea></h5>
				
					<hr />
					<button type="button" class="btn btn-outline-primary" style="cursor:pointer"><i class="fa fa-cart-plus"></i>&nbsp; Add to Cart</button>
					<button type="button" class="btn btn-outline-danger" style="cursor:pointer" onclick="wishList()"><i class="fa fa-heart" id="wishL"></i>&nbsp; Wishlist </button>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-6" style="text-align:center">
				<img class="zoom" src="assets/product/Acrylic/carlos pun DD.jpg" alt="carlos pun DD.jpg" width="66" height="89" style="margin-top:30px;margin-left:10px"/>
				<img class="zoom" src="assets/product/Acrylic/carlos pun B&L.jpg" alt="carlos pun B&L.jpg" width="66" height="89" style="margin-top:30px;margin-left:10px;cursor:pointer"/>
				<img class="zoom" src="assets/product/Acrylic/carlos pun Marvin.jpeg" alt="carlos pun Marvin.jpeg" width="66" height="89" style="margin-top:30px;margin-left:10px"/>
			</div>
		</div>
		<br />
		<br />
		<div class="row">
			<div class=" col" >
				<h5 style="margin-left:100px">Suggested For You :</h5>
				<br />
				<img class="zoom" src="assets/product/Acrylic/carlos pun Mono.jpg" width="66" height="89" style="margin-left:100px;margin-bottom:30px"/>
			</div>
		</div>
	</div>
</asp:Content>
