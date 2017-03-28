Public Class ClassInfo

    Public Property Class_ID As Integer
    Public Property Class_Name As String

    Sub New()

    End Sub

    Sub New(id As Integer, name As String)
        Class_ID = id
        Class_Name = name

    End Sub
End Class
