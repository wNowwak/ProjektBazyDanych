<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="employeeEdit.aspx.cs" Inherits="ProjektZaliczeniowy.pages.persons.employeeEdit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="SqlCustomer" runat="server" ConnectionString="<%$ ConnectionStrings:sklepConnectionString %>" DeleteCommand="DELETE FROM Pracownik WHERE pr_id = @pr_id" SelectCommand="SELECT  dk.dn_imie, dk.dn_nazwisko ,st.st_nazwa ,dz.dz_nazwa ,pr.pr_pensja  , dk.dn_email , dk.dn_numerTelefonu , dk.dn_miasto ,  dk.dn_ulica , dk.dn_numerDomu , dk.dn_kodPocztowy, pr.pr_id, pr.dn_id
FROM            Pracownik pr INNER JOIN
                         DaneKontaktowe dk ON pr.dn_id = dk.dn_id
						 INNER JOIN  Stanowisko st ON
						 st.st_id = pr.st_id
						 INNER JOIN Dzial dz ON
						 dz.dz_id = pr.dz_id" UpdateCommand="UPDATE Pracownik SET pr_pensja = @pr_pensja, st_id=@st_id, dz_id=@dz_id WHERE pr_id = @pr_id UPDATE DaneKontaktowe SET dn_imie = @dn_imie, dn_nazwisko=@dn_nazwisko, 
	dn_ulica = @dn_ulica, dn_numerDomu = @dn_numerDomu, dn_miasto = dn_miasto,
	dn_kodPocztowy = @dn_kodPocztowy, dn_numerTelefonu = @dn_numerTelefonu,
	dn_email = @dn_email WHERE dn_id = (SELECT dn_id FROM Pracownik WHERE pr_id=@pr_id)">
        <DeleteParameters>
            <asp:Parameter Name="pr_id" />
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
            <asp:Parameter Name="pr_pensja" DbType="Decimal"  />
            <asp:Parameter Name ="st_id" />
            <asp:Parameter Name ="dz_id" />
            <asp:Parameter Name="pr_id" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDzial" runat="server" ConnectionString="<%$ ConnectionStrings:sklepConnectionString %>" SelectCommand="SELECT [dz_id], [dz_nazwa] FROM [Dzial] ORDER BY [dz_nazwa]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlStanowisko" runat="server" ConnectionString="<%$ ConnectionStrings:sklepConnectionString %>" SelectCommand="SELECT [st_id], [st_nazwa] FROM [Stanowisko] ORDER BY [st_nazwa]"></asp:SqlDataSource>
    <asp:GridView ID="Employee" runat="server" DataSourceId="SqlCustomer" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="pr_id" Width="80%" OnRowUpdating="Employee_RowUpdating">
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:BoundField DataField="dn_id" HeaderText="dn_id" SortExpression="dn_id" Visible="false"/>
            <asp:BoundField HeaderText="Imię" DataField="dn_imie" SortExpression="dn_imie" />
            <asp:BoundField HeaderText="Nazwisko" DataField="dn_nazwisko" SortExpression="dn_nazwisko" />
            <asp:TemplateField HeaderText ="Stanowisko" SortExpression="st_nazwa">
                <ItemTemplate>
                    <asp:Label ID="lblStanowisko" runat="server" Text='<%#Bind("st_nazwa")%>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="DDLStanowisko" runat="server" DataSourceID="SqlStanowisko" DataTextField="st_nazwa" DataValueField="st_id" ></asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText ="Dział" SortExpression="dz_nazwa">
                <ItemTemplate>
                    <asp:Label ID="lblDzial" runat="server" Text='<%#Bind("dz_nazwa")%>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="DDLDzial" runat="server" DataSourceID="SqlDzial" DataTextField="dz_nazwa" DataValueField="dz_id" ></asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="Pensja" DataField="pr_pensja" SortExpression="pr_pensja" />
            <asp:BoundField HeaderText="E-mail" DataField="dn_email" SortExpression="dn_email" />
            <asp:BoundField HeaderText="Numer telefonu" DataField="dn_numerTelefonu" SortExpression="dn_numerTelefonu" />
            <asp:BoundField HeaderText="Miasto" DataField="dn_miasto" SortExpression="dn_miasto" />
            <asp:BoundField HeaderText="Ulica" DataField="dn_ulica" SortExpression="dn_ulica" />
            <asp:BoundField HeaderText="Numer domu" DataField="dn_numerDomu" SortExpression="dn_numerDomu" />
            <asp:BoundField HeaderText="Kod pocztowy" DataField="dn_kodPocztowy" SortExpression="dn_kodPocztowy" />
            <asp:BoundField DataField="pr_id" HeaderText="pr_id" InsertVisible="False" ReadOnly="True" SortExpression="pr_id" visible="false"/>
        </Columns>
    </asp:GridView>
</asp:Content>
