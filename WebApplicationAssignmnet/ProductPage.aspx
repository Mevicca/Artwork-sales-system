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
					  <img class="slidesImg" src="assets/product/Acrylic/carlos pun DD.jpg" style="width:199px;height:267px;margin-top:30px;"/>
					  <img class="slidesImg" src="assets/product/Acrylic/carlos pun B&L.jpg" style="width:199px;height:267px;margin-top:30px;display:none"/>
					  <img class="slidesImg" src="assets/product/Acrylic/carlos pun Marvin.jpeg" style="width:199px;height:267px;margin-top:30px;display:none"/>
					  <img class="slidesImg" src="assets/product/Acrylic/carlos pun MM.jpg" style="width:199px;height:267px;margin-top:30px;display:none"/>
					</div>
				</div>
					<h4>Price :</h4>
			</div>
			<div class="col-xl-1"  style="text-align:left;padding-top:9em">
				<div class="nextIcon">
					<i class="fa fa-angle-right fa-2x" onclick="plusDivs(1)"></i>
				</div>
			</div>
			<div class="col-sm-4">
					<h5 style="margin-top:30px">Name :</h5>
					<hr />
					<h5>Artist Name: </h5>
					<hr />
					<h5>Desc:</h5>
					<hr />
					<button type="button" class="btn btn-outline-primary" style="cursor:pointer">Add to Cart &nbsp;<i class="fa fa-cart-plus"></i></button>
			</div>
			<div class="col-xl-2" style="text-align:center">
				<div class="wishList">
					<div id="wishL">
						<i class="fa fa-heart" style="margin-top:30px" onclick="wishLsit()"></i>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-xl-1"  style="text-align:right;padding-top:4em;margin-left:150px">
				<div class="prevIcon">
					<i class="fa fa-angle-left" onclick="plusDivs(-1)"></i>
				</div>
			</div>
			<div class="col-sm-6" style="text-align:center">
					<img class="zoom" src="assets/product/Acrylic/carlos pun B&L.jpg" width="66" height="89" style="margin-top:30px;margin-left:10px;cursor:pointer"/>
					<img class="zoom" src="assets/product/Acrylic/carlos pun Marvin.jpeg" width="66" height="89" style="margin-top:30px;margin-left:10px"/>
					<img class="zoom" src="assets/product/Acrylic/carlos pun MM.jpg" width="66" height="89" style="margin-top:30px;margin-left:10px"/>
			</div>
			<div class="col-xl-1"  style="text-align:left;padding-top:4em;margin-left:10px">
				<div class="nextIcon">
					<i class="fa fa-angle-right" onclick="plusDivs(1)"></i>
				</div>
			</div>
		</div>
		<br />
		<br />
		<div class="row">
			<div class=" col" >
				<h5 style="margin-left:100px">Suggested For You :</h5>
				<br />
				<img src="assets/product/Acrylic/carlos pun Mono.jpg" width="66" height="89" style="margin-left:100px;margin-bottom:30px"/>
			</div>
		</div>
	</div>
</asp:Content>
