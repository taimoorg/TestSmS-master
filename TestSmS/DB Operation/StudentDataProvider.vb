Imports Microsoft.Practices.EnterpriseLibrary.Common
Imports Microsoft.Practices.EnterpriseLibrary.Data
Public Class StudentDataProvider
    Sub New()

    End Sub
    Public Shared Function P_Student_GetAll() As DataTable
        Dim objDatabase As Database
        objDatabase = DatabaseFactory.CreateDatabase()
        Return CType(objDatabase.ExecuteDataSet("P_Student_GetAll"), DataSet).Tables(0)
    End Function

    Public Shared Function P_Student_IU(obj As StudentInfo) As Integer
        Dim objDatabase As Database
        objDatabase = DatabaseFactory.CreateDatabase()
        Return CType(objDatabase.ExecuteDataSet("P_Student_IU", obj.St_ID, obj.St_Name, obj.St_DOB, obj.ST_Gender, obj.Class_ID), DataSet).Tables(0).Rows(0).Item(0)
    End Function

    Public Shared Sub P_Student_Delete(St_ID As Integer)
        Dim objDatabase As Database
        objDatabase = DatabaseFactory.CreateDatabase()
        objDatabase.ExecuteNonQuery("P_Student_Delete", St_ID)
    End Sub

    Public Shared Function P_Student_GetBy_Id(St_ID) As DataRow
        Dim objDatabase As Database
        objDatabase = DatabaseFactory.CreateDatabase()
        Return CType(objDatabase.ExecuteDataSet("P_Student_GetBy_Id", St_ID), DataSet).Tables(0).Rows(0)
    End Function
End Class
