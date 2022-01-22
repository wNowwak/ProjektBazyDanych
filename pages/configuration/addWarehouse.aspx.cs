using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjektZaliczeniowy.pages.configuration
{
    public partial class addWarehouse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            
            try
            {
                SqlWarehouse.Insert();
                try
                {
                    SqlWarehouseAddress.Insert();
                }
                catch (Exception)
                {
                    SqlWarehouse.Delete();
                }

                Response.Redirect("addWarehouse.aspx");
            }
            catch (SqlException ex)
            {
                LblInfo.Visible = true;
                LblInfo.ForeColor = System.Drawing.Color.Red;
                LblInfo.Text = $"Błąd podczas dodawania magzynu {txtMagSymbol.Text} Powód: {ex.Message}";
            }
        }
    }
}