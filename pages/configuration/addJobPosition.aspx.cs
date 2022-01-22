using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjektZaliczeniowy.pages
{
    public partial class addJobPosition : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSaveJobPosition_Click(object sender, EventArgs e)
        {
            try
            {
                SqlJobPosition.Insert();
                Response.Redirect("addJobPosition.aspx");
            }
            catch (SqlException ex)
            {
                lblError.Visible = true;
                lblError.ForeColor = System.Drawing.Color.Red;

                switch (ex.Number)
                {
                    case 2601:
                        lblError.Text = $"Błąd podczas zapisu do bazy danych powód: klucz {txtJobPosition.Text} istnieje w bazie danych";
                        break;
                    default:
                        lblError.Text = $"Błąd podczas zapisu do bazy danych powód: {ex.Message}";
                        break;
                }


            }
        }
    }
}