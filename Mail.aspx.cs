using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StudentServices
{
    public partial class Mail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gvInbox_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.DataItem != null)
            {
                Label lblEmailStauts = (Label)e.Row.FindControl("lblEmailStauts");
                int intEmailStauts = Convert.ToInt32(lblEmailStauts.Text);
                if (intEmailStauts == 1)
                {
                    e.Row.Style.Add("font-weight", "bold");
                    e.Row.Style.Add("background", "#fbfbfb");
                }

            }
        }

        protected void lnkNew_Click(object sender, EventArgs e)
        {
            pnlInbox.Visible = false;
            pnlSent.Visible = false;
            pnlNew.Visible = true;
        }

        protected void lnkInbox_Click(object sender, EventArgs e)
        {
            pnlInbox.Visible = true;
            pnlSent.Visible = false;
            pnlNew.Visible = false;
        }

        protected void lnkSent_Command(object sender, CommandEventArgs e)
        {
            pnlInbox.Visible = false;
            pnlSent.Visible = true;
            pnlNew.Visible = false;
        }
    }
}