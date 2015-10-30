<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="SendGroupDetail.aspx.vb" Inherits="SendGroupDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="SEND_GROUP_CODE" 
        DataSourceID="SqlDataSource1" Height="171px" Width="398px">
        <EditItemTemplate>
            名前:
            <asp:TextBox ID="SEND_GROUP_NAMETextBox" runat="server" 
                Text='<%# Bind("SEND_GROUP_NAME") %>' />
            <br />
            期限なし:
            <asp:CheckBox ID="LIMIT_FLGCheckBox" runat="server" 
                Checked='<%# Bind("LIMIT_FLG") %>' />
            <br />
            備考:
            <asp:TextBox ID="REMARKSTextBox" runat="server" Text='<%# Bind("REMARKS") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="更新" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="キャンセル" />
        </EditItemTemplate>
        <InsertItemTemplate>
            名前:
            <asp:TextBox ID="SEND_GROUP_NAMETextBox" runat="server" 
                Text='<%# Bind("SEND_GROUP_NAME") %>' />
            <br />
            期限なし:
            <asp:CheckBox ID="LIMIT_FLGCheckBox" runat="server" 
                Checked='<%# Bind("LIMIT_FLG") %>' />
            <br />
            備考:
            <asp:TextBox ID="REMARKSTextBox" runat="server" Text='<%# Bind("REMARKS") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="挿入" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="キャンセル" />
        </InsertItemTemplate>
        <ItemTemplate>
            名前:
            <asp:Label ID="Send_Group_NameLabel" runat="server" Text='<%# Bind("SEND_GROUP_NAME") %>' />
            <br />
            期限なし:
            <asp:CheckBox ID="Limit_FlgCheck" runat="server" 
                Checked='<%# Bind("LIMIT_FLG") %>' />
            <br />
            備考:
            <asp:Label ID="REMARKSLabel" runat="server" Text='<%# Bind("REMARKS") %>' />
            <br />

        </ItemTemplate>
    </asp:FormView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:maildataConnectionString %>" 
            InsertCommand="INSERT INTO [M_Send_Group] ([SEND_GROUP_NAME], [LIMIT_FLG], [REMARKS]) VALUES (@SEND_GROUP_NAME, @LIMIT_FLG, @REMARKS)" 
            SelectCommand="SELECT [Send_Group_Code], [Send_Group_Name], [Limit_Flg], [Remarks] FROM [M_Send_Group] WHERE ([Send_Group_Code] = @SEND_GROUP_CODE)" 
        
        
        
        
            UpdateCommand="UPDATE [M_Send_Group] SET [Send_Group_Name] = @SEND_GROUP_NAME, [Limit_Flg] = @LIMIT_FLG, [Remarks] = @REMARKS WHERE [Send_Group_Code] = @SEND_GROUP_CODE " 
            >
            <InsertParameters>
                <asp:Parameter Name="SEND_GROUP_NAME" Type="String" />
                <asp:Parameter Name="LIMIT_FLG" Type="Boolean" />
                <asp:Parameter Name="REMARKS" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:QueryStringParameter Name="SEND_GROUP_CODE" QueryStringField="SEND_GROUP_CODE" 
                    Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="SEND_GROUP_NAME" Type="String" />
                <asp:Parameter Name="LIMIT_FLG" Type="Boolean" />
                <asp:Parameter Name="REMARKS" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
</asp:Content>

