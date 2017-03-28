<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Main.Master" CodeBehind="Class.aspx.vb" Inherits="TestSmS._Class" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<%--    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.8.23/jquery-ui.min.js"></script>
    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.23/themes/smoothness/jquery-ui.css" rel="stylesheet" type="text/css" media="all" />--%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

     <script type="text/javascript">
         $(function () {
             $("#dialog").dialog({
                 autoOpen: false,
                 model: true,
                 show: {
                     effect: "blind",
                     duration: 1000
                 },
                 hide: {
                     effect: "explode",
                     duration: 1000
                 }
             });

             $("#opener").on("click", function () {
                 $("#dialog").dialog("open");
             });
         });
     </script>

    <div>
        <h2>Class Page</h2>
    </div>

      <div id="dialog" title="Basic dialog">
      <p>This is an animated dialog which is useful for displaying information. The dialog window can be moved, resized and closed with the 'x' icon.</p>
      </div>
 
<button id="opener">Open Dialog</button>
</asp:Content>
