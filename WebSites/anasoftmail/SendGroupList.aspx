<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="SendGroupList.aspx.vb" Inherits="SendGroupList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" 
    ForeColor="Black" Text="コース名"></asp:Label>
    <div>
    <asp:HyperLink ID="HyperLink1" runat="server" 
            NavigateUrl="~/SendGroupDetail.aspx?mode=1">新規作成</asp:HyperLink>
    </div>
<asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
    AutoGenerateColumns="False" DataKeyNames="send_group_code" 
    DataSourceID="SqlDataSource1">
    <Columns>
        <asp:BoundField DataField="send_group_code" HeaderText="send_group_code" 
            InsertVisible="False" ReadOnly="True" SortExpression="send_group_code" 
            Visible="False" />
        <asp:HyperLinkField DataNavigateUrlFields="send_group_code" 
            DataTextField="SEND_GROUP_NAME" DataNavigateUrlFormatString="SendGroupDetail.aspx?Send_Group_Code={0}&amp;mode=0" 
            Text="名前" />
        <asp:CheckBoxField DataField="Limit_Flg" HeaderText="期限なし" 
            SortExpression="Limit_Flg" />
        <asp:BoundField DataField="Remarks" HeaderText="備考" SortExpression="Remarks" />
        <asp:HyperLinkField DataNavigateUrlFields="send_group_code" 
            DataNavigateUrlFormatString="SendGroupDetail.aspx?Send_Group_Code={0}&amp;mode=2" 
            Text="編集" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:maildataConnectionString %>" 
    DeleteCommand="DELETE FROM [M_Send_Group] WHERE [send_group_code] = ?" 
    InsertCommand="INSERT INTO [M_Send_Group] ([send_group_code], [send_group_name], [Limit_Flg], [Remarks]) VALUES (?, ?, ?, ?)" 
    ProviderName="<%$ ConnectionStrings:maildataConnectionString.ProviderName %>" 
    SelectCommand="SELECT [send_group_code], [send_group_name], [Limit_Flg], [Remarks] FROM [M_Send_Group] ORDER BY [send_group_code]" 
    
        
        UpdateCommand="UPDATE [M_Send_Group] SET [send_group_name] = ?, [Limit_Flg] = ?, [Remarks] = ? WHERE [send_group_code] = ?">
</asp:SqlDataSource>
</asp:Content>

