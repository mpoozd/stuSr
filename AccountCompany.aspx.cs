using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace StudentServices
{
    public partial class AccountCompany : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GatCompanyInfo(1);
            }
        }

        protected void GatCompanyInfo(int intCompanyId)
        {
            DataTable dt = GetData("SELECT * FROM Companies WHERE CompanyId =" + intCompanyId);
            if (dt.Rows.Count > 0)
            {
                txtCompanyAbout.Text = dt.Rows[0]["CompanyAbout"].ToString();
                txtCompanyEmailOfficialCommunication.Text = dt.Rows[0]["CompanyEmailOfficialCommunication"].ToString();
                txtCompanyMobileOfficialCommunication.Text = dt.Rows[0]["CompanyMobileOfficialCommunication"].ToString();
                txtCompanyNameAr.Text = dt.Rows[0]["CompanyNameAr"].ToString();
                txtCompanyNameEn.Text = dt.Rows[0]["CompanyNameEn"].ToString();
                name.InnerText = dt.Rows[0]["CompanyNameEn"].ToString();
                txtCompanyOfficialCommunication.Text = dt.Rows[0]["CompanyOfficialCommunication"].ToString();
                txtCompanyUserName.Text = dt.Rows[0]["CompanyUserName"].ToString();
                txtCompanyWebsit.Text = dt.Rows[0]["CompanyWebsit"].ToString();
                txtSocialMediaFacebook.Text = dt.Rows[0]["SocialMediaFacebook"].ToString();
                txtSocialMediaLinkedin.Text = dt.Rows[0]["SocialMediaLinkedin"].ToString();
                txtSocialMediaTwitter.Text = dt.Rows[0]["SocialMediaTwitter"].ToString();

                CompanyLogo.Src = "Upload/" + dt.Rows[0]["CompanyLogo"].ToString();
            }
        }
    }
}