﻿<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Main.Master" CodeBehind="Student.aspx.vb" Inherits="TestSmS.Student" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>School System | Student</title>
    <div class="header">
        <div class="header-top">
            <div class="container">
                <div class="head-top">
                    <div class="logo">
                        <h1><a href="Index.aspx">Games  <span>Park</span></a></h1>
                    </div>
                    <div class="top-nav">
                        <span class="menu">
                            <img src="images/menu.png" alt="" />
                        </span>
                        <ul>
                            <li><a href="Index.aspx">Home</a></li>
                            <li class="active"><a href="Student.aspx">Student</a></li>
                            <li><a href="Teacher.aspx">Teacher  </a></li>
                            <li><a href="about.html">About</a></li>
                            <li><a href="blog.html">Blog</a></li>
                            <li><a href="contact.html">Contact</a></li>
                           
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

    <div class="contact">
        <div class="container">
            <div class="contact-grids">
                <h3>Add New Student</h3>
                <br />
                <div class="col-md-6 contact-form">
                    <form>
                        <div class="contact-bottom">
                            <input type="text" placeholder="Name"/>
                            <input type="text" placeholder="Email"/>
                            <input type="text" placeholder="Phonenumber"/>
                            <textarea placeholder="Message" required=""></textarea>
                            <input type="submit" value="Send"/>
                        </div>
                    </form>
                </div>

                <div class="clearfix"></div>

            </div>
        </div>
    </div>
    <!--//content-->




    <script type="text/javascript">

        var editdialog
        $(document).ready(function () {
            SetDialog();
            FillTable();
            DropDownList();
        });

        function FillTable() {
            $.ajax({
                type: "Post",
                url: "apiStudent.aspx/GetTable",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                beforeSend: function () { $('#overlay').show(); },
                success: function (response) {
                    $("#Gettbl").html(response.d);
                },
                failure: function (response) {
                    $('#overlay').hide();
                    alert(response.d);
                },
                error: function (response) {
                    $('#overlay').hide();
                    alert(response.d);
                }
            });
        }

        function SetDialog() {
            editdialog = $("#dialog").dialog({
                autoOpen: false,
                title: "View Details",
                modal: true,
                buttons: {
                    "Save": SaveData,
                    Cancel: function () {
                        $(this).dialog("close");
                    }
                },
            });
        }

        function SaveData() {
            var gender;
            if ($("#radio_1").prop("checked")) {
                gender = "M";
            }
            else {
                gender = "F";
            }
            $.ajax({
                type: "POST",
                url: "apiStudent.aspx/P_Student_IU",
                data: '{St_ID: ' + $("#id").html() + ',St_Name:"' + $("#txtName").val() + '",St_DOB:"' + $("#txtDOB").val() + '",ST_Gender:"' + gender + '",Class_ID:"' + $("[id$=ddlClass]").val() + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                beforeSend: function () { $('#overlay').show(); },
                success: function (response) {
                    $('#overlay').hide();
                    editdialog.dialog("close");
                    FillTable();
                },
                failure: function (response) {
                    $('#overlay').hide();
                    alert(response.d);
                },
                error: function (response) {
                    $('#overlay').hide();
                    alert(response.d);
                }
            });
        }

        function AddStudent() {

            $("#id").html(0);
            $("#txtName").val("");
            $("#txtDOB").datepicker().val("");
            $("#radio_1").prop("checked", true);
            $("#ddlClass").val("");

            editdialog.dialog("open");
        }

        function Del_Record(St_ID) {
            $.ajax({
                type: "POST",
                url: "apiStudent.aspx/P_Student_Delete",
                data: '{St_ID: ' + St_ID + '}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    FillTable();
                }
            });
        }
        function OpenDialog(St_ID) {
            $.ajax({
                type: "Post",
                url: "apiStudent.aspx/P_Student_GetBy_Id",
                data: '{St_ID: ' + St_ID + '}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                beforeSend: function () { $('#overlay').show(); },
                success: function (response) {
                    $('#overlay').hide();
                    $("#id").html(response.d.St_ID);
                    $("#txtName").val(response.d.St_Name); // RETURNED THE SAME RECORD WHICH WAS INSERTED AT NEW EMPLOYEE
                    $("#txtDOB").val(response.d.St_DOB).datepicker();

                    editdialog.dialog("open");
                },
                failure: function (response) {
                    $('#overlay').hide();
                    alert(response.d);
                },
                error: function (response) {
                    $('#overlay').hide();
                    alert(response.d);
                }
            });
        }

        // INNER DROP DOWN LIST
        function DropDownList() {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "apisClass.aspx/ClassDropDownList",
                data: "{}",
                dataType: "json",
                success: function (Result) {
                    Result = Result.d;
                    $.each(Result, function (key, value) {
                        $("[id$=ddlClass]").append($("<option></option>").val
                        (value.Class_ID).html(value.Class_Name));
                    });
                },
                error: function (Result) {
                    alert("Error");
                }
            });
        }

    </script>

    <%--............................................................Body Part............................................................................--%>
    <div>
       
    </div>
    <form id="form1" runat="server">

        <br />
        <div id="dialog" style="display: none">
            <b>id:</b> <span id="id"></span>
            <%-- <input id ="id" type ="hidden" /> --%>
            <br />
            <b>Student Name:</b>
            <input id="txtName" type="text" /><br />
            <b>DOB:</b>
            <input id="txtDOB" type="text" /><br />

            <b>Select Class:</b>
            <asp:DropDownList ID="ddlClass" runat="server" Width="160px" />
            <br />
            <b>Gender:</b>
            <div id="Radio">
                <input type='radio' id='radio_1' name='type' value='1' />
                <label for="radio_1">Male</label>
                <input type='radio' id='radio_2' name='type' value='2' />
                <label for="radio_2">Female</label>
            </div>
        </div>
        <br />
        <div id="Gettbl"></div>
        <br />
    </form>
</asp:Content>
