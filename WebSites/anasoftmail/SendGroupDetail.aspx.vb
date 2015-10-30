
Partial Class SendGroupDetail
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Dim mode As String = Page.Request.QueryString("mode")

        If mode = "0" Then
            Me.FormView1.ChangeMode(FormViewMode.ReadOnly)
        ElseIf mode = "1" Then
            Me.FormView1.ChangeMode(FormViewMode.Insert)
        ElseIf mode = "2" Then
            Me.FormView1.ChangeMode(FormViewMode.Edit)
        End If
    End Sub
End Class
