<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Main.Master" CodeBehind="Class.aspx.vb" Inherits="TestSmS._Class" %>

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
                url: "apisClass.aspx/GetHtmlTable",
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
            $.ajax({
                type: "POST",
                url: "apisClass.aspx/P_Class_IU",
                data: '{Class_ID: ' + $("#id").html() + ',Class_Name:"' + $("#txtName").val() + '"}',
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
           
            editdialog.dialog("open");
        }

        function Del_Record(Class_ID) {
            $.ajax({
                type: "POST",
                url: "apisClass.aspx/P_Class_Delete",
                data: '{Class_ID: ' + Class_ID + '}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    FillTable();
                }
            });
        }
    </script>

    <%--============================================  Body Part  ===========================================================--%>
    <div>
        <button style="height: 40px; width: 140px; font-size: 18px" type="button" onclick="AddStudent();return false;">Add Class </button>
    </div>
    <br />

    <div id="dialog" style="display: none">
        <b>Id:</b> <span id="id"></span>
        <br />
        <b>Class:</b>
        <input id="txtName" type="text" /><br />
    </div>

    <div id="Gettbl"></div>

</asp:Content>
