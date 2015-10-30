
Partial Class editor
    Inherits System.Web.UI.Page



    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Dim mode As String = Request.QueryString("mode")


        Select Case mode
            Case "0"
                FormView1.ChangeMode(FormViewMode.ReadOnly)
            Case "1"
                FormView1.ChangeMode(FormViewMode.Insert)
            Case "2"
                FormView1.ChangeMode(FormViewMode.Edit)
        End Select
    End Sub

    Protected Sub FormView1_DataBound(sender As Object, e As System.EventArgs) Handles FormView1.DataBound
        Dim dlyear As DropDownList
        Dim dlmonth As DropDownList
        Dim dlday As DropDownList
        Dim dlhour As DropDownList
        Dim dlminute As DropDownList
        Dim i As Integer
        Dim strYear As String
        Dim strMonth As String
        Dim strDay As String
        Dim strHour As String
        Dim strMinute As String

        Select Case FormView1.CurrentMode
            Case FormViewMode.Edit, FormViewMode.Insert
                dlyear = FormView1.Row.FindControl("SEND_SCHEDULE_YEAR")
                dlmonth = FormView1.Row.FindControl("SEND_SCHEDULE_MONTH")
                dlday = FormView1.Row.FindControl("SEND_SCHEDULE_DAY")
                dlhour = FormView1.Row.FindControl("SEND_SCHEDULE_HOUR")
                dlminute = FormView1.Row.FindControl("SEND_SCHEDULE_MINUTE")

                If Not IsNothing(dlyear) Then
                    strYear = Format(Now, "yyyy")
                    strMonth = CStr(CInt(Format(Now, "MM")))
                    strDay = CStr(CInt(Format(Now, "dd")))
                    strHour = CStr(CInt(Format(Now, "HH")))
                    strMinute = CStr(CInt(Format(Now, "mm")))

                    dlhour.Items.Clear()
                    For i = 0 To 23
                        dlhour.Items.Add(CStr(i))
                    Next

                    dlminute.Items.Clear()
                    For i = 0 To 59
                        dlminute.Items.Add(CStr(i))
                    Next
                    dlyear.Text = strYear
                    dlmonth.Text = strMonth
                    dlday.Text = strDay
                    dlhour.Text = strHour
                    dlminute.Text = strMinute
                End If

        End Select
    End Sub

    Protected Sub SqlDataSource1_Inserting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlDataSource1.Inserting
        Dim dlyear As DropDownList = FormView1.Row.FindControl("SEND_SCHEDULE_YEAR")
        Dim dlmonth As DropDownList = FormView1.Row.FindControl("SEND_SCHEDULE_MONTH")
        Dim dlday As DropDownList = FormView1.Row.FindControl("SEND_SCHEDULE_DAY")
        Dim dlhour As DropDownList = FormView1.Row.FindControl("SEND_SCHEDULE_HOUR")
        Dim dlminute As DropDownList = FormView1.Row.FindControl("SEND_SCHEDULE_MINUTE")

        e.Command.Parameters("@SEND_SCHEDULE_YEAR").Value = dlyear.SelectedValue
        e.Command.Parameters("@SEND_SCHEDULE_MONTH").Value = dlmonth.SelectedValue
        e.Command.Parameters("@SEND_SCHEDULE_DAY").Value = dlday.SelectedValue
        e.Command.Parameters("@SEND_SCHEDULE_HOUR").Value = dlhour.SelectedValue
        e.Command.Parameters("@SEND_SCHEDULE_MINUTE").Value = dlminute.SelectedValue
    End Sub

    Protected Sub SqlDataSource1_Updating(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlDataSource1.Updating
        Dim dlyear As DropDownList = FormView1.Row.FindControl("SEND_SCHEDULE_YEAR")
        Dim dlmonth As DropDownList = FormView1.Row.FindControl("SEND_SCHEDULE_MONTH")
        Dim dlday As DropDownList = FormView1.Row.FindControl("SEND_SCHEDULE_DAY")
        Dim dlhour As DropDownList = FormView1.Row.FindControl("SEND_SCHEDULE_HOUR")
        Dim dlminute As DropDownList = FormView1.Row.FindControl("SEND_SCHEDULE_MINUTE")

        e.Command.Parameters("@SEND_SCHEDULE_YEAR").Value = dlyear.SelectedValue
        e.Command.Parameters("@SEND_SCHEDULE_MONTH").Value = dlmonth.SelectedValue
        e.Command.Parameters("@SEND_SCHEDULE_DAY").Value = dlday.SelectedValue
        e.Command.Parameters("@SEND_SCHEDULE_HOUR").Value = dlhour.SelectedValue
        e.Command.Parameters("@SEND_SCHEDULE_MINUTE").Value = dlminute.SelectedValue
    End Sub
End Class
