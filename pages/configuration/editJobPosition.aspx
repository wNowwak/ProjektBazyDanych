<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="editJobPosition.aspx.cs" Inherits="ProjektZaliczeniowy.pages.editJobPosition" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="SqlJobPosition" runat="server" ConnectionString="<%$ ConnectionStrings:sklepConnectionString %>" DeleteCommand="DELETE FROM [Stanowisko] WHERE [st_id] = @st_id" InsertCommand="INSERT INTO [Stanowisko] ([st_nazwa]) VALUES (@st_nazwa)" SelectCommand="SELECT * FROM [Stanowisko]" UpdateCommand="UPDATE [Stanowisko] SET [st_nazwa] = @st_nazwa WHERE [st_id] = @st_id">
        <DeleteParameters>
            <asp:Parameter Name="st_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="st_nazwa" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="st_nazwa" Type="String" />
            <asp:Parameter Name="st_id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="st_id" DataSourceID="SqlJobPosition" AllowPaging="True" AllowSorting="True">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="st_id" HeaderText="st_id" InsertVisible="False" ReadOnly="True" SortExpression="st_id" Visible="false" />
            <asp:BoundField DataField="st_nazwa" HeaderText="Nazwa stanowiska" SortExpression="st_nazwa"  />
        </Columns>
    </asp:GridView>
</asp:Content>
