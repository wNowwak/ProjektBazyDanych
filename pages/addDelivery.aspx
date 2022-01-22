<%@ Page Title="Dodaj sposób dostawy" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="addDelivery.aspx.cs" Inherits="ProjektZaliczeniowy.pages.addDelivery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="SqlAddPayment" runat="server" ConnectionString="<%$ ConnectionStrings:sklepConnectionString %>" DeleteCommand="DELETE FROM [Sposob_dostawy] WHERE [dw_id] = @dw_id" InsertCommand="INSERT INTO [Sposob_dostawy] ([dw_nazwa], [dw_pobranie]) VALUES (@dw_nazwa, @dw_pobranie)" SelectCommand="SELECT * FROM [Sposob_dostawy]" UpdateCommand="UPDATE [Sposob_dostawy] SET [dw_nazwa] = @dw_nazwa, [dw_pobranie] = @dw_pobranie WHERE [dw_id] = @dw_id">
        <DeleteParameters>
            <asp:Parameter Name="dw_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="txtPayment" Name="dw_nazwa" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="chkIsCOD" Name="dw_pobranie" PropertyName="Checked" Type="Boolean" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="dw_nazwa" Type="String" />
            <asp:Parameter Name="dw_pobranie" Type="Boolean" />
            <asp:Parameter Name="dw_id" Type="Int32" />
        </UpdateParameters>
</asp:SqlDataSource>
    <div>
        <asp:label ID="lbl1" Text="Nazwa sposobu dostawy" runat="server"></asp:label>
        <asp:TextBox ID="txtPayment" runat="server"></asp:TextBox>
        <asp:CheckBox ID="chkIsCOD" runat="server" Text="Pobranie" />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Pole sposób dostawy nie może być puste" ForeColor="Red" Text="*" ControlToValidate="txtPayment"></asp:RequiredFieldValidator>
    </div>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
    <asp:Label ID="LblInfo" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Button ID="btnSaveToDB" runat="server" Text="Zapisz sposób dostawy" OnClick="btnSaveToDB_Click" />
</asp:Content>
