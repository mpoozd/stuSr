using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace StudentServices.ControlPanel
{
    public partial class Skills : BasePage
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
                if (hfEventStatus.Value == "1")
                    TransactionDML("INSERT INTO Skills (SkillsDescriptionAr, SkillsDescriptionEn) VALUES ('" + txtSkillsDescriptionAr.Text + "', '" + txtSkillsDescriptionEn.Text + "')");
                else
                    TransactionDML("UPDATE Skills SET SkillsDescriptionAr = '" + txtSkillsDescriptionAr.Text + "', SkillsDescriptionEn = '" + txtSkillsDescriptionEn.Text + "' WHERE (SkillsId = '" + hfKeyValue.Value + "')");

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
        private void Review(int intSkillsId)
        {
            DataTable dt = new DataTable();
            dt = GetData("Select * From Skills Where SkillsId = " + intSkillsId);
            if (dt != null && dt.Rows.Count > 0)
            {
                hfEventStatus.Value = "2";
                hfKeyValue.Value = dt.Rows[0]["SkillsId"].ToString();
                txtSkillsDescriptionAr.Text = dt.Rows[0]["SkillsDescriptionAr"].ToString();
                txtSkillsDescriptionEn.Text = dt.Rows[0]["SkillsDescriptionEn"].ToString();
            }
        }
        private void Clear()
        {
            txtSkillsDescriptionAr.Text = string.Empty;
            txtSkillsDescriptionEn.Text = string.Empty;
            hfEventStatus.Value = "1";
            hfKeyValue.Value = "0";
            ContentAlert.InnerText = string.Empty;
        }
        private void Delete(int intSkillsId)
        {
            try
            {
                TransactionDML("DELETE FROM Skills WHERE (SkillsId = " + intSkillsId + ")");
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