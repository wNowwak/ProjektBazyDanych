<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="addJobPosition.aspx.cs" Inherits="ProjektZaliczeniowy.pages.addJobPosition" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="SqlJobPosition" runat="server" ConnectionString="<%$ ConnectionStrings:sklepConnectionString %>" DeleteCommand="DELETE FROM [Stanowisko] WHERE [st_id] = @st_id" InsertCommand="INSERT INTO [Stanowisko] ([st_nazwa]) VALUES (@st_nazwa)" SelectCommand="SELECT * FROM [Stanowisko]" UpdateCommand="UPDATE [Stanowisko] SET [st_nazwa] = @st_nazwa WHERE [st_id] = @st_id">
        <DeleteParameters>
            <asp:Parameter Name="st_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="txtJobPosition" Name="st_nazwa" PropertyName="Text" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="st_nazwa" Type="String" />
            <asp:Parameter Name="st_id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <div>
        <asp:Label ID="lbl1" runat="server" Text="Podaj nazwę stanowiska "></asp:Label>
        <asp:TextBox ID="txtJobPosition" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Pole nazwa stanowiska nie może być puste" Text="*" ForeColor="Red" ControlToValidate="txtJobPosition"></asp:RequiredFieldValidator>
    </div>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
    <asp:Label ID="lblError" runat="server" Visible="false" ForeColor="Red"></asp:Label>
    <p><asp:Button ID="btnSaveJobPosition" runat="server" Text="Zapisz stanowisko" OnClick="btnSaveJobPosition_Click" /></p>
</asp:Content>
