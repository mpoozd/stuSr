using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.Text.RegularExpressions;

namespace StudentServices.ControlPanel
{
    public partial class Universities : BasePage
    {
        #region Evanet
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            Save();
        }
        protected void btnEdit_Click(object sender, ImageClickEventArgs e)
        {
            Review(Convert.ToInt32(((System.Web.UI.WebControls.ImageButton)(sender)).CommandArgument));
        }
        protected void btnDelete_Click(object sender, ImageClickEventArgs e)
        {
            Delete(Convert.ToInt32(((System.Web.UI.WebControls.ImageButton)(sender)).CommandArgument));
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Clear();
        }

        #endregion

        #region Methods

        private void Save()
        {
            try
            {
                string uploadFolder = Request.PhysicalApplicationPath + "Upload\\";
                string fileName = string.Empty;

                if (hfEventStatus.Value == "1")
                {
                    if (fuLogo.HasFile)
                    {
                        if (fuLogo.PostedFile.ContentType == "image/jpeg" || fuLogo.PostedFile.ContentType == "image/png")
                        {
                            string extension = Path.GetExtension(fuLogo.PostedFile.FileName);
                            fileName = DateTime.Now.ToString();
                            fileName = Regex.Replace(fileName, @"[/: ]", String.Empty).ToString() + extension;
                            fuLogo.SaveAs(uploadFolder + fileName);
                        }
                        else
                        {
                            ContentAlert.InnerHtml = "The Image extension is incorrect <br/> The Extension Correct (jpeg - jpg - png)";
                            return;
                        }
                    }

                    TransactionDML("INSERT INTO Universities (UniversitiesNameAr, UniversitiesNameEn, UniversitiesLogo, UniversitiesWebsite, UniversitiesEmail, CityId) VALUES ('" + txtUniversityNameAr.Text + "', '" + txtUniversityName.Text + "', '" + fileName + "', '" + txtUniversitySite.Text + "', '" + txtUniversityEmail.Text + "', " + ddlCity.SelectedValue + ")");
                }
                else
                {
                    if (fuLogo.HasFile)
                    {
                        if (fuLogo.PostedFile.ContentType == "image/jpeg" || fuLogo.PostedFile.ContentType == "image/png")
                        {
                            string extension = Path.GetExtension(fuLogo.PostedFile.FileName);
                            fileName = DateTime.Now.ToString();
                            fileName = Regex.Replace(fileName, @"[/: ]", String.Empty).ToString() + extension;
                            fuLogo.SaveAs(uploadFolder + fileName);
                        }
                        else
                        {
                            ContentAlert.InnerHtml = "The Image extension is incorrect <br/> The Extension Correct (jpeg - jpg - png)";
                            return;
                        }
                    }
                    else
                        fileName = hfUplaoFile.Value;

                    TransactionDML("UPDATE Universities SET UniversitiesNameAr = '" + txtUniversityNameAr.Text + "', UniversitiesNameEn = '" + txtUniversityName.Text + "' , UniversitiesLogo = '" + fileName + "', UniversitiesWebsite = '" + txtUniversitySite.Text + "', UniversitiesEmail = '" + txtUniversityEmail.Text + "', CityId = " + ddlCity.SelectedValue + " WHERE UniversitiesId = " + hfKeyValue.Value + "");
                }

                Clear();
                gv.DataBind();
                ContentAlert.InnerText = "Successfully";
            }
            catch (Exception ex)
            {
                ContentAlert.InnerText = "There Error : " + ex.Message.ToString();
                return;
            }
        }
        private void Review(int intUniversitiesId)
        {
            DataTable dt = new DataTable();
            dt = GetData("Select * From Universities Where UniversitiesId = " + intUniversitiesId);
            if (dt != null && dt.Rows.Count > 0)
            {
                hfEventStatus.Value = "2";
                hfKeyValue.Value = dt.Rows[0]["UniversitiesId"].ToString();
                txtUniversityNameAr.Text = dt.Rows[0]["UniversitiesNameAr"].ToString();
                txtUniversityName.Text = dt.Rows[0]["UniversitiesNameEn"].ToString();
                hfUplaoFile.Value = dt.Rows[0]["UniversitiesLogo"].ToString();
                txtUniversitySite.Text = dt.Rows[0]["UniversitiesWebsite"].ToString();
                txtUniversityEmail.Text = dt.Rows[0]["UniversitiesEmail"].ToString();
                ddlCity.SelectedValue = dt.Rows[0]["CityId"].ToString();
            }
        }
        private void Clear()
        {
            txtUniversityNameAr.Text = string.Empty;
            txtUniversityName.Text = string.Empty;
            txtUniversitySite.Text = string.Empty;
            txtUniversityEmail.Text = string.Empty;
            ddlCity.SelectedIndex = 0;
            hfEventStatus.Value = "1";
            hfKeyValue.Value = "0";
            ContentAlert.InnerText = string.Empty;
        }
        private void Delete(int intUniversitiesId)
        {
            try
            {
                TransactionDML("DELETE FROM Universities WHERE (UniversitiesId = " + intUniversitiesId + ")");
                ContentAlert.InnerText = "Successfully";
                Clear();
                gv.DataBind();
            }
            catch (Exception ex)
            {
                ContentAlert.InnerText = "There Error : " + ex.Message.ToString();
                return;
            }
        }

        #endregion
    }
}