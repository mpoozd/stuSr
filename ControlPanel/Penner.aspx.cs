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
    public partial class Penner : BasePage
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
                string uploadFolder = Request.PhysicalApplicationPath + "upload\\";
                string filePennerImage = string.Empty;

                if (hfEventStatus.Value == "1")
                {
                    if (ufPennerImage.HasFile)
                    {
                        if (ufPennerImage.PostedFile.ContentType == "image/jpeg" || ufPennerImage.PostedFile.ContentType == "image/png")
                        {
                            string extension = Path.GetExtension(ufPennerImage.PostedFile.FileName);
                            filePennerImage = DateTime.Now.ToString();
                            filePennerImage = Regex.Replace(filePennerImage, @"[/: ]", String.Empty);
                            filePennerImage = filePennerImage + extension;
                            ufPennerImage.SaveAs(uploadFolder + filePennerImage);
                        }
                        else
                        {
                            ContentAlert.InnerText = "The Image extension is incorrect";
                            return;
                        }
                    }
                    else
                    {
                        ContentAlert.InnerText = "Add File Image Penner";
                        return;
                    }

                    TransactionDML("INSERT INTO Penner (PennerTitle, PennerSubTitle, PennerTitleAr, PennerSubTitleAr, PennerImage) VALUES ('" + txtPennerTitle.Text + "', '" + txtPennerSubTitle.Text + "', '" + txtPennerTitleAr.Text + "', '" + txtPennerSubTitleAr.Text + "', '" + filePennerImage + "')");
                }
                else
                {
                    if (ufPennerImage.HasFile)
                    {
                        if (ufPennerImage.PostedFile.ContentType == "image/jpeg" || ufPennerImage.PostedFile.ContentType == "image/png")
                        {
                            string extension = Path.GetExtension(ufPennerImage.PostedFile.FileName);
                            filePennerImage = DateTime.Now.ToString();
                            filePennerImage = Regex.Replace(filePennerImage, @"[/: ]", String.Empty);
                            filePennerImage = filePennerImage + extension;
                            ufPennerImage.SaveAs(uploadFolder + filePennerImage);
                        }
                        else
                        {
                            ContentAlert.InnerText = "The Image extension is incorrect";
                            return;
                        }
                    }
                    else
                        filePennerImage = HFImagPenner.Value;

                    TransactionDML("UPDATE Penner SET PennerTitle = '" + txtPennerTitle.Text + "', PennerSubTitle = '" + txtPennerSubTitle.Text + "', PennerTitleAr = '" + txtPennerTitleAr.Text + "', PennerSubTitleAr = '" + txtPennerSubTitleAr.Text + "', PennerImage = '" + filePennerImage + "'  WHERE (PennerId = '" + hfKeyValue.Value + "')");
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
        private void Review(int intPennerId)
        {
            DataTable dt = new DataTable();
            dt = GetData("Select PennerId, PennerTitle, PennerSubTitle, PennerTitleAr, PennerSubTitleAr, PennerImage From Penner Where PennerId = " + intPennerId);
            if (dt != null && dt.Rows.Count > 0)
            {
                hfEventStatus.Value = "2";
                hfKeyValue.Value = dt.Rows[0]["PennerId"].ToString();
                txtPennerTitle.Text = dt.Rows[0]["PennerTitle"].ToString();
                txtPennerSubTitle.Text = dt.Rows[0]["PennerSubTitle"].ToString();
                txtPennerTitleAr.Text = dt.Rows[0]["PennerTitleAr"].ToString();
                txtPennerSubTitleAr.Text = dt.Rows[0]["PennerSubTitleAr"].ToString();
                HFImagPenner.Value = dt.Rows[0]["PennerImage"].ToString();
            }
        }
        private void Clear()
        {
            txtPennerTitle.Text = string.Empty;
            txtPennerSubTitle.Text = string.Empty;
            txtPennerTitleAr.Text = string.Empty;
            txtPennerSubTitleAr.Text = string.Empty;
            HFImagPenner.Value = string.Empty;

            hfEventStatus.Value = "1";
            hfKeyValue.Value = "0";
            ContentAlert.InnerText = string.Empty;
        }
        private void Delete(int intPennerId)
        {
            try
            {
                TransactionDML("DELETE FROM Penner WHERE (PennerId = " + intPennerId + ")");
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