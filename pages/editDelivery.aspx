<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="editDelivery.aspx.cs" Inherits="ProjektZaliczeniowy.pages.editDelivery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="SqlDelivery" runat="server" ConnectionString="<%$ ConnectionStrings:sklepConnectionString %>" SelectCommand="SELECT * FROM [Sposob_dostawy]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Sposob_dostawy] WHERE [dw_id] = @dw_id" InsertCommand="INSERT INTO [Sposob_dostawy] ([dw_nazwa], [dw_pobranie]) VALUES (@dw_nazwa, @dw_pobranie)" UpdateCommand="UPDATE [Sposob_dostawy] SET [dw_nazwa] = @dw_nazwa WHERE [dw_id] = @dw_id">
        <DeleteParameters>
            <asp:Parameter Name="dw_id" Type="Int32" /> 
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="dw_nazwa" Type="String" />
            <asp:Parameter Name="dw_pobranie" Type="Boolean" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="dw_nazwa" Type="String" />
            <asp:Parameter Name="dw_id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" DataKeyNames="dw_id" DataSourceID="SqlDelivery" AutoGenerateColumns="False">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="dw_id" HeaderText="dw_id" InsertVisible="False" ReadOnly="True" SortExpression="dw_id" Visible="False" />
            <asp:BoundField DataField="dw_nazwa" HeaderText="Nazwa" SortExpression="dw_nazwa" />
            <asp:CheckBoxField DataField="dw_pobranie" HeaderText="Pobranie" />
        </Columns>
    </asp:GridView>
    </asp:Content>
