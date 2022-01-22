using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjektZaliczeniowy.pages
{
    public partial class addDepartment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSaveDepartment_Click(object sender, EventArgs e)
        {
            try
            {
                SqlDepartment.Insert();
                Response.Redirect("addDepartment.aspx");
            }
            catch (SqlException ex)
            {
                lblError.Visible = true;
                lblError.ForeColor = System.Drawing.Color.Red;

                switch (ex.Number)
                {
                    case 2601:
                        lblError.Text = $"Błąd podczas zapisu do bazy danych powód: klucz {txtDepartment.Text} istnieje w bazie danych";
                        break;
                    default:
                        lblError.Text = $"Błąd podczas zapisu do bazy danych powód: {ex.Message}";
                        break;
                }


            }
        }
    }
}