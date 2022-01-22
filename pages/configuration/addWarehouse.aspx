<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="addWarehouse.aspx.cs" Inherits="ProjektZaliczeniowy.pages.configuration.addWarehouse" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 10%;
        }.auto-style2 {
            width: 20%;
        }.auto-style3 {
            width: 15%;
        }.auto-style4 {
            width: 90%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="SqlWarehouse" runat="server" ConnectionString="<%$ ConnectionStrings:sklepConnectionString %>" DeleteCommand="DELETE FROM [Magazyny] WHERE [mag_id] = @mag_id" InsertCommand="INSERT INTO [Magazyny] ([mag_symbol], [mag_nazwa]) VALUES (@mag_symbol, @mag_nazwa)" SelectCommand="SELECT * FROM [Magazyny]" UpdateCommand="UPDATE [Magazyny] SET [mag_symbol] = @mag_symbol, [mag_nazwa] = @mag_nazwa WHERE [mag_id] = @mag_id">
        <DeleteParameters>
            <asp:Parameter Name="mag_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="txtMagSymbol" Name="mag_symbol" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtMagName" Name="mag_nazwa" PropertyName="Text" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="mag_symbol" Type="String" />
            <asp:Parameter Name="mag_nazwa" Type="String" />
            <asp:Parameter Name="mag_id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlWarehouseAddress" runat="server" ConnectionString="<%$ ConnectionStrings:sklepConnectionString %>" DeleteCommand="DELETE FROM [MagazynAdres] WHERE [mag_id] = @mag_id" InsertCommand="INSERT INTO [MagazynAdres] ([mag_id], [mgA_miasto], [mgA_Ulica], [mgA_Numer], [mgA_kodPocztowy]) VALUES ((SELECT mag_id FROM Magazyny WHERE mag_symbol = @mag_symbol), @mgA_miasto, @mgA_Ulica, @mgA_Numer, @mgA_kodPocztowy)" SelectCommand="SELECT * FROM [MagazynAdres]" UpdateCommand="UPDATE [MagazynAdres] SET [mgA_miasto] = @mgA_miasto, [mgA_Ulica] = @mgA_Ulica, [mgA_Numer] = @mgA_Numer, [mgA_kodPocztowy] = @mgA_kodPocztowy WHERE [mag_id] = @mag_id">
        <DeleteParameters>
            <asp:Parameter Name="mag_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="txtMagCity" Name="mgA_miasto" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtMagStreet" Name="mgA_Ulica" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtMagNumber" Name="mgA_Numer" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtMagPostCode" Name="mgA_kodPocztowy" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtMagSymbol" Name="mag_symbol" PropertyName="Text" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="mgA_miasto" Type="String" />
            <asp:Parameter Name="mgA_Ulica" Type="String" />
            <asp:Parameter Name="mgA_Numer" Type="String" />
            <asp:Parameter Name="mgA_kodPocztowy" Type="String" />
            <asp:Parameter Name="mag_id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <table style="width: 100%;">
        <thead>
            <tr>
                <th class="auto-style1">Symbol magazynu</th>
                <th class="auto-style2">Nazwa magazynu</th>
                <th class="auto-style2">Miasto</th>
                <th class="auto-style2">Ulica</th>
                <th class="auto-style3">Numer</th>
                <th class="auto-style3">Kod pocztowy</th>
            </tr>
        </thead>
        <tr>
            <td>
                <asp:TextBox ID="txtMagSymbol" runat="server" CssClass="auto-style4" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Pole symbol nie może być puste" ForeColor="Red" Text="*" ControlToValidate="txtMagSymbol"></asp:RequiredFieldValidator>
            </td>
            <td>
                <asp:TextBox ID="txtMagName" runat="server" CssClass="auto-style4" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Pole nazwa nie może być puste" ForeColor="Red" Text="*" ControlToValidate="txtMagName"></asp:RequiredFieldValidator>
            </td>
            <td>
                <asp:TextBox ID="txtMagCity" runat="server" CssClass="auto-style4" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Pole miasto nie może być puste" ForeColor="Red" Text="*" ControlToValidate="txtMagCity"></asp:RequiredFieldValidator>
            </td>
            <td>
                <asp:TextBox ID="txtMagStreet" runat="server" CssClass="auto-style4" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Pole ulica nie może być puste" ForeColor="Red" Text="*" ControlToValidate="txtMagStreet"></asp:RequiredFieldValidator>
            </td>
            <td>
                <asp:TextBox ID="txtMagNumber" runat="server" CssClass="auto-style4" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Pole numer nie może być puste" ForeColor="Red" Text="*" ControlToValidate="txtMagNumber"></asp:RequiredFieldValidator>
            </td>
            <td>
                <asp:TextBox ID="txtMagPostCode" runat="server" CssClass="auto-style4" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Pole kodpocztowy nie może być puste" ForeColor="Red" Text="*" ControlToValidate="txtMagPostCode"></asp:RequiredFieldValidator>
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
    <asp:Label ID="LblInfo" runat="server" Visible="false"></asp:Label><br />
    <asp:Button ID="btnSave" runat="server" Text="Zapisz magazyn" OnClick="btnSave_Click" />
</asp:Content>
