<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="editDepartment.aspx.cs" Inherits="ProjektZaliczeniowy.pages.editDepartment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="SqlDepartment" runat="server" ConnectionString="<%$ ConnectionStrings:sklepConnectionString %>" DeleteCommand="DELETE FROM [Dzial] WHERE [dz_id] = @dz_id" InsertCommand="INSERT INTO [Dzial] ([dz_nazwa]) VALUES (@dz_nazwa)" SelectCommand="SELECT * FROM [Dzial]" UpdateCommand="UPDATE [Dzial] SET [dz_nazwa] = @dz_nazwa WHERE [dz_id] = @dz_id">
        <DeleteParameters>
            <asp:Parameter Name="dz_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="dz_nazwa" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="dz_nazwa" Type="String" />
            <asp:Parameter Name="dz_id" Type="Int32" />
        </UpdateParameters>
</asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="dz_id" DataSourceID="SqlDepartment">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="dz_id" HeaderText="dz_id" InsertVisible="False" ReadOnly="True" SortExpression="dz_id" Visible="False" />
            <asp:BoundField DataField="dz_nazwa" HeaderText="Nazwa działu" SortExpression="dz_nazwa" />
        </Columns>
</asp:GridView>
</asp:Content>
