<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="addVat.aspx.cs" Inherits="ProjektZaliczeniowy.pages.addVat" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <style type="text/css">
        .auto-style1 {
            width: 220px;
        }
    </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="SqlVat" runat="server" ConnectionString="<%$ ConnectionStrings:sklepConnectionString %>" DeleteCommand="DELETE FROM [Stawki_Vat] WHERE [vat_id] = @vat_id" InsertCommand="INSERT INTO [Stawki_Vat] ([vat_nazwa], [vat_symbol], [vat_stawka]) VALUES (@vat_nazwa, @vat_symbol, @vat_stawka)" SelectCommand="SELECT * FROM [Stawki_Vat]" UpdateCommand="UPDATE [Stawki_Vat] SET [vat_nazwa] = @vat_nazwa, [vat_symbol] = @vat_symbol, [vat_stawka] = @vat_stawka WHERE [vat_id] = @vat_id">
        <DeleteParameters>
            <asp:Parameter Name="vat_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="txtVatName" Name="vat_nazwa" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtVatSymbol" Name="vat_symbol" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtVatValue" Name="vat_stawka" PropertyName="Text" Type="Decimal" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="vat_nazwa" Type="String" />
            <asp:Parameter Name="vat_symbol" Type="String" />
            <asp:Parameter Name="vat_stawka" Type="Decimal" />
            <asp:Parameter Name="vat_id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <table style="width: 660px;">
        <thead>
            <tr>
                <th class="auto-style1">Nazwa stawki VAT</th>
                <th class="auto-style1">Symbol stawki VAT</th>
                <th class="auto-style1">Stawka VAT</th>
            </tr>
        </thead>
        <tr>
            <td>
                <asp:TextBox ID="txtVatName" runat="server" Width="190px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Pole nie może być puste" Text="*" ForeColor="Red" ControlToValidate="txtVatName"></asp:RequiredFieldValidator>
            </td>
            <td>
                <asp:TextBox ID="txtVatSymbol" runat="server" Width="190px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Pole nie może być puste" Text="*" ForeColor="Red" ControlToValidate="txtVatSymbol"></asp:RequiredFieldValidator>
            </td>
            <td>
                <asp:TextBox ID="txtVatValue" runat="server" Width="190px" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Pole nie może być puste" Text="*" ForeColor="Red" ControlToValidate="txtVatValue"></asp:RequiredFieldValidator>
            </td>
        </tr>
    </table>
    <asp:Button ID="btnSave" runat="server" Text="Zapisz stawkę VAT" OnClick="btnSave_Click" />
    <br />
    <asp:Label ID="LblInfo" runat="server" Visible="false" ForeColor="Red"></asp:Label>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
</asp:Content>
