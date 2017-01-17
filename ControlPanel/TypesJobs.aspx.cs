using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace StudentServices.ControlPanel
{
    public partial class TypesJobs : BasePage
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
                    TransactionDML("INSERT INTO TypesJobs (TypesJobsDescriptionAr, TypesJobsDescriptionEn) VALUES ('" + txtTypesJobsDescriptionAr.Text + "', '" + txtTypesJobsDescriptionEn.Text + "')");
                else
                    TransactionDML("UPDATE TypesJobs SET TypesJobsDescriptionAr = '" + txtTypesJobsDescriptionAr.Text + "', TypesJobsDescriptionEn = '" + txtTypesJobsDescriptionEn.Text + "' WHERE (TypesJobsId = '" + hfKeyValue.Value + "')");

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
        private void Review(int intTypesJobsId)
        {
            DataTable dt = new DataTable();
            dt = GetData("Select * From TypesJobs Where TypesJobsId = " + intTypesJobsId);
            if (dt != null && dt.Rows.Count > 0)
            {
                hfEventStatus.Value = "2";
                hfKeyValue.Value = dt.Rows[0]["TypesJobsId"].ToString();
                txtTypesJobsDescriptionAr.Text = dt.Rows[0]["TypesJobsDescriptionAr"].ToString();
                txtTypesJobsDescriptionEn.Text = dt.Rows[0]["TypesJobsDescriptionEn"].ToString();
            }
        }
        private void Clear()
        {
            txtTypesJobsDescriptionAr.Text = string.Empty;
            txtTypesJobsDescriptionEn.Text = string.Empty;
            hfEventStatus.Value = "1";
            hfKeyValue.Value = "0";
            ContentAlert.InnerText = string.Empty;
        }
        private void Delete(int intTypesJobsId)
        {
            try
            {
                TransactionDML("DELETE FROM TypesJobs WHERE (TypesJobsId = " + intTypesJobsId + ")");
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