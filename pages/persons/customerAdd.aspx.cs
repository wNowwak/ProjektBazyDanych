using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjektZaliczeniowy.pages.persons
{
    public partial class customerAdd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                SqlDane.Insert();
                try
                {
                    SqlKontrahent.Insert();

                }
                catch (SqlException exp)
                {
                    LblInfo.Visible = true;
                    LblInfo.ForeColor = System.Drawing.Color.Red;
                    LblInfo.Text = $"Błąd podczas dodawania pracownika {exp.Message}";
                    SqlDane.Delete();
                }

                Response.Redirect("employeeAdd.aspx");

            }
            catch (SqlException ex)
            {
                LblInfo.Visible = true;
                LblInfo.ForeColor = System.Drawing.Color.Red;
                switch (ex.Number)
                {
                    case 2601:
                        LblInfo.Text = $"Pracownik o numerze telefonu: {txtNumber.Text} istnieje";
                        break;
                    default:
                        LblInfo.Text = $"Błąd podczas dodawania danych kontrahenta: {ex.Message}";
                        break;
                }

            }
        }
    }
}