using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjektZaliczeniowy.pages.products
{
    public partial class product : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected void SqlProduct_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            try
            {
                SqlProduct.Select(DataSourceSelectArguments.Empty);
            }
            catch (Exception)
            {

                throw;
            }
        }

       

      

        protected void Products_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            var ddlVat =(DropDownList) Products.Rows[e.RowIndex].FindControl("DDLVat");
            SqlProduct.UpdateParameters["vat_id"].DefaultValue = ddlVat.SelectedValue;
        }

        
    }
}