<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Main.Master" CodeBehind="Index.aspx.vb" Inherits="TestSmS.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>School System | Home</title>
    <div class="header">
        <div class="header-top">
            <div class="container">
                <div class="head-top">
                    <div class="logo">
                        <h1><a href="Index.aspx">Games  <span>Park</span></a></h1>
                    </div>
                    <div class="top-nav">
                        <span class="menu">
                            <img src="images/menu.png" alt=""/>
                        </span>
                        <ul>
                            <li class="active"><a href="Index.aspx">Home</a></li>
                            <li><a href="Student.aspx">Student</a></li>
                            <li><a href="Teacher.aspx">Teacher  </a></li>
                            <li><a href="about.html">About</a></li>
                            <li><a href="blog.html">Blog</a></li>
                            <li><a href="contact.html">Contact</a></li>
                            <div class="clearfix"></div>
                        </ul>

                        <!--script-->
                        <script>
                            $("span.menu").click(function () {
                                $(".top-nav ul").slideToggle(500, function () {
                                });
                            });
                        </script>

                    </div>

                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<%--  ================================================ Body Part =========================================================--%>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
			<div class="content-bottom">
				<div class="col-md-6 bottom-content1">
                  
					<!--<iframe src="https://player.vimeo.com/video/72892268"  webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>-->
				</div>
				<div class="col-md-6 bottom-content">
					<h4>Nertyase riti masertas lertyarty tsaera</h4>
                    <p style="text-align:left justify">
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod.Contrary to popular belief, Lorem Ipsum is not simply random text.
                        There are many variations of passages of Lorem Ipsum available, but Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                        The standard chunk of Lorem Ipsum used since the 1500s is There are many variations of passages of Lorem Ipsum available, but.
                        The standard chunk of Lorem Ipsum used since the 1500s is Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                        Contrary to popular belief, Lorem Ipsum is not simply random text
                    </p>
					<!--<ul>
						<li><a href="#"><i class="glyphicon glyphicon-ok"></i> Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod.</a></li>
						<li><a href="#"><i class="glyphicon glyphicon-ok"></i> Contrary to popular belief, Lorem Ipsum is not simply random text.</a></li>
						<li><a href="#"><i class="glyphicon glyphicon-ok"></i> There are many variations of passages of Lorem Ipsum available, but .</a></li>
						<li><a href="#"><i class="glyphicon glyphicon-ok"></i> Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod.</a></li>
						<li><a href="#"><i class="glyphicon glyphicon-ok"></i> The standard chunk of Lorem Ipsum used since the 1500s is .</a></li>
						<li><a href="#"><i class="glyphicon glyphicon-ok"></i> There are many variations of passages of Lorem Ipsum available, but.</a></li>
						<li><a href="#"><i class="glyphicon glyphicon-ok"></i> Contrary to popular belief, Lorem Ipsum is not simply random text.</a></li>
						<li><a href="#"><i class="glyphicon glyphicon-ok"></i> The standard chunk of Lorem Ipsum used since the 1500s is.</a></li>
						<li><a href="#"><i class="glyphicon glyphicon-ok"></i> Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod.</a></li>
						<li><a href="#"><i class="glyphicon glyphicon-ok"></i> Contrary to popular belief, Lorem Ipsum is not simply random text.</a></li>
						
					</ul>-->
				</div>
				
				<div class="clearfix"> </div>
			</div>
		</div>
</asp:Content>
