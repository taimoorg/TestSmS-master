Imports System.Web.Services

Public Class apisClass
    Inherits System.Web.UI.Page

    <WebMethod()> _
    Public Shared Function P_Class_IU(Class_ID As Integer, Class_Name As String) As Integer
        Return ClassDataProvider.P_Class_IU(New ClassInfo(Class_ID, Class_Name))
    End Function

    <WebMethod()> _
    Public Shared Function P_Class_Delete(Class_ID As Integer) As Integer
        ClassDataProvider.P_Class_Delete(Class_ID)
        Return 1
    End Function

    <WebMethod()> _
    Public Shared Function GetHtmlTable() As String
        Dim dt As DataTable
        dt = ClassDataProvider.P_Class_GetAll()
        Return GetHtmlTable(dt)
    End Function

    Private Shared Function GetHtmlTable(dt As DataTable) As String
        Dim HtmlTable As New StringBuilder()
        HtmlTable.Append("<table  align='center' border='1' cellpadding=5 cellspacing=0 width=60% >")
        HtmlTable.Append("<tr>")

        HtmlTable.Append("<th align='left'>Class</th>")
        HtmlTable.Append("<th align='left'>Delete</th>")

        HtmlTable.Append("</tr>")

        For i As Integer = 0 To dt.Rows.Count - 1
            HtmlTable.Append("<tr>")
            HtmlTable.Append(String.Format("<td>{0}</td>", dt.Rows(i)("Class_Name")))


            HtmlTable.Append(String.Format("<td><a href='javascript:Del_Record({0});'style ='color:#CC0000'>Delete</a></td>", dt.Rows(i)("Class_ID")))
            HtmlTable.Append("</tr>")
        Next
        HtmlTable.Append("</table>")
        Return HtmlTable.ToString()
    End Function


End Class