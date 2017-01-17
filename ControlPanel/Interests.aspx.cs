using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace StudentServices.ControlPanel
{
    public partial class Interests : BasePage
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
                    TransactionDML("INSERT INTO Interests (InterestsDescriptionAr, InterestsDescriptionEn) VALUES ('" + txtInterestsDescriptionAr.Text + "', '" + txtInterestsDescriptionEn.Text + "')");
                else
                    TransactionDML("UPDATE Interests SET InterestsDescriptionAr = '" + txtInterestsDescriptionAr.Text + "', InterestsDescriptionEn = '" + txtInterestsDescriptionEn.Text + "' WHERE (InterestsId = '" + hfKeyValue.Value + "')");

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
            dt = GetData("Select * From Interests Where InterestsId = " + intSkillsId);
            if (dt != null && dt.Rows.Count > 0)
            {
                hfEventStatus.Value = "2";
                hfKeyValue.Value = dt.Rows[0]["InterestsId"].ToString();
                txtInterestsDescriptionAr.Text = dt.Rows[0]["InterestsDescriptionAr"].ToString();
                txtInterestsDescriptionEn.Text = dt.Rows[0]["InterestsDescriptionEn"].ToString();
            }
        }
        private void Clear()
        {
            txtInterestsDescriptionAr.Text = string.Empty;
            txtInterestsDescriptionEn.Text = string.Empty;
            hfEventStatus.Value = "1";
            hfKeyValue.Value = "0";
            ContentAlert.InnerText = string.Empty;
        }
        private void Delete(int intInterestsId)
        {
            try
            {
                TransactionDML("DELETE FROM Interests WHERE (InterestsId = " + intInterestsId + ")");
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