<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Main.Master" CodeBehind="Student.aspx.vb" Inherits="TestSmS.Student" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


    <script type="text/javascript">

        var editdialog
        $(document).ready(function () {
            SetDialog();
            FillTable();
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
                data: '{St_ID: ' + $("#id").html() + ',St_Name:"' + $("#txtName").val() + '",St_DOB:"' + $("#txtDOB").val() + '",ST_Gender:"' + gender + '"}',
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


    </script>

    <%--............................................................Body Part............................................................................--%>
    <div>
        <button style="height: 40px; width: 140px; font-size: 18px" type="button" onclick="AddStudent();return false;">Add Student </button>
    </div>
    <br />
    <div id="dialog" style="display: none">
        <b>Id:</b> <span id="id"></span>
        <br />
        <b>Student Name:</b>
        <input id="txtName" type="text" /><br />
        <b>DOB:</b>
        <input id="txtDOB" type="text" /><br />
        <b>Gender:</b>
        <div id="Radio">
            <input type='radio' id='radio_1' name='type' value='1' />
            <label for="radio_1">Male</label>
            <input type='radio' id='radio_2' name='type' value='2' />
            <label for="radio_2">Female</label>
        </div>
        <br />
    </div>

    <div id="Gettbl"></div>

</asp:Content>
