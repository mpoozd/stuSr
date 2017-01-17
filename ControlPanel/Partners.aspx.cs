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
    public partial class Partners : BasePage
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

                    TransactionDML("INSERT INTO Partners (PartnerNameAr, PartnerNameEn, PartnerLogo, PartnerWebsite, PartnerEmail, IsShowHomePage) VALUES ('" + txtPartnerNameAr.Text + "', '" + txtPartnerNameEn.Text + "', '" + fileName + "', '" + txtPartnerWebsite.Text + "', '" + txtPartnerEmail.Text + "'," + ConvertToInt(chkIsShowHomePage.Checked) + ")");
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

                    TransactionDML("UPDATE Partners SET PartnerNameAr = '" + txtPartnerNameAr.Text + "', PartnerNameEn = '" + txtPartnerNameEn.Text + "' , PartnerLogo = '" + fileName + "', PartnerWebsite = '" + txtPartnerWebsite.Text + "', PartnerEmail = '" + txtPartnerEmail.Text + "', IsShowHomePage = " + ConvertToInt(chkIsShowHomePage.Checked) + " WHERE PartnerId = " + hfKeyValue.Value + "");
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
        private void Review(int intPartnerId)
        {
            DataTable dt = new DataTable();
            dt = GetData("Select * From Partners Where PartnerId = " + intPartnerId);
            if (dt != null && dt.Rows.Count > 0)
            {
                hfEventStatus.Value = "2";
                hfKeyValue.Value = dt.Rows[0]["PartnerId"].ToString();
                txtPartnerNameAr.Text = dt.Rows[0]["PartnerNameAr"].ToString();
                txtPartnerNameEn.Text = dt.Rows[0]["PartnerNameEn"].ToString();
                hfUplaoFile.Value = dt.Rows[0]["PartnerLogo"].ToString();
                txtPartnerWebsite.Text = dt.Rows[0]["PartnerWebsite"].ToString();
                txtPartnerEmail.Text = dt.Rows[0]["PartnerEmail"].ToString();
                chkIsShowHomePage.Checked = ConvertToBoolean(dt.Rows[0]["IsShowHomePage"].ToString());
            }
        }
        private void Clear()
        {
            txtPartnerNameAr.Text = string.Empty;
            txtPartnerNameEn.Text = string.Empty;
            txtPartnerWebsite.Text = string.Empty;
            txtPartnerEmail.Text = string.Empty;
            chkIsShowHomePage.Checked = false;
            hfEventStatus.Value = "1";
            hfKeyValue.Value = "0";
            ContentAlert.InnerText = string.Empty;
        }
        private void Delete(int intPartnerId)
        {
            try
            {
                TransactionDML("DELETE FROM Partners WHERE (PartnerId = " + intPartnerId + ")");
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