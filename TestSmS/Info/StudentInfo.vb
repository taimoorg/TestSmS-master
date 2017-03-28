Public Class StudentInfo
    Public Property St_ID As Integer
    Public Property St_Name As String
    Public Property St_DOB As String
    Public Property ST_Gender As String

    Sub New()

    End Sub

    Sub New(id As Integer, name As String, dob As String, gender As String)
        St_ID = id
        St_Name = name
        St_DOB = dob
        ST_Gender = gender
    End Sub


End Class

