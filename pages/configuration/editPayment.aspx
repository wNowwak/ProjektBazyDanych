<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="editPayment.aspx.cs" Inherits="ProjektZaliczeniowy.pages.editPayment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            font-family: "Segoe UI";
            font-size: 12px;
            background-color: #F0F0F0;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <span class="auto-style1">\</span><asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="pl_id" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="pl_id" HeaderText="pl_id" InsertVisible="False" ReadOnly="True" SortExpression="pl_id" Visible="False" />
            <asp:BoundField DataField="pl_nazwa" HeaderText="Nazwa płatności" SortExpression="pl_nazwa" />
            
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString="<%$ ConnectionStrings:sklepConnectionString %>" DeleteCommand="DELETE FROM [Sposob_platnosci] WHERE [pl_id] = @pl_id" InsertCommand="INSERT INTO [Sposob_platnosci] ([pl_nazwa]) VALUES (@pl_nazwa)" SelectCommand="SELECT * FROM [Sposob_platnosci]" UpdateCommand="UPDATE [Sposob_platnosci] SET [pl_nazwa] = @pl_nazwa WHERE [pl_id] = @pl_id">
        <DeleteParameters>
            <asp:Parameter Name="pl_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="pl_nazwa" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="pl_nazwa" Type="String" />
            <asp:Parameter Name="pl_id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>