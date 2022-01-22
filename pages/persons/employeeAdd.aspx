
<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="employeeAdd.aspx.cs" Inherits="ProjektZaliczeniowy.pages.persons.employeeAdd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="SqlDane" runat="server" ConnectionString="<%$ ConnectionStrings:sklepConnectionString %>" DeleteCommand="DELETE FROM [DaneKontaktowe] WHERE [dn_id] = @dn_id" InsertCommand="INSERT INTO [DaneKontaktowe] ([dn_imie], [dn_nazwisko], [dn_ulica], [dn_numerDomu], [dn_miasto], [dn_kodPocztowy], [dn_numerTelefonu], [dn_email]) VALUES (@dn_imie, @dn_nazwisko, @dn_ulica, @dn_numerDomu, @dn_miasto, @dn_kodPocztowy, @dn_numerTelefonu, @dn_email)" SelectCommand="SELECT * FROM [DaneKontaktowe]" UpdateCommand="UPDATE [DaneKontaktowe] SET [dn_imie] = @dn_imie, [dn_nazwisko] = @dn_nazwisko, [dn_ulica] = @dn_ulica, [dn_numerDomu] = @dn_numerDomu, [dn_miasto] = @dn_miasto, [dn_kodPocztowy] = @dn_kodPocztowy, [dn_numerTelefonu] = @dn_numerTelefonu, [dn_email] = @dn_email WHERE [dn_id] = @dn_id">
        <DeleteParameters>
            <asp:Parameter Name="dn_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="txtName" Name="dn_imie" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtSurname" Name="dn_nazwisko" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtStreet" Name="dn_ulica" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtNumber" Name="dn_numerDomu" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtCity" Name="dn_miasto" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtPostCode" Name="dn_kodPocztowy" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtPhone" Name="dn_numerTelefonu" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtMail" Name="dn_email" PropertyName="Text" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="dn_imie" Type="String" />
            <asp:Parameter Name="dn_nazwisko" Type="String" />
            <asp:Parameter Name="dn_ulica" Type="String" />
            <asp:Parameter Name="dn_numerDomu" Type="String" />
            <asp:Parameter Name="dn_miasto" Type="String" />
            <asp:Parameter Name="dn_kodPocztowy" Type="String" />
            <asp:Parameter Name="dn_numerTelefonu" Type="String" />
            <asp:Parameter Name="dn_email" Type="String" />
            <asp:Parameter Name="dn_id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlPracownik" runat="server" ConnectionString="<%$ ConnectionStrings:sklepConnectionString %>" DeleteCommand="DELETE FROM [Pracownik] WHERE [pr_id] = @pr_id" InsertCommand="INSERT INTO [Pracownik] ([st_id], [dn_id], [dz_id], [pr_pensja]) VALUES (@st_id,  (SELECT dn_id FROM DaneKontaktowe WHERE dn_numerTelefonu = @numerTelefonu),@dz_id, @pr_pensja)" SelectCommand="SELECT * FROM [Pracownik]" UpdateCommand="UPDATE [Pracownik] SET [st_id] = @st_id, [dn_id] = @dn_id, [dz_id] = @dz_id, [pr_pensja] = @pr_pensja WHERE [pr_id] = @pr_id">
        <DeleteParameters>
            <asp:Parameter Name="pr_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="DDLStanowisko" Name="st_id" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="txtPhone" Name="numerTelefonu" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtMoney" Name="pr_pensja" PropertyName="Text" Type="Decimal" />
            <asp:ControlParameter ControlID="DDLDzial" Name="dz_id" PropertyName="SelectedValue" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="st_id" Type="Int32" />
            <asp:Parameter Name="dn_id" Type="Int32" />
            <asp:Parameter Name="dz_id" Type="Int32" />
            <asp:Parameter Name="pr_pensja" Type="Decimal" />
            <asp:Parameter Name="pr_id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlStanowisko" runat="server" ConnectionString="<%$ ConnectionStrings:sklepConnectionString %>" SelectCommand="SELECT [st_id], [st_nazwa] FROM [Stanowisko] ORDER BY [st_nazwa]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDzial" runat="server" ConnectionString="<%$ ConnectionStrings:sklepConnectionString %>" SelectCommand="SELECT [dz_id], [dz_nazwa] FROM [Dzial] ORDER BY [dz_nazwa]"></asp:SqlDataSource>
    <table style="width: 70%;">
        <thead>
            <tr>
                <td>Imię</td>
                <td>Nazwisko</td>
                <td>Stanowisko</td>
                <td>Dział</td>
                <td>Pensja</td>
            </tr>
        </thead>  
        <tr>
            <td><asp:TextBox ID="txtName" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Pole nie może być puste" ForeColor="Red" Text="*" ControlToValidate="txtName"></asp:RequiredFieldValidator></td>
            <td><asp:TextBox ID="txtSurname" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Pole nie może być puste" ForeColor="Red" Text="*" ControlToValidate="txtSurname"></asp:RequiredFieldValidator></td>
            <td><asp:DropDownList ID="DDLStanowisko" runat="server" DataSourceID="SqlStanowisko" DataValueField="st_id" DataTextField="st_nazwa" OnSelectedIndexChanged="DDLStanowisko_SelectedIndexChanged"></asp:DropDownList></td>
            <td><asp:DropDownList ID="DDLDzial" runat="server" DataSourceID="SqlDzial" DataTextField="dz_nazwa" DataValueField="dz_id" OnSelectedIndexChanged="DDLDzial_SelectedIndexChanged"></asp:DropDownList></td>
            <td><asp:TextBox ID="txtMoney" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Pole nie może być puste" ForeColor="Red" Text="*" ControlToValidate="txtMoney"></asp:RequiredFieldValidator></td>            
        </tr>
        <thead>
            <tr>
                <td>Ulica</td>
                <td>Numer domu</td>
                <td>Miasto</td>
                <td>Kod pocztowy</td>
                <td>Numer telefonu</td>
                <td>E-mail</td>
            </tr>
        </thead>
        <tr>
            <td><asp:TextBox ID="txtStreet" runat="server"></asp:TextBox><asp:RequiredFieldValidator ControlToValidate="txtStreet" ID="RequiredFieldValidator4" runat="server" ErrorMessage="Pole nie może być puste" ForeColor="Red" Text="*"></asp:RequiredFieldValidator></td>
            <td><asp:TextBox ID="txtNumber" runat="server"></asp:TextBox><asp:RequiredFieldValidator ControlToValidate="txtNumber" ID="RequiredFieldValidator5" runat="server" ErrorMessage="Pole nie może być puste" ForeColor="Red" Text="*"></asp:RequiredFieldValidator></td>
            <td><asp:TextBox ID="txtCity" runat="server"></asp:TextBox><asp:RequiredFieldValidator ControlToValidate="txtCity" ID="RequiredFieldValidator6" runat="server" ErrorMessage="Pole nie może być puste" ForeColor="Red" Text="*"></asp:RequiredFieldValidator></td>
            <td><asp:TextBox ID="txtPostCode" runat="server"></asp:TextBox><asp:RequiredFieldValidator ControlToValidate="txtPostCode" ID="RequiredFieldValidator7" runat="server" ErrorMessage="Pole nie może być puste" ForeColor="Red" Text="*"></asp:RequiredFieldValidator></td>
            <td><asp:TextBox ID="txtPhone" runat="server"></asp:TextBox><asp:RequiredFieldValidator ControlToValidate="txtPhone" ID="RequiredFieldValidator8" runat="server" ErrorMessage="Pole nie może być puste" ForeColor="Red" Text="*"></asp:RequiredFieldValidator></td>
            <td><asp:TextBox ID="txtMail" runat="server"></asp:TextBox></td>
        </tr>
    </table>
    
    <asp:Button ID="btnSave" runat="server" Text="Zapisz pracownika" OnClick="btnSave_Click" /><br />
    <asp:Label ID="LblInfo" runat="server" Text="Label" Visible="false"></asp:Label><br />
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
</asp:Content>
