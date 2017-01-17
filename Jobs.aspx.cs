using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace StudentServices
{
    public partial class Jobs : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["CompanyId"] == null)
                    GetJobs(string.Empty);
                else
                    GetJobs(" Where CompanyId = " + Request.QueryString["CompanyId"].ToString());
            }
        }
        protected void GetJobs(string Whr)
        {
            DataTable dt = GetData("SELECT TypesJobsDescriptionEn, CityNameEn, CompanyNameEn, JobTitle, 'Upload/'+CompanyLogo as CompanyLogo, TypesJobsTheme, 'SAR ' +CONVERT(varchar,ExpectedSalary) as Salary, 'JobDetail.aspx?id='+CONVERT(varchar,JobOpportunitiesId) AS URL FROM V_JobOpportunities " + Whr);
            RepeaterJobs.DataSource = dt;
            RepeaterJobs.DataBind();
            CountRowRuselt.InnerHtml = dt.Rows.Count.ToString();
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string Whr = " Where (1=1)";

            string TypesJobs = string.Empty;

            foreach (ListItem item in cblTypesJobs.Items)
            {
                if (item.Selected)
                {
                    if (TypesJobs == string.Empty)
                        TypesJobs = item.Value;
                    else
                        TypesJobs = TypesJobs + "," + item.Value;
                }
            }

            if (txtContentText.Text.Trim() != string.Empty)
                Whr = Whr + " And (JobTitle Like '% " + txtContentText.Text + " %' Or  JobOpportunitiesDescription Like '% " + txtContentText.Text + " %')";

            if (ddlCites.SelectedValue != "0")
                Whr = Whr + " And (CityId =" + ddlCites.SelectedValue + ")";

            if (ddlGender.SelectedValue != "1")
                Whr = Whr + " And (JobOpportunitiesGender =" + ddlGender.SelectedValue + " Or JobOpportunitiesGender = 1)";

            if (TypesJobs != string.Empty)
                Whr = Whr + " And (TypesJobsId in (" + TypesJobs + "))";

            GetJobs(Whr);
        }
    }
}