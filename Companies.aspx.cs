using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace StudentServices
{
    public partial class Companies : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //GetJobs(string.Empty);
            }
        }

        protected void GetJobs(string Whr)
        {
            //DataTable dt = GetData("SELECT TypesJobsDescriptionEn, CityNameEn, CompanyNameEn, JobTitle, 'Upload/'+CompanyLogo as CompanyLogo, TypesJobsTheme, 'SAR ' +CONVERT(varchar,ExpectedSalary) as Salary, 'JobDetail.aspx?id='+CONVERT(varchar,JobOpportunitiesId) AS URL FROM V_JobOpportunities " + Whr);
            //RepeaterJobs.DataSource = dt;
            //RepeaterJobs.DataBind();
        }
    }
}