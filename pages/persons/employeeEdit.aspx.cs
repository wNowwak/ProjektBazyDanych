using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjektZaliczeniowy.pages.persons
{
    public partial class employeeEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Employee_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            var ddlStanowisko = (DropDownList)Employee.Rows[e.RowIndex].FindControl("DDLStanowisko");
            SqlCustomer.UpdateParameters["st_id"].DefaultValue = ddlStanowisko.SelectedValue;
            var ddlDzial = (DropDownList)Employee.Rows[e.RowIndex].FindControl("DDLDzial");
            SqlCustomer.UpdateParameters["dz_id"].DefaultValue = ddlDzial.SelectedValue;
            Employee.DataBind();
            


        }
    }
}