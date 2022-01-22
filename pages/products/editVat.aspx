<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="editVat.aspx.cs" Inherits="ProjektZaliczeniowy.pages.products.editVat" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="SqlVat" runat="server" ConnectionString="<%$ ConnectionStrings:sklepConnectionString %>" DeleteCommand="DELETE FROM [Stawki_Vat] WHERE [vat_id] = @vat_id" InsertCommand="INSERT INTO [Stawki_Vat] ([vat_nazwa], [vat_symbol], [vat_stawka]) VALUES (@vat_nazwa, @vat_symbol, @vat_stawka)" SelectCommand="SELECT * FROM [Stawki_Vat]" UpdateCommand="UPDATE [Stawki_Vat] SET [vat_nazwa] = @vat_nazwa, [vat_symbol] = @vat_symbol, [vat_stawka] = @vat_stawka WHERE [vat_id] = @vat_id">
        <DeleteParameters>
            <asp:Parameter Name="vat_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="vat_nazwa" Type="String" />
            <asp:Parameter Name="vat_symbol" Type="String" />
            <asp:Parameter Name="vat_stawka" Type="Decimal" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="vat_nazwa" Type="String" />
            <asp:Parameter Name="vat_symbol" Type="String" />
            <asp:Parameter Name="vat_stawka" Type="Decimal" />
            <asp:Parameter Name="vat_id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:GridView runat="server" AutoGenerateColumns="False" DataKeyNames="vat_id" DataSourceID="SqlVat" AllowPaging="True" AllowSorting="True">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField Visible="False" DataField="vat_id" HeaderText="vat_id" InsertVisible="False" ReadOnly="True" SortExpression="vat_id" />
            <asp:BoundField DataField="vat_nazwa" HeaderText="Nazwa stawki" SortExpression="vat_nazwa" />
            <asp:BoundField DataField="vat_symbol" HeaderText="Symbol stawki" SortExpression="vat_symbol" />
            <asp:BoundField DataField="vat_stawka" HeaderText="Stawka" SortExpression="vat_stawka" />
        </Columns>
    </asp:GridView>
</asp:Content>
