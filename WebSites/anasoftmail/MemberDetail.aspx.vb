Imports System.Data

Partial Class MemberDetail
    Inherits System.Web.UI.Page

    Dim loadflg As Boolean = True

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

    Protected Sub FormView1_DataBound(sender As Object, e As System.EventArgs) Handles FormView1.DataBound
        Dim dlyear As DropDownList
        Dim dlmonth As DropDownList
        Dim dlday As DropDownList
        Dim i As Integer
        Dim strYear As String = ""
        Dim strMonth As String = ""
        Dim strDay As String = ""
        Dim dview As DataView

        Select Case FormView1.CurrentMode
            Case FormViewMode.Edit, FormViewMode.Insert
                dlyear = FormView1.Row.FindControl("LIMIT_YEAR")
                dlmonth = FormView1.Row.FindControl("LIMIT_MONTH")
                dlday = FormView1.Row.FindControl("LIMIT_DAY")

                If FormView1.CurrentMode = FormViewMode.Insert Then
                    strYear = Format(Now, "yyyy")
                    strMonth = CStr(CInt(Format(Now, "MM")))
                    strDay = CStr(CInt(Format(Now, "dd")))
                ElseIf FormView1.CurrentMode = FormViewMode.Edit Then
                    dview = CType(SqlDataSource1.Select(DataSourceSelectArguments.Empty), DataView)

                    If dview.Count > 0 Then
                        strYear = dview(0)("LIMIT_YEAR").ToString
                        strMonth = dview(0)("LIMIT_MONTH").ToString
                        strDay = dview(0)("LIMIT_DAY").ToString
                    End If
                End If

                If strYear <> "" And strMonth <> "" And strDay <> "" Then
                    dlyear.Text = strYear
                    dlmonth.Text = strMonth
                    dlday.Text = strDay
                End If

                loadflg = False
        End Select

    End Sub

    Protected Sub SqlDataSource1_Inserting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlDataSource1.Inserting
        Dim dlyear As DropDownList = FormView1.Row.FindControl("LIMIT_YEAR")
        Dim dlmonth As DropDownList = FormView1.Row.FindControl("LIMIT_MONTH")
        Dim dlday As DropDownList = FormView1.Row.FindControl("LIMIT_DAY")

        e.Command.Parameters("@LIMIT_YEAR").Value = dlyear.SelectedValue
        e.Command.Parameters("@LIMIT_MONTH").Value = dlmonth.SelectedValue
        e.Command.Parameters("@LIMIT_DAY").Value = dlday.SelectedValue
    End Sub

    Protected Sub SqlDataSource1_Updating(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlDataSource1.Updating
        Dim dlyear As DropDownList = FormView1.Row.FindControl("LIMIT_YEAR")
        Dim dlmonth As DropDownList = FormView1.Row.FindControl("LIMIT_MONTH")
        Dim dlday As DropDownList = FormView1.Row.FindControl("LIMIT_DAY")

        e.Command.Parameters("@LIMIT_YEAR").Value = dlyear.SelectedValue
        e.Command.Parameters("@LIMIT_MONTH").Value = dlmonth.SelectedValue
        e.Command.Parameters("@LIMIT_DAY").Value = dlday.SelectedValue
    End Sub
End Class
