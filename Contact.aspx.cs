using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StudentServices
{
    public partial class Contact : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            try
            {
                lblMsg.InnerText = "There was an error settings";
            }
            catch (Exception ex) { }
        }
    }
}