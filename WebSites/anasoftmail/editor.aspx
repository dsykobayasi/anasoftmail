<%@ Page Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="editor.aspx.vb" Inherits="editor" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit.HTMLEditor" tagprefix="myTagPrefix" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
        
        
</asp:ToolkitScriptManager>
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="MAIL_CODE" 
        DataSourceID="SqlDataSource1" Height="267px" Width="871px" >
        <EditItemTemplate>
            コース名:
            <asp:DropDownList ID="SEND_GROUP_CODEListEdit" runat="server"
                DataSourceID="SqlDataSource2"
                DataTextField="SEND_GROUP_NAME"
                DataValueField="SEND_GROUP_CODE"
                AutoPostBack="True"
                SelectedValue='<%# Bind("SEND_GROUP_CODE") %>'
                />
            <br />
            本文:
            <myTagPrefix:Editor ID="Editor1Edit" runat="server" 
                Content='<%# Bind("MAIL_BODY") %>'/>
            <br />
            送信予定日時:
            <asp:DropDownList ID="SEND_SCHEDULE_YEAR" runat="server"
                AutoPostBack="True"
                DataSourceID="dsYear" DataTextField="SEND_SCHEDULE_YEAR" DataValueField="SEND_SCHEDULE_YEAR"
            >
            </asp:DropDownList>
            年
            <asp:DropDownList ID="SEND_SCHEDULE_MONTH" runat="server"
                AutoPostBack="True" 
                DataSourceID="dsMonth" DataTextField="SEND_SCHEDULE_MONTH" DataValueField="SEND_SCHEDULE_MONTH">
            </asp:DropDownList>
            月
            <asp:DropDownList ID="SEND_SCHEDULE_DAY" runat="server"
                DataSourceID="dsDay" DataTextField="SEND_SCHEDULE_DAY" DataValueField="SEND_SCHEDULE_DAY">
            </asp:DropDownList>
            日
            <asp:DropDownList ID="SEND_SCHEDULE_HOUR" runat="server" AutoPostBack="False">
                <asp:ListItem>0</asp:ListItem>
            </asp:DropDownList>
            時
            <asp:DropDownList ID="SEND_SCHEDULE_MINUTE" runat="server" AutoPostBack="False">
                <asp:ListItem>0</asp:ListItem>
            </asp:DropDownList>
            分
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="送信" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" 
                CommandName="Delete" Text="削除" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="キャンセル" />
            <asp:SqlDataSource ID="dsYear" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:maildataConnectionString %>" SelectCommand="
        WITH DateTable (MyDate)
        AS
        (
             SELECT	CONVERT(DATE, STR(YEAR(dateadd(YEAR,-10,GETDATE())))+'/1/1')
             UNION ALL
             SELECT	DATEADD(YEAR, 1, MyDate)
             FROM   DateTable
             WHERE  MyDate &lt; CONVERT(DATE, STR(YEAR(dateadd(YEAR,10,GETDATE())))+'/11/30')
        )
        SELECT   rtrim(ltrim(str(year(mydate)))) SEND_SCHEDULE_YEAR
        FROM     DateTable
        OPTION (MAXRECURSION 0)">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="dsMonth" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:maildataConnectionString %>" SelectCommand="
        WITH DateTable (MyDate)
        AS
        (
             SELECT	CONVERT(DATE, @SEND_SCHEDULE_YEAR+'/1/1')
             UNION ALL
             SELECT	DATEADD(m, 1, MyDate)
             FROM   DateTable
             WHERE  MyDate &lt; CONVERT(DATE, @SEND_SCHEDULE_YEAR+'/11/30')
        )
        SELECT   rtrim(ltrim(str(month(mydate)))) SEND_SCHEDULE_MONTH
        FROM     DateTable
        OPTION (MAXRECURSION 0)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="SEND_SCHEDULE_YEAR" Name="SEND_SCHEDULE_YEAR" 
                        PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="dsDay" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:maildataConnectionString %>" SelectCommand="
        WITH DateTable (MyDate)
        AS
        (
             SELECT	CONVERT(DATE, @SEND_SCHEDULE_YEAR+'/'+@SEND_SCHEDULE_MONTH+'/1')
             UNION ALL
             SELECT	DATEADD(dd, 1, MyDate)
             FROM   DateTable
             WHERE  MyDate &lt; DATEADD(d,-1,DATEADD(M,1,CONVERT(DATE, @SEND_SCHEDULE_YEAR+'/'+@SEND_SCHEDULE_MONTH+'/1')))
        )
        SELECT   rtrim(ltrim(str(DAY(mydate)))) SEND_SCHEDULE_DAY
        FROM     DateTable
        OPTION (MAXRECURSION 0)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="SEND_SCHEDULE_YEAR" Name="SEND_SCHEDULE_YEAR" 
                        PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="SEND_SCHEDULE_MONTH" Name="SEND_SCHEDULE_MONTH" 
                        PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </EditItemTemplate>
        <InsertItemTemplate>
            コース名:
            <asp:DropDownList ID="SEND_GROUP_CODEListInsert" runat="server"
                DataSourceID="SqlDataSource2"
                DataTextField="SEND_GROUP_NAME"
                DataValueField="SEND_GROUP_CODE"
                AutoPostBack="True"
                SelectedValue='<%# Bind("SEND_GROUP_CODE") %>'
                />
            <br />
            本文:
            <myTagPrefix:Editor ID="Editor1Insert" runat="server" 
                Content='<%# Bind("MAIL_BODY") %>'/>
            <br />
            送信予定日時:
            <asp:DropDownList ID="SEND_SCHEDULE_YEAR" runat="server"
                AutoPostBack="True"
                DataSourceID="dsYear" DataTextField="SEND_SCHEDULE_YEAR" DataValueField="SEND_SCHEDULE_YEAR"
            >
            </asp:DropDownList>
            年
            <asp:DropDownList ID="SEND_SCHEDULE_MONTH" runat="server"
                AutoPostBack="True" 
                DataSourceID="dsMonth" DataTextField="SEND_SCHEDULE_MONTH" DataValueField="SEND_SCHEDULE_MONTH">
            </asp:DropDownList>
            月
            <asp:DropDownList ID="SEND_SCHEDULE_DAY" runat="server"
                DataSourceID="dsDay" DataTextField="SEND_SCHEDULE_DAY" DataValueField="SEND_SCHEDULE_DAY">
            </asp:DropDownList>
            日
            <asp:DropDownList ID="SEND_SCHEDULE_HOUR" runat="server" AutoPostBack="False">
                <asp:ListItem>0</asp:ListItem>
            </asp:DropDownList>
            時
            <asp:DropDownList ID="SEND_SCHEDULE_MINUTE" runat="server" AutoPostBack="False">
                <asp:ListItem>0</asp:ListItem>
            </asp:DropDownList>
            分
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="送信" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="キャンセル" />
            <asp:SqlDataSource ID="dsYear" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:maildataConnectionString %>" SelectCommand="
        WITH DateTable (MyDate)
        AS
        (
             SELECT	CONVERT(DATE, STR(YEAR(dateadd(YEAR,-10,GETDATE())))+'/1/1')
             UNION ALL
             SELECT	DATEADD(YEAR, 1, MyDate)
             FROM   DateTable
             WHERE  MyDate &lt; CONVERT(DATE, STR(YEAR(dateadd(YEAR,10,GETDATE())))+'/11/30')
        )
        SELECT   rtrim(ltrim(str(year(mydate)))) SEND_SCHEDULE_YEAR
        FROM     DateTable
        OPTION (MAXRECURSION 0)">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="dsMonth" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:maildataConnectionString %>" SelectCommand="
        WITH DateTable (MyDate)
        AS
        (
             SELECT	CONVERT(DATE, @SEND_SCHEDULE_YEAR+'/1/1')
             UNION ALL
             SELECT	DATEADD(m, 1, MyDate)
             FROM   DateTable
             WHERE  MyDate &lt; CONVERT(DATE, @SEND_SCHEDULE_YEAR+'/11/30')
        )
        SELECT   rtrim(ltrim(str(month(mydate)))) SEND_SCHEDULE_MONTH
        FROM     DateTable
        OPTION (MAXRECURSION 0)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="SEND_SCHEDULE_YEAR" Name="SEND_SCHEDULE_YEAR" 
                        PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="dsDay" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:maildataConnectionString %>" SelectCommand="
        WITH DateTable (MyDate)
        AS
        (
             SELECT	CONVERT(DATE, @SEND_SCHEDULE_YEAR+'/'+@SEND_SCHEDULE_MONTH+'/1')
             UNION ALL
             SELECT	DATEADD(dd, 1, MyDate)
             FROM   DateTable
             WHERE  MyDate &lt; DATEADD(d,-1,DATEADD(M,1,CONVERT(DATE, @SEND_SCHEDULE_YEAR+'/'+@SEND_SCHEDULE_MONTH+'/1')))
        )
        SELECT   rtrim(ltrim(str(DAY(mydate)))) SEND_SCHEDULE_DAY
        FROM     DateTable
        OPTION (MAXRECURSION 0)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="SEND_SCHEDULE_YEAR" Name="SEND_SCHEDULE_YEAR" 
                        PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="SEND_SCHEDULE_MONTH" Name="SEND_SCHEDULE_MONTH" 
                        PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </InsertItemTemplate>
        <ItemTemplate>
            コース名:
            <asp:Label ID="SEND_GROUPLabel" runat="server"
                Text='<%# Bind("SEND_GROUP_NAME") %>'
            />
            <br />
            本文:
            <myTagPrefix:Editor ID="Editor1" runat="server"
                Content='<%# Bind("MAIL_BODY") %>' />
            <br />
            送信予定時間:
            <asp:Label ID="SEND_SCHEDULE_DATELabel" runat="server" 
                Text='<%# Bind("SEND_SCHEDULE_DATE") %>' />
            <br />
            送信時間:
            <asp:Label ID="SEND_DATELabel" runat="server" 
                Text='<%# Bind("SEND_DATE") %>' />
            <br />
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:maildataConnectionString %>" 
        
        SelectCommand="SELECT T_MAIL.MAIL_CODE, T_MAIL.SEND_GROUP_CODE, M_SEND_GROUP.SEND_GROUP_NAME, T_MAIL.MAIL_BODY, T_MAIL.CREATE_DATE, T_MAIL.SEND_SCHEDULE_DATE, T_MAIL.SEND_FLG, T_MAIL.SEND_DATE FROM T_MAIL INNER JOIN M_SEND_GROUP ON T_MAIL.SEND_GROUP_CODE = M_SEND_GROUP.SEND_GROUP_CODE WHERE (T_MAIL.MAIL_CODE = @MAIL_CODE)" 
        UpdateCommand="UPDATE T_MAIL SET SEND_GROUP_CODE = @SEND_GROUP_CODE, MAIL_SUBJECT = M_SEND_GROUP.SEND_GROUP_NAME, MAIL_BODY = @MAIL_BODY, SEND_FLG = 0, CREATE_DATE = CONVERT (DATETIME, GETDATE()), SEND_SCHEDULE_DATE = CONVERT (DateTime, @SEND_SCHEDULE_YEAR + '/' + @SEND_SCHEDULE_MONTH + '/' + @SEND_SCHEDULE_DAY + ' ' + @SEND_SCHEDULE_HOUR + ':' + @SEND_SCHEDULE_MINUTE, 111), SEND_DATE = NULL FROM T_MAIL INNER JOIN M_SEND_GROUP ON T_MAIL.SEND_GROUP_CODE = M_SEND_GROUP.SEND_GROUP_CODE WHERE (T_MAIL.MAIL_CODE = @Mail_Code)" 
        
        
        InsertCommand="INSERT INTO T_MAIL (SEND_GROUP_CODE, MAIL_SUBJECT, MAIL_BODY, CREATE_DATE, SEND_SCHEDULE_DATE, SEND_FLG) SELECT @SEND_GROUP_CODE AS SEND_GROUP_CODE, SEND_GROUP_NAME AS MAIL_SUBJECT, @MAIL_BODY AS MAIL_BODY, CONVERT(DATETIME, GETDATE()) AS CREATE_DATE, CONVERT (DateTime, @SEND_SCHEDULE_YEAR + '/' + @SEND_SCHEDULE_MONTH + '/' + @SEND_SCHEDULE_DAY + ' ' + @SEND_SCHEDULE_HOUR + ':' + @SEND_SCHEDULE_MINUTE, 111),  0 AS SEND_FLG FROM M_SEND_GROUP WHERE SEND_GROUP_CODE = @SEND_GROUP_CODE" 
        DeleteCommand="DELETE FROM T_MAIL WHERE (MAIL_CODE = @MAIL_CODE)">
        <DeleteParameters>
            <asp:Parameter Name="MAIL_CODE" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="SEND_GROUP_CODE" />
            <asp:Parameter Name="MAIL_BODY" />
            <asp:Parameter Name="SEND_SCHEDULE_YEAR" />
            <asp:Parameter Name="SEND_SCHEDULE_MONTH" />
            <asp:Parameter Name="SEND_SCHEDULE_DAY" />
            <asp:Parameter Name="SEND_SCHEDULE_HOUR" />
            <asp:Parameter Name="SEND_SCHEDULE_MINUTE" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="MAIL_CODE" QueryStringField="MAIL_CODE" 
                Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="SEND_GROUP_CODE" />
            <asp:Parameter Name="MAIL_BODY" />
            <asp:Parameter Name="SEND_SCHEDULE_YEAR" />
            <asp:Parameter Name="SEND_SCHEDULE_MONTH" />
            <asp:Parameter Name="SEND_SCHEDULE_DAY" />
            <asp:Parameter Name="SEND_SCHEDULE_HOUR" />
            <asp:Parameter Name="SEND_SCHEDULE_MINUTE" />
            <asp:Parameter Name="Mail_Code" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:maildataConnectionString %>" 
        
        SelectCommand="SELECT SEND_GROUP_CODE, SEND_GROUP_NAME FROM M_SEND_GROUP ORDER BY SEND_GROUP_CODE ">
    </asp:SqlDataSource>
</asp:Content>
