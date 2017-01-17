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
    public partial class PostResume : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PageOnLoad();

                if (Session["StudentId"] != null)
                {
                    StudentName.InnerText = Session["StudentName"].ToString();
                    pnlSignIn.Visible = true;
                    pnlSignOut.Visible = false;
                    PanelContent.Enabled = true;
                    GetStudent(int.Parse(Session["StudentId"].ToString()));
                }
                else
                {
                    pnlSignIn.Visible = false;
                    pnlSignOut.Visible = true;
                    PanelContent.Enabled = false;
                }
            }
        }
        protected void PageOnLoad()
        {
            DataTable dtSkills = GetData("Select SkillsDescriptionEn, SkillsId FROM Skills");
            BindListControl(cblSkills, "SkillsDescriptionEn", "SkillsId", dtSkills, null);

            DataTable dtInterests = GetData("Select InterestsDescriptionEn, InterestsId FROM Interests");
            BindListControl(cblInterests, "InterestsDescriptionEn", "InterestsId", dtInterests, null);

            DataTable dtTypesJobs = GetData("Select TypesJobsDescriptionEn, TypesJobsId FROM TypesJobs");
            BindListControl(cblTypesJobs, "TypesJobsDescriptionEn", "TypesJobsId", dtTypesJobs, null);

            DataTable dtWorkPlace = GetData("Select CityNameEn, CityId FROM Cities");
            BindListControl(cblWorkPlace, "CityNameEn", "CityId", dtWorkPlace, null);
        }
        protected void GetStudent(int intStudentId)
        {
            DataTable dtSkills = GetData("Select SkillsDescriptionEn, SkillsId FROM Skills");
            BindListControl(cblSkills, "SkillsDescriptionEn", "SkillsId", dtSkills, null);


            DataTable list = new DataTable();
            list = GetData("SELECT * FROM Students WHERE StudentId =" + intStudentId);
            if (list.Rows.Count > 0)
            {
                //ddlStudentGender.SelectedValue = list.Rows[0]["StudentGender"].ToString();
                txtStudentName.Text = list.Rows[0]["StudentName"].ToString();
                //ddlStudentNationlaty.SelectedValue = list.Rows[0]["NationlatyId"].ToString();
                //ddlUniversity.SelectedValue = list.Rows[0]["UniversitiesId"].ToString();
                //ddlCollege.SelectedValue = list.Rows[0]["CollegesId"].ToString();
                //ddlSpecialty.SelectedValue = list.Rows[0]["SpecialtiesId"].ToString();
                txtGraduationYear.Text = list.Rows[0]["GraduationYear"].ToString();
                //ddlCity.SelectedValue = list.Rows[0]["CityId"].ToString();
                txtStudentAddress.Text = list.Rows[0]["StudentAddress"].ToString();
                //fuUniversityCardFacility.Text = list.Rows[0]["UniversityCardFacility"].ToString();
                txtStudentMobile.Text = list.Rows[0]["StudentMobile"].ToString();
                txtUniversityEmail.Text = list.Rows[0]["UniversityEmail"].ToString();
                txtStudentSocialMedia1.Text = list.Rows[0]["StudentSocialMedia1"].ToString();
                txtStudentSocialMedia2.Text = list.Rows[0]["StudentSocialMedia2"].ToString();
                txtStudentSocialMedia3.Text = list.Rows[0]["StudentSocialMedia3"].ToString();
            }
            GetStudentsExperiences(intStudentId);
            GetStudentAttachments(intStudentId);


            foreach (ListItem item in cblSkills.Items)
            {
                if (int.Parse(GetScalar("Select Count(1) From StudentsSkills Where StudentId = " + Session["StudentId"].ToString() + " And SkillsId = " + item.Value + "")) > 0)
                    item.Selected = true;
            }

            foreach (ListItem item in cblInterests.Items)
            {
                if (int.Parse(GetScalar("Select Count(1) From StudentsInterests Where StudentId = " + Session["StudentId"].ToString() + " And InterestsId = " + item.Value + "")) > 0)
                    item.Selected = true;
            }

            foreach (ListItem item in cblWorkPlace.Items)
            {
                if (int.Parse(GetScalar("Select Count(1) From StudntsWorkCity Where StudentId = " + Session["StudentId"].ToString() + " And CityId = " + item.Value + "")) > 0)
                    item.Selected = true;
            }

            foreach (ListItem item in cblTypesJobs.Items)
            {
                if (int.Parse(GetScalar("Select Count(1) From StudentTypesJobs Where StudentId = " + Session["StudentId"].ToString() + " And TypesJobsId = " + item.Value + "")) > 0)
                    item.Selected = true;
            }


        }
        protected void GetStudentsExperiences(int intStudentId)
        {
            DataTable listStudentsExperiences = GetData("SELECT StudentId, StudentExperiencesId, StudentExperiencesType,convert(date,StudentExperiencesStartDate) StudentExperiencesStartDate, StudentExperiencesEndDate, StudentExperiencesTitle, StudentExperiencesJob, StudentExperiencesTasks, CompanyName FROM StudentsExperiences WHERE (StudentId = " + intStudentId + ")");
            gvExp.DataSource = listStudentsExperiences;
            gvExp.DataBind();
        }
        protected void GetStudentAttachments(int intStudentId)
        {
            DataTable listStudentsExperiences = GetData("SELECT * FROM StudentAttachments WHERE (StudentId = " + intStudentId + ")");
            gvAttachment.DataSource = listStudentsExperiences;
            gvAttachment.DataBind();
        }
        protected void btnAddExperience_Click(object sender, EventArgs e)
        {
            try
            {
                string SqlInsert = "INSERT INTO StudentsExperiences(StudentId, StudentExperiencesType, StudentExperiencesStartDate, StudentExperiencesEndDate, StudentExperiencesTitle, StudentExperiencesTasks, CompanyName)" +
                                   "VALUES (" + Session["StudentId"].ToString() + " ," + ddlStudentExperiencesType.SelectedValue + ", '" + DateTime.Now + "', '" + DateTime.Now + "', '" + txtStudentExperiencesTitle.Text + "' ,'" + txtStudentExperiencesTasks.Text + "' ,'" + txtCompanyName.Text + "')";
                TransactionDML(SqlInsert);
                GetStudentsExperiences(int.Parse(Session["StudentId"].ToString()));

                txtStudentExperiencesTitle.Text = string.Empty;
                txtStudentExperiencesTasks.Text = string.Empty;
                txtCompanyName.Text = string.Empty;
            }
            catch (Exception ex) { }
        }
        protected void btnDeleteExp_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                int intStudentExperiencesId = Convert.ToInt32(((System.Web.UI.WebControls.ImageButton)(sender)).CommandArgument);
                TransactionDML("DELETE FROM StudentsExperiences WHERE StudentExperiencesId = " + intStudentExperiencesId);
                GetStudentsExperiences(int.Parse(Session["StudentId"].ToString()));
            }
            catch (Exception ex) { }


        }
        protected void btnUplod_Click(object sender, EventArgs e)
        {
            try
            {
                string uploadFolder = Request.PhysicalApplicationPath + "Upload\\";
                string strStudentAttachmentsFile = string.Empty;

                if (fuStudentAttachmentsFile.HasFile)
                {
                    string extension = Path.GetExtension(fuStudentAttachmentsFile.PostedFile.FileName);
                    strStudentAttachmentsFile = DateTime.Now.ToString();
                    strStudentAttachmentsFile = Regex.Replace(strStudentAttachmentsFile, @"[/: ]", String.Empty).ToString() + extension;
                    fuStudentAttachmentsFile.SaveAs(uploadFolder + strStudentAttachmentsFile);
                }
                else
                {
                    return;
                }

                TransactionDML("INSERT INTO StudentAttachments(StudentId, StudentAttachmentsDesc, StudentAttachmentsFile) VALUES (" + Session["StudentId"].ToString() + ", '" + txtStudentAttachmentsDesc.Text + "', '" + strStudentAttachmentsFile + "')");
                txtStudentAttachmentsDesc.Text = string.Empty;
                GetStudentAttachments(int.Parse(Session["StudentId"].ToString()));
            }
            catch (Exception ex) { }
        }
        protected void btnDeleteAttachment_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                int intStudentAttachmentsId = Convert.ToInt32(((System.Web.UI.WebControls.ImageButton)(sender)).CommandArgument);
                TransactionDML("DELETE FROM StudentAttachments WHERE StudentAttachmentsId = " + intStudentAttachmentsId);
                GetStudentAttachments(int.Parse(Session["StudentId"].ToString()));
            }
            catch (Exception ex) { }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                string uploadFolder = Request.PhysicalApplicationPath + "upload\\";
                string UniversityCardFacility = string.Empty;
                string StudentImage = string.Empty;


                if (fuUniversityCardFacility.HasFile)
                {
                    if (fuUniversityCardFacility.PostedFile.ContentType == "image/jpeg" || fuUniversityCardFacility.PostedFile.ContentType == "image/png")
                    {
                        string extension = Path.GetExtension(fuUniversityCardFacility.PostedFile.FileName);
                        UniversityCardFacility = DateTime.Now.ToString();
                        UniversityCardFacility = Regex.Replace(UniversityCardFacility, @"[/: ]", String.Empty);
                        UniversityCardFacility = UniversityCardFacility + extension;
                        fuUniversityCardFacility.SaveAs(uploadFolder + UniversityCardFacility);
                    }
                }

                if (fuStudentImage.HasFile)
                {
                    if (fuStudentImage.PostedFile.ContentType == "image/jpeg" || fuStudentImage.PostedFile.ContentType == "image/png")
                    {
                        string extension = Path.GetExtension(fuStudentImage.PostedFile.FileName);
                        StudentImage = DateTime.Now.ToString();
                        StudentImage = Regex.Replace(StudentImage, @"[/: ]", String.Empty);
                        StudentImage = StudentImage + extension;
                        fuStudentImage.SaveAs(uploadFolder + StudentImage);
                    }
                }


                string strStatementUpdate = string.Empty;
                strStatementUpdate = "UPDATE  Students " +
                                     "SET     StudentName = '" + txtStudentName.Text + "', " +
                                             "StudentEmail = '" + txtStudentEmail.Text + "', " +
                                             "StudentAddress = '" + txtStudentAddress.Text + "', " +
                                             "StudentGender = " + ddlStudentGender.SelectedValue + ", " +
                                             "StudentMobile = '" + txtStudentMobile.Text + "', " +
                                             "StudentSocialMedia1 = '" + txtStudentSocialMedia1.Text + "', " +
                                             "StudentSocialMedia2 = '" + txtStudentSocialMedia2.Text + "', " +
                                             "StudentSocialMedia3 = '" + txtStudentSocialMedia3 + "', " +
                                             "UniversitiesId = " + ddlUniversity.SelectedValue == "0" ? "NULL" : ddlUniversity.SelectedValue + ", " +
                                             "CollegesId = " + ddlCollege.SelectedValue == "0" ? "NULL" : ddlCollege.SelectedValue + ", " +
                                             "SpecialtiesId = " + ddlSpecialty.SelectedValue == "0" ? "NULL" : ddlSpecialty.SelectedValue + "," +
                                             "UniversityID = '" + txtUniversityID.Text + "'," +
                                             "UniversityEmail = '" + txtUniversityEmail.Text + "', " +
                                             "UniversityCardFacility = '" + UniversityCardFacility + "', " +
                                             "WorkEnvironmentWomen = " + ddlWorkEnvironment.SelectedValue == "0" ? "NULL" : ddlWorkEnvironment.SelectedValue + ", " +
                                             "SpecialNeedsDescription = '" + txtSpecialNeedsDescription.Text + "', " +
                                             "StudentNationlaty = " + ddlStudentNationlaty.SelectedValue == "0" ? "NULL" : ddlStudentNationlaty.SelectedValue + ", " +
                                             "GraduationYear = " + txtGraduationYear.Text + ", " +
                                             "CityId = " + ddlCity.SelectedValue == "0" ? "NULL" : ddlCity.SelectedValue + ", " +
                                             "StudentImage = '1' " +
                                     "WHERE (StudentId = 11111)";
                TransactionDML(strStatementUpdate);

                GetStudent(int.Parse(Session["StudentId"].ToString()));

            }
            catch (Exception ex) { }
        }

    }
}