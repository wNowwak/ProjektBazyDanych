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
</asp:Content>
