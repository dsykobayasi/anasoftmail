<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="MemberDetail.aspx.vb" Inherits="MemberDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="USER_CODE" 
        DataSourceID="SqlDataSource1" Height="171px" Width="398px">
        <EditItemTemplate>
            名前:
            <asp:TextBox ID="USER_NAMETextBox" runat="server" 
                Text='<%# Bind("USER_NAME") %>' />
            <br />
            コース名:
            <asp:DropDownList ID="SEND_GROUP_CODEList" runat="server"
                DataSourceID="SqlDataSource2"
                DataTextField="SEND_GROUP_NAME"
                DataValueField="SEND_GROUP_CODE"
                AutoPostBack="True"
                SelectedValue='<%# Bind("SEND_GROUP_CODE") %>'
                />
            <br />
            期限:
            <asp:DropDownList ID="LIMIT_YEAR" runat="server"
                AutoPostBack="True"
                DataSourceID="dsYear" DataTextField="LIMIT_YEAR" DataValueField="LIMIT_YEAR"
            >
            </asp:DropDownList>
            年
            <asp:DropDownList ID="LIMIT_MONTH" runat="server"
                AutoPostBack="True" 
                DataSourceID="dsMonth" DataTextField="LIMIT_MONTH" DataValueField="LIMIT_MONTH">
            </asp:DropDownList>
            月
            <asp:DropDownList ID="LIMIT_DAY" runat="server"
                AutoPostBack="True" 
                DataSourceID="dsDay" DataTextField="LIMIT_DAY" DataValueField="LIMIT_DAY">
            </asp:DropDownList>
            日
            <br />
            メールアドレス:
            <asp:TextBox ID="MAIL_ADDRESSTextBox" runat="server" Text='<%# Bind("MAIL_ADDRESS") %>' />
            <br />
            備考:
            <asp:TextBox ID="REMARKSTextBox" runat="server" Text='<%# Bind("REMARKS") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="更新" />
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
        SELECT   rtrim(ltrim(str(year(mydate)))) LIMIT_YEAR
        FROM     DateTable
        OPTION (MAXRECURSION 0)">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="dsMonth" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:maildataConnectionString %>" SelectCommand="
        WITH DateTable (MyDate)
        AS
        (
             SELECT	CONVERT(DATE, @LIMIT_YEAR+'/1/1')
             UNION ALL
             SELECT	DATEADD(m, 1, MyDate)
             FROM   DateTable
             WHERE  MyDate &lt; CONVERT(DATE, @LIMIT_YEAR+'/11/30')
        )
        SELECT   rtrim(ltrim(str(month(mydate)))) LIMIT_MONTH
        FROM     DateTable
        OPTION (MAXRECURSION 0)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="LIMIT_YEAR" Name="LIMIT_YEAR" 
                        PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="dsDay" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:maildataConnectionString %>" SelectCommand="
        WITH DateTable (MyDate)
        AS
        (
             SELECT	CONVERT(DATE, @LIMIT_YEAR+'/'+@LIMIT_MONTH+'/1')
             UNION ALL
             SELECT	DATEADD(dd, 1, MyDate)
             FROM   DateTable
             WHERE  MyDate &lt; DATEADD(d,-1,DATEADD(M,1,CONVERT(DATE, @LIMIT_YEAR+'/'+@LIMIT_MONTH+'/1')))
        )
        SELECT   rtrim(ltrim(str(DAY(mydate)))) LIMIT_DAY
        FROM     DateTable
        OPTION (MAXRECURSION 0)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="LIMIT_YEAR" Name="LIMIT_YEAR" 
                        PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="LIMIT_MONTH" Name="LIMIT_MONTH" 
                        PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </EditItemTemplate>
        <InsertItemTemplate>
            名前:
            <asp:TextBox ID="USER_NAMETextBox" runat="server" 
                Text='<%# Bind("USER_NAME") %>' />
            <br />
            コース名:
            <asp:DropDownList ID="SEND_GROUP_CODEList" runat="server"
                DataSourceID="SqlDataSource2"
                DataTextField="SEND_GROUP_NAME"
                DataValueField="SEND_GROUP_CODE"
                AutoPostBack="True"
                SelectedValue='<%# Bind("SEND_GROUP_CODE") %>'
                />
            <br />
            期限:
            <asp:DropDownList ID="LIMIT_YEAR" runat="server"
                AutoPostBack="True"
                DataSourceID="dsYear" DataTextField="LIMIT_YEAR" DataValueField="LIMIT_YEAR"
            >
            </asp:DropDownList>
            年
            <asp:DropDownList ID="LIMIT_MONTH" runat="server"
                AutoPostBack="True" 
                DataSourceID="dsMonth" DataTextField="LIMIT_MONTH" DataValueField="LIMIT_MONTH">
            </asp:DropDownList>
            月
            <asp:DropDownList ID="LIMIT_DAY" runat="server"
                AutoPostBack="True" 
                DataSourceID="dsDay" DataTextField="LIMIT_DAY" DataValueField="LIMIT_DAY">
            </asp:DropDownList>
            日
            <br />
            メールアドレス:
            <asp:TextBox ID="MAIL_ADDRESSTextBox" runat="server" Text='<%# Bind("MAIL_ADDRESS") %>' />
            <br />
            備考:
            <asp:TextBox ID="REMARKSTextBox" runat="server" Text='<%# Bind("REMARKS") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="挿入" />
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
        SELECT   rtrim(ltrim(str(year(mydate)))) LIMIT_YEAR
        FROM     DateTable
        OPTION (MAXRECURSION 0)">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="dsMonth" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:maildataConnectionString %>" SelectCommand="
        WITH DateTable (MyDate)
        AS
        (
             SELECT	CONVERT(DATE, @LIMIT_YEAR+'/1/1')
             UNION ALL
             SELECT	DATEADD(m, 1, MyDate)
             FROM   DateTable
             WHERE  MyDate &lt; CONVERT(DATE, @LIMIT_YEAR+'/11/30')
        )
        SELECT   rtrim(ltrim(str(month(mydate)))) LIMIT_MONTH
        FROM     DateTable
        OPTION (MAXRECURSION 0)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="LIMIT_YEAR" Name="LIMIT_YEAR" 
                        PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="dsDay" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:maildataConnectionString %>" SelectCommand="
        WITH DateTable (MyDate)
        AS
        (
             SELECT	CONVERT(DATE, @LIMIT_YEAR+'/'+@LIMIT_MONTH+'/1')
             UNION ALL
             SELECT	DATEADD(dd, 1, MyDate)
             FROM   DateTable
             WHERE  MyDate &lt; DATEADD(d,-1,DATEADD(M,1,CONVERT(DATE, @LIMIT_YEAR+'/'+@LIMIT_MONTH+'/1')))
        )
        SELECT   rtrim(ltrim(str(DAY(mydate)))) LIMIT_DAY
        FROM     DateTable
        OPTION (MAXRECURSION 0)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="LIMIT_YEAR" Name="LIMIT_YEAR" 
                        PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="LIMIT_MONTH" Name="LIMIT_MONTH" 
                        PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </InsertItemTemplate>
        <ItemTemplate>
            名前:
            <asp:Label ID="USER_NAMELabel" runat="server" Text='<%# Bind("USER_NAME") %>' />
            <br />
            コース名:
            <asp:Label ID="SEND_GROUP_NAMELabel" runat="server" 
                Text='<%# Bind("SEND_GROUP_NAME") %>' />
            <br />
            期限:
            <asp:Label ID="LIMITLabel" runat="server" Text='<%# Bind("LIMIT") %>' />
            <br />
            メールアドレス:
            <asp:TextBox ID="MAIL_ADDRESSTextBox" runat="server" 
                Text='<%# Bind("MAIL_ADDRESS") %>' />
            <br />
            備考:
            <asp:Label ID="REMARKSLabel" runat="server" Text='<%# Bind("REMARKS") %>' />
            <br />

        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:maildataConnectionString %>" 
        
        
        SelectCommand="SELECT M_USER.USER_CODE, M_USER.USER_NAME, M_USER.SEND_GROUP_CODE, M_SEND_GROUP.SEND_GROUP_NAME, M_USER.LIMIT, CONVERT(VARCHAR,DATEPART(YEAR,LIMIT)) AS LIMIT_YEAR, CONVERT(VARCHAR,DATEPART(MONTH,LIMIT)) AS LIMIT_MONTH, CONVERT(VARCHAR,DATEPART(DAY,LIMIT)) AS LIMIT_DAY, M_USER.MAIL_ADDRESS, M_USER.REMARKS FROM M_USER INNER JOIN M_SEND_GROUP ON M_USER.SEND_GROUP_CODE = M_SEND_GROUP.SEND_GROUP_CODE WHERE (M_USER.USER_CODE = @USER_CODE)" 
        
        UpdateCommand="UPDATE M_USER SET USER_NAME = @USER_NAME, SEND_GROUP_CODE = @SEND_GROUP_CODE, ADMIN_FLG = -1, LIMIT = CONVERT (DateTime, @LIMIT_YEAR + '/' + @LIMIT_MONTH + '/' + @LIMIT_DAY, 111), MAIL_ADDRESS = @MAIL_ADDRESS, REMARKS = @REMARKS WHERE (USER_CODE = @USER_CODE)" 
        
        InsertCommand="INSERT INTO M_USER(USER_NAME, SEND_GROUP_CODE, ADMIN_FLG, LIMIT, MAIL_ADDRESS, REMARKS) VALUES (@USER_NAME, @SEND_GROUP_CODE, -1, CONVERT (DateTime, @LIMIT_YEAR + '/' + @LIMIT_MONTH + '/' + @LIMIT_DAY, 111), @MAIL_ADDRESS, @REMARKS)" 
        DeleteCommand="DELETE FROM M_USER WHERE (USER_CODE = @USER_CODE)">
        <DeleteParameters>
            <asp:Parameter Name="USER_CODE" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="USER_NAME" />
            <asp:Parameter Name="SEND_GROUP_CODE" />
            <asp:Parameter Name="LIMIT_YEAR" />
            <asp:Parameter Name="LIMIT_MONTH" />
            <asp:Parameter Name="LIMIT_DAY" />
            <asp:Parameter Name="MAIL_ADDRESS" />
            <asp:Parameter Name="REMARKS" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="USER_CODE" QueryStringField="USER_CODE" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="USER_NAME" />
            <asp:Parameter Name="SEND_GROUP_CODE" />
            <asp:Parameter Name="LIMIT_YEAR" />
            <asp:Parameter Name="LIMIT_MONTH" />
            <asp:Parameter Name="LIMIT_DAY" />
            <asp:Parameter Name="MAIL_ADDRESS" />
            <asp:Parameter Name="REMARKS" />
            <asp:Parameter Name="USER_CODE" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:maildataConnectionString %>" 
        
        SelectCommand="SELECT SEND_GROUP_CODE, SEND_GROUP_NAME FROM M_SEND_GROUP ORDER BY SEND_GROUP_CODE ">
    </asp:SqlDataSource>
</asp:Content>

