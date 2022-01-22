using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjektZaliczeniowy.pages
{
    public partial class addPayment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSaveToDB_Click(object sender, EventArgs e)
        {
            try
            {
                SqlAddDelivery.Insert();
                Response.Redirect("addDelivery.aspx");
                LblInfo.Visible = true;
                LblInfo.Text = "Zapis do bazy udany";
                LblInfo.ForeColor = System.Drawing.Color.Green;
            }
            catch (SqlException ex)
            {
                LblInfo.Visible = true;
                LblInfo.ForeColor = System.Drawing.Color.Red;

                switch (ex.Number)
                {
                    case 2601:
                        LblInfo.Text = $"Błąd podczas zapisu do bazy danych powód: klucz {txtDelivery.Text} istnieje w bazie danych";
                        break;
                    default:
                        LblInfo.Text = $"Błąd podczas zapisu do bazy danych powód: {ex.Message}";
                        break;
                }


            }
        }
    }
}