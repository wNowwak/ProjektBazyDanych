<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="editWarehouse.aspx.cs" Inherits="ProjektZaliczeniowy.pages.configuration.editWarehouse" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="SqlWarehouse" runat="server" ConnectionString="<%$ ConnectionStrings:sklepConnectionString %>" SelectCommand="SELECT Magazyny.mag_id, Magazyny.mag_symbol, Magazyny.mag_nazwa, MagazynAdres.mgA_miasto, MagazynAdres.mgA_Ulica, MagazynAdres.mgA_Numer, MagazynAdres.mgA_kodPocztowy FROM Magazyny INNER JOIN MagazynAdres ON Magazyny.mag_id = MagazynAdres.mag_id" UpdateCommand="UPDATE       MagazynAdres
SET                mgA_miasto = @mgA_miasto, mgA_Ulica = @mgA_Ulica, mgA_Numer = @mgA_Numer, mgA_kodPocztowy = @mgA_kodPocztowy WHERE mag_id = @mag_id
UPDATE Magazyny 
SET mag_symbol = @mag_symbol , mag_nazwa = @mag_nazwa WHERE mag_id = @mag_id
" DeleteCommand="DELETE FROM MagazynAdres WHERE mag_id = @mag_id
DELETE FROM Magazyny WHERE mag_id = @mag_id">
        <DeleteParameters>
            <asp:Parameter Name="mag_id" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="mgA_miasto" />
            <asp:Parameter Name="mgA_Ulica" />
            <asp:Parameter Name="mgA_Numer" />
            <asp:Parameter Name="mgA_kodPocztowy" />
            <asp:Parameter Name="mag_id" />
            <asp:Parameter Name="mag_symbol" />
            <asp:Parameter Name="mag_nazwa" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlWarehouse" AutoGenerateColumns="False" DataKeyNames="mag_id" Width ="75%">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="mag_id" HeaderText="mag_id" InsertVisible="False" ReadOnly="True" SortExpression="mag_id" Visible="false"/>
            <asp:BoundField DataField="mag_symbol" HeaderText="Symbol" SortExpression="mag_symbol" />
            <asp:BoundField DataField="mag_nazwa" HeaderText="Nazwa magazynu" SortExpression="mag_nazwa" />
            <asp:BoundField DataField="mgA_miasto" HeaderText="Miasto" SortExpression="mgA_miasto" />
            <asp:BoundField DataField="mgA_Ulica" HeaderText="Ulica" SortExpression="mgA_Ulica" />
            <asp:BoundField DataField="mgA_Numer" HeaderText="Numer" SortExpression="mgA_Numer" />
            <asp:BoundField DataField="mgA_kodPocztowy" HeaderText="Kod pocztowy" SortExpression="mgA_kodPocztowy" />
        </Columns>
    </asp:GridView>
</asp:Content>
