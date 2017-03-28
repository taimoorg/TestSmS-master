Imports Microsoft.Practices.EnterpriseLibrary.Common
Imports Microsoft.Practices.EnterpriseLibrary.Data
Public Class ClassDataProvider
    Sub New()

    End Sub

    Public Shared Function P_Class_IU(obj As ClassInfo) As Integer
        Dim objDatabase As Database
        objDatabase = DatabaseFactory.CreateDatabase()
        Return CType(objDatabase.ExecuteDataSet("P_Class_IU", obj.Class_ID, obj.Class_Name), DataSet).Tables(0).Rows(0).Item(0)
    End Function

    Public Shared Function P_Class_GetAll() As DataTable
        Dim objDatabase As Database
        objDatabase = DatabaseFactory.CreateDatabase()
        Return CType(objDatabase.ExecuteDataSet("P_Class_GetAll"), DataSet).Tables(0)
    End Function

    Public Shared Sub P_Class_Delete(Class_ID As Integer)
        Dim objDatabase As Database
        objDatabase = DatabaseFactory.CreateDatabase()
        objDatabase.ExecuteNonQuery("P_Class_Delete", Class_ID)
    End Sub
End Class
