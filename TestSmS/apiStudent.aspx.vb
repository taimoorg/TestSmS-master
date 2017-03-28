Imports System.Web.Services
Public Class apiStudent
    Inherits System.Web.UI.Page

    <WebMethod()> _
    Public Shared Function P_Student_IU(St_ID As Integer, St_Name As String, St_DOB As String, ST_Gender As String) As Integer
        Return StudentDataProvider.P_Student_IU(New StudentInfo(St_ID, St_Name, St_DOB, ST_Gender))

    End Function

    <WebMethod()> _
    Public Shared Function P_Student_Delete(St_ID As Integer) As Integer
        StudentDataProvider.P_Student_Delete(St_ID)
        Return 1
    End Function

    <WebMethod()> _
    Public Shared Function P_Student_GetBy_Id(St_ID As Integer) As StudentInfo
        Dim Ret As New StudentInfo
        Dim Dr As DataRow
        Dr = StudentDataProvider.P_Student_GetBy_Id(St_ID)
        With Ret
            .St_ID = Dr.Item("St_ID")
            .St_Name = Dr.Item("St_Name")
            .St_DOB = Dr.Item("St_DOB")
            .ST_Gender = Dr.Item("ST_Gender")
        End With
        Return Ret
    End Function

    <WebMethod()> _
    Public Shared Function GetTable() As String
        Dim dt As DataTable
        dt = StudentDataProvider.P_Student_GetAll()
        Return GethtmlTable(dt)
    End Function

    Private Shared Function GethtmlTable(dt As DataTable) As String
        Dim htmlTable As New StringBuilder()
        htmlTable.Append("<table  align='center' border='1' cellpadding=5 cellspacing=0 width=60% >")
        htmlTable.Append("<tr>")

        htmlTable.Append("<th align='left'>Name</th>")
        htmlTable.Append("<th align='left'>DOB</th>")
        htmlTable.Append("<th align='left'>Gender</th>")
        htmlTable.Append("<th align='left'>Edit</th>")
        htmlTable.Append("<th align='left'>Delete</th>")

        htmlTable.Append("</tr>")

        For i As Integer = 0 To dt.Rows.Count - 1
            htmlTable.Append("<tr>")
            htmlTable.Append(String.Format("<td>{0}</td>", dt.Rows(i)("St_Name")))
            htmlTable.Append(String.Format("<td>{0}</td>", Format(dt.Rows(i)("St_DOB"), "dd-MM-yy")))
            htmlTable.Append(String.Format("<td>{0}</td>", dt.Rows(i)("ST_Gender")))

            htmlTable.Append(String.Format("<td><a href='javascript:OpenDialog({0});'style ='color:#008000'</a> Edit</td>", dt.Rows(i)("St_ID")))
            htmlTable.Append(String.Format("<td><a href='javascript:Del_Record({0});'style ='color:#CC0000'>Delete</a></td>", dt.Rows(i)("St_ID")))
            htmlTable.Append("</tr>")
        Next
        htmlTable.Append("</table>")
        Return htmlTable.ToString()
    End Function

End Class