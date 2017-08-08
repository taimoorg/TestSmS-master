<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Main.Master" CodeBehind="Teacher.aspx.vb" Inherits="TestSmS.Teacher" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>School System | Teacher</title>
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
                            <li><a href="Index.aspx">Home</a></li>
                            <li ><a href="Student.aspx">Student</a></li>
                            <li class="active"><a href="Teacher.aspx">Teacher  </a></li>
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
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

  

</asp:Content>
