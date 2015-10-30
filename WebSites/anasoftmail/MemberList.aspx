<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="MemberList.aspx.vb" Inherits="MemberList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" 
    ForeColor="Black" Text="会員"></asp:Label>
    <div>
    <asp:HyperLink ID="HyperLink1" runat="server" 
            NavigateUrl="~/MemberDetail.aspx?mode=1">新規作成</asp:HyperLink>
    </div>
    <asp:Label ID="Label2" runat="server" Text="コース検索："></asp:Label>
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
        DataSourceID="SqlDataSource2" DataTextField="SEND_GROUP_NAME" 
        DataValueField="SEND_GROUP_CODE" style="margin-bottom: 0px">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:maildataConnectionString %>" SelectCommand="SELECT -1 AS SEND_GROUP_CODE, 'すべて' AS SEND_GROUP_NAME
UNION ALL
SELECT [SEND_GROUP_CODE], [SEND_GROUP_NAME] FROM [M_SEND_GROUP]">
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" DataKeyNames="user_code" 
        DataSourceID="SqlDataSource1" AllowSorting="True">
        <Columns>
            <asp:BoundField DataField="user_code" HeaderText="user_code" 
                InsertVisible="False" ReadOnly="True" SortExpression="user_code" 
                Visible="False" />
            <asp:HyperLinkField DataNavigateUrlFields="user_code" 
                DataNavigateUrlFormatString="MemberDetail.aspx?User_Code={0}&amp;mode=0" 
                DataTextField="USER_NAME" HeaderText="名前" Text="名前" 
                SortExpression="user_name" />
            <asp:BoundField DataField="mail_Address" HeaderText="Ｅメール" 
                SortExpression="mail_Address" />
            <asp:BoundField DataField="Send_Group_Name" HeaderText="コース名" 
                ReadOnly="True" SortExpression="Send_Group_Name" />
            <asp:BoundField DataField="Limit" HeaderText="期限" SortExpression="Limit" />
            <asp:BoundField DataField="Remarks" HeaderText="備考" SortExpression="Remarks" />
            <asp:HyperLinkField DataNavigateUrlFields="user_code" 
                DataNavigateUrlFormatString="MemberDetail.aspx?User_Code={0}&amp;mode=2" 
                Text="編集" />
            <asp:TemplateField>
                <AlternatingItemTemplate>
                    <asp:HiddenField ID="HiddenField1" runat="server" 
                        Value='<%# Eval("user_code") %>' />
                    <asp:GridView ID="GridView2" runat="server" DataSourceID="SqlDataSource1">
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
                </AlternatingItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:maildataConnectionString %>" 
        
        SelectCommand="SELECT M_USER.USER_CODE, M_USER.USER_NAME, M_USER.MAIL_ADDRESS, M_USER.REMARKS, M_SEND_GROUP.SEND_GROUP_NAME, M_USER.LIMIT FROM M_USER INNER JOIN M_SEND_GROUP ON M_USER.SEND_GROUP_CODE = M_SEND_GROUP.SEND_GROUP_CODE
WHERE @SEND_GROUP_CODE = -1 OR M_USER.SEND_GROUP_CODE = @SEND_GROUP_CODE">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="SEND_GROUP_CODE" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

