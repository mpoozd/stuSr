using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StudentServices.ControlPanel
{
    public partial class CareerField : BasePage
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
                    TransactionDML("INSERT INTO CareerField (CareerFieldTitleAr, CareerFieldTitleEn) VALUES ('" + txtCareerFieldTitleAr.Text + "', '" + txtCareerFieldTitleEn.Text + "')");
                else
                    TransactionDML("UPDATE CareerField SET CareerFieldTitleAr = '" + txtCareerFieldTitleAr.Text + "', CareerFieldTitleEn = '" + txtCareerFieldTitleEn.Text + "' WHERE (CareerFieldId = '" + hfKeyValue.Value + "')");

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
        private void Review(int intCareerFieldId)
        {
            DataTable dt = new DataTable();
            dt = GetData("Select * From CareerField Where CareerFieldId = " + intCareerFieldId);
            if (dt != null && dt.Rows.Count > 0)
            {
                hfEventStatus.Value = "2";
                hfKeyValue.Value = dt.Rows[0]["CareerFieldId"].ToString();
                txtCareerFieldTitleAr.Text = dt.Rows[0]["CareerFieldTitleAr"].ToString();
                txtCareerFieldTitleEn.Text = dt.Rows[0]["CareerFieldTitleEn"].ToString();
            }
        }
        private void Clear()
        {
            txtCareerFieldTitleAr.Text = string.Empty;
            txtCareerFieldTitleEn.Text = string.Empty;
            hfEventStatus.Value = "1";
            hfKeyValue.Value = "0";
            ContentAlert.InnerText = string.Empty;
        }
        private void Delete(int intCareerFieldId)
        {
            try
            {
                TransactionDML("DELETE FROM CareerField WHERE (CareerFieldId = " + intCareerFieldId + ")");
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