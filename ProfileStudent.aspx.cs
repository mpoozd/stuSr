using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace StudentServices
{
    public partial class ProfileStudent : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetStudentInfo(1);
            }
        }

        protected void GetStudentInfo(int intStudentId)
        {
            DataTable dt = new DataTable();
            dt = GetData("SELECT * FROM Students WHERE StudentId = " + intStudentId);
            if (dt.Rows.Count > 0)
            {
                StudentOverview.InnerHtml = dt.Rows[0]["StudentOverview"].ToString();
                StudentName.InnerHtml = dt.Rows[0]["StudentName"].ToString();
            }

            DataTable dtStudentsSkills = GetData("SELECT * FROM V_StudentsSkills WHERE StudentId = " + intStudentId);
            string HtmlStudentsSkills = string.Empty;
            for (int i = 0; i < dtStudentsSkills.Rows.Count; i++)
            {
                HtmlStudentsSkills = HtmlStudentsSkills + "<li><a href='#'><img src='images/cross_white.png' alt=''>" + dtStudentsSkills.Rows[i]["SkillsDescriptionEn"].ToString() + "</a></li>";
            }
            StudentsSkills.InnerHtml = HtmlStudentsSkills;


            DataTable dtStudentsInterests = GetData("SELECT * FROM V_StudentsInterests WHERE StudentId = " + intStudentId);
            string HtmlStudentsInterests = string.Empty;
            for (int i = 0; i < dtStudentsInterests.Rows.Count; i++)
            {
                HtmlStudentsInterests = HtmlStudentsInterests + "<li><a href='#'><img src='images/cross_white.png' alt=''>" + dtStudentsInterests.Rows[i]["InterestsDescriptionEn"].ToString() + "</a></li>";
            }
            StudentsInterests.InnerHtml = HtmlStudentsInterests;
        }
    }
}