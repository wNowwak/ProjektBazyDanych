using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjektZaliczeniowy.pages
{
    public partial class addVat : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                txtVatValue.Text = txtVatValue.Text.Replace('.',',');
                if (!decimal.TryParse(txtVatValue.Text, out decimal value))
                    throw new FormatException(); 
                SqlVat.Insert();
                Response.Redirect("addVat.aspx");
            }
            catch (FormatException fe)
            {
                LblInfo.Visible = true;
                LblInfo.ForeColor = System.Drawing.Color.Red;
                LblInfo.Text = $"Niepoprawna forma stawki VAT. Stawką może być tylko liczba.";

            }
            catch (SqlException ex)
            {
                LblInfo.Visible = true;
                LblInfo.ForeColor = System.Drawing.Color.Red;

                switch (ex.Number)
                {
                    case 2601:
                        LblInfo.Text = $"Błąd podczas zapisu do bazy danych powód: klucz {txtVatSymbol.Text} istnieje w bazie danych";
                        break;
                    default:
                        LblInfo.Text = $"Błąd podczas zapisu do bazy danych powód: {ex.Message}";
                        break;
                }
            }
        }
    }
}