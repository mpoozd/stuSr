using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace StudentServices
{
    public partial class Site : System.Web.UI.MasterPage
    {
        BasePage bp = new BasePage();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ProfileId"] == null)
            {
                pnlRegstration.Visible = true;
                pnlLoging.Visible = false;
            }
            else
            {
                pnlRegstration.Visible = false;
                pnlLoging.Visible = true;
                GetDataLoging();
            }
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = bp.GetData("SELECT ProfileId, ProfileType, ProfileKey, ProfileName, ProfileUsername, ProfilePassword FROM Profiles WHERE (ProfileUsername = '" + txtUsername.Text.Trim() + "') AND (ProfilePassword = '" + txtPassword.Text.Trim() + "')");
                if (dt.Rows.Count > 0)
                {
                    Session["ProfileId"] = dt.Rows[0]["ProfileId"].ToString();
                    Session["ProfileType"] = dt.Rows[0]["ProfileType"].ToString();

                    if (dt.Rows[0]["ProfileType"].ToString() == "2")
                    {
                        DataTable dtStudent = bp.GetData("SELECT StudentName, StudentEmail, StudentImage, StudentId FROM Students WHERE (StudentId = " + dt.Rows[0]["ProfileKey"].ToString() + ")");
                        if (dtStudent.Rows.Count > 0)
                        {
                            Session["StudentId"] = dtStudent.Rows[0]["StudentId"].ToString();
                            Session["StudentName"] = dtStudent.Rows[0]["StudentName"].ToString();
                            Session["StudentEmail"] = dtStudent.Rows[0]["StudentEmail"].ToString();
                            Session["StudentImage"] = dtStudent.Rows[0]["StudentImage"].ToString();
                        }
                    }
                    else
                    {
                        DataTable dtCompany = bp.GetData("SELECT CompanyId, CompanyNameEn, CompanyLogo FROM Companies WHERE CompanyId = " + dt.Rows[0]["ProfileKey"].ToString() + "");
                        if (dtCompany.Rows.Count > 0)
                        {
                            Session["CompanyId"] = dtCompany.Rows[0]["CompanyId"].ToString();
                            Session["CompanyNameEn"] = dtCompany.Rows[0]["CompanyNameEn"].ToString();
                            Session["CompanyLogo"] = dtCompany.Rows[0]["CompanyLogo"].ToString();
                        }
                    }

                    Response.Redirect(Request.RawUrl);
                }
                else
                {
                    ContentAlert.InnerText = "User name or password wrong";
                }
            }
            catch (Exception ex) { }
        }
        protected void GetDataLoging()
        {
            if (Session["ProfileId"] != null && Session["ProfileType"] != null)
            {
                if (Session["ProfileType"].ToString() == "2")
                {
                    ProfileImage.Src = "Upload/" + Session["StudentImage"].ToString();
                    CountNotificatio.InnerText = bp.GetScalar("SELECT COUNT(1) AS NotificationsCount FROM StudentsNotifications WHERE(StudentId = 1) AND (NotificationsStatus = " + Session["StudentId"] + ")");
                    MuneStudent.Visible = true;
                    MuneCompany.Visible = false;
                }
                else
                {
                    ProfileImage.Src = "Upload/" + Session["CompanyLogo"].ToString();
                    IconNotificatio.Visible = false;
                    MuneStudent.Visible = false;
                    MuneCompany.Visible = true;
                }
            }
        }

    }
}