<%@ Page Title="Dodaj sposób płatności" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="addPayment.aspx.cs" Inherits="ProjektZaliczeniowy.pages.addPayment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="SqlAddDelivery" runat="server" ConnectionString="<%$ ConnectionStrings:sklepConnectionString %>" DeleteCommand="DELETE FROM [Sposob_platnosci] WHERE [pl_id] = @pl_id" InsertCommand="INSERT INTO [Sposob_platnosci] ([pl_nazwa]) VALUES (@pl_nazwa)" SelectCommand="SELECT * FROM [Sposob_platnosci]" UpdateCommand="UPDATE [Sposob_platnosci] SET [pl_nazwa] = @pl_nazwa WHERE [pl_id] = @pl_id">
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
    <div>
        <asp:label ID="lbl1" Text="Nazwa sposobu płatności" runat="server"></asp:label>
        <asp:TextBox ID="txtDelivery" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Pole sposób płatności nie może być puste" ForeColor="Red" Text="*" ControlToValidate="txtDelivery"></asp:RequiredFieldValidator>
    </div>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
    <asp:Label ID="LblInfo" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Button ID="btnSaveToDB" runat="server" Text="Zapisz sposób płatności" OnClick="btnSaveToDB_Click" />
</asp:Content>
