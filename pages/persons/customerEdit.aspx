<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="customerEdit.aspx.cs" Inherits="ProjektZaliczeniowy.pages.persons.customerEdit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="SqlCustomer" runat="server" ConnectionString="<%$ ConnectionStrings:sklepConnectionString %>" DeleteCommand="DELETE FROM Kontrahent WHERE kh_id = @kh_id" SelectCommand="SELECT kh.dn_id, dk.dn_imie, dk.dn_nazwisko, dk.dn_email, dk.dn_numerTelefonu, dk.dn_miasto, dk.dn_ulica, dk.dn_numerDomu, dk.dn_kodPocztowy, kh.kh_id, kh.kh_nip FROM Kontrahent AS kh INNER JOIN DaneKontaktowe AS dk ON kh.dn_id = dk.dn_id" UpdateCommand="UPDATE DaneKontaktowe SET dn_imie = @dn_imie, dn_nazwisko=@dn_nazwisko, 
	dn_ulica = @dn_ulica, dn_numerDomu = @dn_numerDomu, dn_miasto = dn_miasto,
	dn_kodPocztowy = @dn_kodPocztowy, dn_numerTelefonu = @dn_numerTelefonu,
	dn_email = @dn_email WHERE dn_id = @dn_id
UPDATE Kontrahent SET kh_nip = @kh_nip WHERE kh_id = @kh_id">
        <DeleteParameters>
            <asp:Parameter Name="kh_id" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="dn_imie" />
            <asp:Parameter Name="dn_nazwisko" />
            <asp:Parameter Name="dn_ulica" />
            <asp:Parameter Name="dn_numerDomu" />
            <asp:Parameter Name="dn_kodPocztowy" />
            <asp:Parameter Name="dn_numerTelefonu" />
            <asp:Parameter Name="dn_email" />
            <asp:Parameter Name="dn_id" />
            <asp:Parameter Name="kh_nip" />
            <asp:Parameter Name="kh_id" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" DataSourceId="SqlCustomer" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="kh_id">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="dn_id" HeaderText="dn_id" SortExpression="dn_id"  Visible="false"/>
            <asp:BoundField DataField="dn_imie" HeaderText="Imię" SortExpression="dn_imie" />
            <asp:BoundField DataField="dn_nazwisko" HeaderText="Nazwisko" SortExpression="dn_nazwisko" />
            <asp:BoundField DataField="dn_email" HeaderText="Email" SortExpression="dn_email" />
            <asp:BoundField DataField="dn_numerTelefonu" HeaderText="Numer telefonu" SortExpression="dn_numerTelefonu" />
            <asp:BoundField DataField="dn_miasto" HeaderText="Miasto" SortExpression="dn_miasto" />
            <asp:BoundField DataField="dn_ulica" HeaderText="Ulica" SortExpression="dn_ulica" />
            <asp:BoundField DataField="dn_numerDomu" HeaderText="Numer domu" SortExpression="dn_numerDomu" />
            <asp:BoundField DataField="dn_kodPocztowy" HeaderText="Kod pocztowy" SortExpression="dn_kodPocztowy" />
            <asp:BoundField DataField="kh_id" HeaderText="kh_id" SortExpression="kh_id" InsertVisible="False" ReadOnly="True" Visible="false" />
            <asp:BoundField DataField="kh_nip" HeaderText="Nip" SortExpression="kh_nip" />
        </Columns>
    </asp:GridView>
</asp:Content>
