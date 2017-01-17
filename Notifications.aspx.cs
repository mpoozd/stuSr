using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StudentServices
{
    public partial class Notifications : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gv_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.DataItem != null)
            {
                Label lblNotificationsStatus = (Label)e.Row.FindControl("lblNotificationsStatus");
                int intNotificationsStatus = Convert.ToInt32(lblNotificationsStatus.Text);
                if (intNotificationsStatus == 1)
                {
                    e.Row.Style.Add("font-weight", "bold");
                    e.Row.Style.Add("background", "#fbfbfb");
                }

            }
        }
    }
}