<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="AddProductStock.aspx.cs" Inherits="ProjektZaliczeniowy.pages.products.AddProductStock" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="SqlWarehouses" runat="server" ConnectionString="<%$ ConnectionStrings:sklepConnectionString %>" SelectCommand="SELECT CONCAT(mag_symbol,' - ' ,mag_nazwa) AS magazyn,  mag_id FROM Magazyny ORDER BY [mag_symbol]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlProducts" runat="server" ConnectionString="<%$ ConnectionStrings:sklepConnectionString %>" SelectCommand="SELECT CONCAT(tw_symbol,' - ', tw_nazwa) AS produkt, [tw_id] FROM [Produkt] ORDER BY [tw_symbol]"></asp:SqlDataSource>
    Magazyn: <asp:DropDownList ID="DDLWarehouse" runat="server" DataSourceID="SqlWarehouses" DataTextField="magazyn" DataValueField="mag_id"></asp:DropDownList>
    <br />
    Produkt: <asp:DropDownList ID="DDLProduct" runat="server" DataSourceID="SqlProducts" DataTextField="produkt" DataValueField="tw_id"></asp:DropDownList>
    <br />
    Podaj stan porduktu <asp:TextBox ID="txtStock" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Wartość tego pola nie może byc pusta" ForeColor="Red" Text="*" ControlToValidate="txtStock"></asp:RequiredFieldValidator>
    <br /><asp:Button ID="Button1" runat="server" Text="Button" /><asp:Label ID="Label1" runat="server" Text="Label" Visible="false" ForeColor="Red"></asp:Label>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
</asp:Content>


IF EXISTS (SELECT stn_Ilosc FROM stanMagazynowy WHERE tw_id=6 AND mag_id=1)
		UPDATE stanMagazynowy SET stn_Ilosc += 100  
			WHERE tw_id =6 AND mag_id = 1
	ELSE
		INSERT INTO stanMagazynowy (stn_Ilosc,mag_id,tw_id) 
			VALUES (10, 1,6)