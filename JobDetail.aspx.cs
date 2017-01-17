using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace StudentServices
{
    public partial class JobDetail : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["Id"] != null && Request.QueryString["Id"].ToString() != string.Empty)
                    GetJobOpportunities(Convert.ToInt32(Request.QueryString["Id"].ToString()));
                else
                    Response.Redirect("Default.aspx");
            }
        }
        protected void GetJobOpportunities(int intJobOpportunitiesId)
        {
            DataTable dt = new DataTable();
            dt = GetData("Select * From V_JobOpportunities Where JobOpportunitiesId=" + intJobOpportunitiesId);
            if (dt.Rows.Count > 0)
            {
                CompanyLogo.Src = "~/Upload/" + dt.Rows[0]["CompanyLogo"].ToString();
                JobTitle.InnerText = dt.Rows[0]["JobTitle"].ToString();
                CityName.InnerText = dt.Rows[0]["CityNameEn"].ToString();
                linkTypesJobsDescription.Text = dt.Rows[0]["TypesJobsDescriptionEn"].ToString();
                linkTypesJobsDescription.CssClass = dt.Rows[0]["TypesJobsTheme"].ToString();
                CompanyName.InnerText = dt.Rows[0]["CompanyNameEn"].ToString();
                JobTitleDet.InnerText = dt.Rows[0]["JobTitle"].ToString();
                JobOpportunitiesDescription.InnerHtml = dt.Rows[0]["JobOpportunitiesDescription"].ToString();
                JobOpportunitiesRequirements.InnerHtml = dt.Rows[0]["JobOpportunitiesRequirements"].ToString();
                JobOpportunitiesSpecialFeatures.InnerHtml = dt.Rows[0]["JobOpportunitiesSpecialFeatures"].ToString();
                if (dt.Rows[0]["JobOpportunitiesGender"].ToString() != string.Empty)
                {
                    switch (int.Parse(dt.Rows[0]["JobOpportunitiesGender"].ToString()))
                    {
                        case 1:
                            JobOpportunitiesGender.InnerText = "Male - Fmale";
                            break;
                        case 2:
                            JobOpportunitiesGender.InnerText = "Male";
                            break;
                        case 3:
                            JobOpportunitiesGender.InnerText = "Fmale";
                            break;
                        default:
                            JobOpportunitiesGender.InnerText = "Male - Fmale";
                            break;
                    }
                }
                WorkingHours.InnerHtml = dt.Rows[0]["WorkingHours"].ToString();
                ExpectedSalary.InnerText = dt.Rows[0]["ExpectedSalary"].ToString() + "   SAR";
                CompanyAbout.InnerHtml = dt.Rows[0]["CompanyAbout"].ToString();
                CoName.InnerText = dt.Rows[0]["CompanyNameEn"].ToString();
                Website.HRef = dt.Rows[0]["CompanyWebsit"].ToString() == string.Empty ? "#" : dt.Rows[0]["CompanyWebsit"].ToString();
                Twitter.HRef = dt.Rows[0]["SocialMediaTwitter"].ToString() == string.Empty ? "#" : dt.Rows[0]["SocialMediaTwitter"].ToString();
                Facebook.HRef = dt.Rows[0]["SocialMediaFacebook"].ToString() == string.Empty ? "#" : dt.Rows[0]["SocialMediaFacebook"].ToString();

                DataTable dtSkills = new DataTable();
                string HtmlSkills = string.Empty;
                dtSkills = GetData("SELECT Skills.SkillsDescriptionEn FROM Skills INNER JOIN JobOpportunitiesSkills ON Skills.SkillsId = JobOpportunitiesSkills.SkillsId INNER JOIN JobOpportunities ON JobOpportunitiesSkills.JobOpportunitiesId = JobOpportunities.JobOpportunitiesId Where JobOpportunities.JobOpportunitiesId = " + intJobOpportunitiesId);
                for (int i = 0; i < dtSkills.Rows.Count; i++)
                {
                    HtmlSkills = HtmlSkills + "<li>" + dtSkills.Rows[i]["SkillsDescriptionEn"].ToString() + "</li>";
                }
                JobOpportunitiesSkills.InnerHtml = HtmlSkills;

                if (UserId != 0)
                {
                    if (int.Parse(GetScalar("SELECT count(1) FROM StudentJobOpportunities WHERE (StudentId = " + UserId + ") AND (JobOpportunitiesId = " + Request.QueryString["Id"].ToString() + ")")) > 0)
                        linkApplyNow.Visible = false;
                    else
                        linkApplyNow.Visible = true;
                }
            }
            else
                Response.Redirect("Default.aspx");
        }

        protected void linkApplyNow_Click(object sender, EventArgs e)
        {
            if (UserId != 0)
            {
                TransactionDML("INSERT INTO StudentJobOpportunities (StudentId, JobOpportunitiesId) VALUES (" + UserId + ", " + Request.QueryString["Id"].ToString() + ")");
                lblMsg.Text = "The request for the job successfully deliver";
                linkApplyNow.Visible = false;
            }
            else
            {
                lblMsg.Text = "You must login to be able to apply now !";
                linkApplyNow.Visible = false;
            }
        }

    }
}