<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="addDepartment.aspx.cs" Inherits="ProjektZaliczeniowy.pages.addDepartment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="SqlDepartment" runat="server" ConnectionString="<%$ ConnectionStrings:sklepConnectionString %>" DeleteCommand="DELETE FROM [Dzial] WHERE [dz_id] = @dz_id" InsertCommand="INSERT INTO [Dzial] ([dz_nazwa]) VALUES (@dz_nazwa)" SelectCommand="SELECT * FROM [Dzial]" UpdateCommand="UPDATE [Dzial] SET [dz_nazwa] = @dz_nazwa WHERE [dz_id] = @dz_id">
        <DeleteParameters>
            <asp:Parameter Name="dz_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="txtDepartment" Name="dz_nazwa" PropertyName="Text" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="dz_nazwa" Type="String" />
            <asp:Parameter Name="dz_id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <div>
        <asp:Label ID="lbl1" runat="server" Text="Podaj nazwę działu "></asp:Label>
        <asp:TextBox ID="txtDepartment" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Pole nazwa działu nie może być puste" Text="*" ForeColor="Red" ControlToValidate="txtDepartment"></asp:RequiredFieldValidator>
    </div>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
    <asp:Label ID="lblError" runat="server" Visible="false" ForeColor="Red" />
    <p>    <asp:Button ID="btnSaveDepartment" runat="server" Text="Zapisz dział" OnClick="btnSaveDepartment_Click" />
</p>
    </asp:Content>
