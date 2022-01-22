<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="product.aspx.cs" Inherits="ProjektZaliczeniowy.pages.products.product" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:SqlDataSource ID="SqlWarehouse" runat="server" ConnectionString="<%$ ConnectionStrings:sklepConnectionString %>" SelectCommand="SELECT [mag_id], [mag_nazwa] FROM [Magazyny] ORDER BY [mag_nazwa]"></asp:SqlDataSource>
    <asp:DropDownList ID="DDLWarehouses" runat="server" DataSourceID="SqlWarehouse" DataTextField="mag_nazwa" DataValueField="mag_id" ></asp:DropDownList>
    
    
    <asp:Button ID="Button1" runat="server" Text="Odśwież" OnClick="Button1_Click" />
    
   <div>

<asp:GridView ID="Products" runat="server" DataSourceID="SqlProduct" AutoGenerateColumns="False" Width ="75%" DataKeyNames="tw_id"  OnRowUpdating="Products_RowUpdating" >
        <Columns>
            <asp:CommandField ShowEditButton="True"  />
            <asp:BoundField DataField="tw_id" HeaderText="tw_id" SortExpression="tw_id" InsertVisible="False" ReadOnly="True" visible="false"/>
            <asp:BoundField DataField="tw_symbol" HeaderText="Symbol" SortExpression="tw_symbol" />
            <asp:BoundField DataField="tw_nazwa" HeaderText="Nazwa produktu" SortExpression="tw_nazwa" />
            <asp:BoundField DataField="tw_opis" HeaderText="Opis" SortExpression="tw_opis"  />
            <asp:BoundField DataField="stn_Ilosc" HeaderText="Ilość" SortExpression="stn_Ilosc" ReadOnly="true" />
            <asp:CheckBoxField DataField="tw_aktywny" HeaderText="Aktywny" SortExpression="tw_aktywny" />
            <asp:BoundField DataField="tw_ean" HeaderText="EAN" SortExpression="tw_ean" />
            <asp:TemplateField HeaderText ="Stawka VAT" SortExpression="vat_stawka"  >
                <EditItemTemplate>
                    <asp:DropDownList ID="DDLVat" runat="server" DataSourceID="SqlVat" DataTextField="vat_stawka" DataValueField="vat_id" ></asp:DropDownList>
                    
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblVat" runat="server" Text='<%#Bind("vat_stawka")%>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlProduct" runat="server" ConnectionString="<%$ ConnectionStrings:sklepConnectionString %>" SelectCommand="SELECT Produkt.tw_id, Produkt.tw_symbol, Produkt.tw_nazwa, Produkt.tw_opis, Stawki_Vat.vat_stawka, stanMagazynowy.stn_Ilosc, Produkt.tw_aktywny, Produkt.tw_ean FROM Produkt INNER JOIN Stawki_Vat ON Produkt.vat_id = Stawki_Vat.vat_id INNER JOIN stanMagazynowy ON Produkt.tw_id = stanMagazynowy.tw_id WHERE (stanMagazynowy.mag_id = @mag_id)" OnSelecting="SqlProduct_Selecting" UpdateCommand="UPDATE Produkt SET tw_symbol = @tw_symbol, tw_nazwa = @tw_nazwa , tw_ean = @tw_ean , tw_aktywny = @tw_aktywny , tw_opis = @tw_opis, vat_id = @vat_id WHERE tw_id = @tw_id">
        <SelectParameters>
            <asp:ControlParameter ControlID="DDLWarehouses" Name="mag_id" PropertyName="SelectedValue" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="tw_symbol" /> 
            <asp:Parameter Name="tw_nazwa" />
            <asp:Parameter Name="tw_ean" />
            <asp:Parameter Name="tw_aktywny" />
            <asp:Parameter Name="tw_opis" />
            <asp:Parameter Name="tw_id" />
            <asp:Parameter Name="vat_id" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlVat" runat="server" ConnectionString="<%$ ConnectionStrings:sklepConnectionString %>" SelectCommand="SELECT [vat_id], [vat_stawka] FROM [Stawki_Vat]"></asp:SqlDataSource>
   </div>
</asp:Content>
