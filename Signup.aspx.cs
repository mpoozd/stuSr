using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.Text.RegularExpressions;

namespace StudentServices
{
    public partial class Signup : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddStudent_Click(object sender, EventArgs e)
        {
            try
            {
                if (int.Parse(GetScalar("Select Count(1) From Profiles Where ProfileUsername = '" + txtStudentEmail.Text.Trim() + "'")) > 0)
                    return;

                TransactionDML("INSERT INTO Students (StudentName, StudentEmail, StudentPassword, StudentMobile) VALUES  ('" + txtStudentName.Text + "', '" + txtStudentEmail.Text + "', '" + txtStudentPassword.Text + "', '" + txtStudentMobile.Text + "')");
                AfterRegistration(txtStudentEmail.Text, txtStudentPassword.Text);
                Response.Redirect("PostResume.aspx");
            }
            catch (Exception ex) { }
        }




        protected void AfterRegistration(string strUsername, string strPassword)
        {
            try
            {
                DataTable dt = GetData("SELECT ProfileId, ProfileType, ProfileKey, ProfileName, ProfileUsername, ProfilePassword FROM Profiles WHERE (ProfileUsername = '" + strUsername.Trim() + "') AND (ProfilePassword = '" + strPassword.Trim() + "')");
                if (dt.Rows.Count > 0)
                {
                    Session["ProfileId"] = dt.Rows[0]["ProfileId"].ToString();
                    Session["ProfileType"] = dt.Rows[0]["ProfileType"].ToString();

                    if (dt.Rows[0]["ProfileType"].ToString() == "2")
                    {
                        DataTable dtStudent = GetData("SELECT StudentName, StudentEmail, StudentImage, StudentId FROM Students WHERE (StudentId = " + dt.Rows[0]["ProfileKey"].ToString() + ")");
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
                        DataTable dtCompany = GetData("SELECT CompanyId, CompanyNameEn, CompanyLogo FROM Companies WHERE CompanyId = " + dt.Rows[0]["ProfileKey"].ToString() + "");
                        if (dtCompany.Rows.Count > 0)
                        {
                            Session["CompanyId"] = dtCompany.Rows[0]["CompanyId"].ToString();
                            Session["CompanyNameEn"] = dtCompany.Rows[0]["CompanyNameEn"].ToString();
                            Session["CompanyLogo"] = dtCompany.Rows[0]["CompanyLogo"].ToString();
                        }
                    }
                }
            }
            catch (Exception ex) { }
        }

        protected void btnAddCompany_Click(object sender, EventArgs e)
        {
            try
            {
                string CompanyLogo = string.Empty;
                string uploadFolder = Request.PhysicalApplicationPath + "Upload\\";

                if (fuCompanyLogo.HasFile)
                {
                    if (fuCompanyLogo.PostedFile.ContentType == "image/jpeg" || fuCompanyLogo.PostedFile.ContentType == "image/png")
                    {
                        string extension = Path.GetExtension(fuCompanyLogo.PostedFile.FileName);
                        CompanyLogo = DateTime.Now.ToString();
                        CompanyLogo = Regex.Replace(CompanyLogo, @"[/: ]", String.Empty);
                        CompanyLogo = CompanyLogo + extension;
                        fuCompanyLogo.SaveAs(uploadFolder + CompanyLogo);
                    }
                }

                if (int.Parse(GetScalar("Select Count(1) From Profiles Where ProfileUsername = '" + txtCompanyUserName.Text.Trim() + "'")) > 0)
                    return;

                TransactionDML("INSERT INTO Companies (CompanyNameAr, CompanyNameEn, CompanyUserName, CompanyPassword, CompanyOfficialCommunication, CompanyEmailOfficialCommunication, CompanyMobileOfficialCommunication, CompanyLogo, CompanyAbout, SocialMediaLinkedin, SocialMediaTwitter, SocialMediaFacebook, CompanyWebsit) VALUES ('" + txtCompanyNameAr.Text + "', '" + txtCompanyNameEn.Text + "', '" + txtCompanyUserName.Text + "', '" + txtCompanyPassword.Text + "', '" + txtCompanyOfficialCommunication.Text + "', '" + txtCompanyEmailOfficialCommunication.Text + "', '" + txtCompanyMobileOfficialCommunication.Text + "', '" + CompanyLogo + "', '" + txtCompanyAbout.Text + "', '" + txtSocialMediaLinkedin.Text + "', '" + txtSocialMediaTwitter.Text + "', '" + txtSocialMediaFacebook.Text + "', '" + txtCompanyWebsit.Text + "')");
                AfterRegistration(txtCompanyUserName.Text, txtCompanyPassword.Text);
                Response.Redirect("Default.aspx");
            }
            catch (Exception ex) { }
        }


    }
}