using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASPFinal
{
    public partial class AddRefills : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnClose_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ViewPrescriptions.aspx");
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {

        }
    }
}