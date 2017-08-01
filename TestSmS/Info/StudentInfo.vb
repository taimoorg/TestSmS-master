Public Class StudentInfo
    Public Property St_ID As Integer
    Public Property St_Name As String
    Public Property St_DOB As Date
    Public Property ST_Gender As String
    Public Property Class_ID As Integer

    Sub New()

    End Sub

    Sub New(id As Integer, name As String, dob As Date, gender As String, classId As Integer)
        St_ID = id
        St_Name = name
        St_DOB = dob
        ST_Gender = gender
        Class_ID = classId
    End Sub


End Class
