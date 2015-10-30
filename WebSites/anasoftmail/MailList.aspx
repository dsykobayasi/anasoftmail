<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="MailList.aspx.vb" Inherits="MailList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" 
    ForeColor="Black" Text="メール"></asp:Label>
    <div>
    <asp:HyperLink ID="HyperLink1" runat="server" 
            NavigateUrl="~/Editor.aspx?mode=1">新規作成</asp:HyperLink>
    </div>
    <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" 
        AutoGenerateColumns="False" DataKeyNames="send_group_code" AllowPaging="True">
        <Columns>
            <asp:BoundField DataField="MAIL_CODE" HeaderText="mail_code" 
                ReadOnly="True" SortExpression="mail_code" Visible="False" />
            <asp:BoundField DataField="send_group_code" HeaderText="send_group_code" 
                ReadOnly="True" SortExpression="send_group_code" Visible="False" />
            <asp:HyperLinkField DataNavigateUrlFields="mail_code" 
                DataNavigateUrlFormatString="editor.aspx?mail_code={0}&amp;mode=0" 
                DataTextField="MAIL_SUBJECT" HeaderText="タイトル" Text="選択" />
            <asp:BoundField DataField="Create_Date" HeaderText="作成日時" 
                SortExpression="Create_Date" />
            <asp:BoundField DataField="Send_Schedule_Date" HeaderText="送信予定日時" 
                SortExpression="Send_Schedule_Date" />
            <asp:CheckBoxField DataField="Send_Flg" HeaderText="済み" 
                SortExpression="Send_Flg" />
            <asp:BoundField DataField="Send_Date" HeaderText="送信日時" 
                SortExpression="Send_Date" />
            <asp:HyperLinkField DataNavigateUrlFields="mail_code" 
                DataNavigateUrlFormatString="editor.aspx?Mail_Code={0}&amp;mode=2" 
                Text="編集" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:maildataConnectionString %>" 
        SelectCommand="SELECT [mail_code], [send_group_code], [mail_subject], [create_date], [Send_Schedule_Date], [Send_Flg], [Send_Date] FROM [T_Mail]"></asp:SqlDataSource>
</asp:Content>

