using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


namespace StudentServices.ControlPanel
{
    public partial class PackageDetails : BasePage
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
                    TransactionDML("INSERT INTO PackageDetails (PackageId, PackageElementsId, PackageDetailsValue, PackageDetailsPrice) VALUES ("+ ddlPackages.SelectedValue +", "+ ddlPackageElements.SelectedValue +", '" + txtPackageDetailsValue.Text + "', '" + txtPackageDetailsPrice.Text + "')");
                else
                    TransactionDML("UPDATE PackageDetails SET  PackageId = " + ddlPackages.SelectedValue + ", PackageElementsId = " + ddlPackageElements.SelectedValue + ", PackageDetailsValue = '" + txtPackageDetailsValue.Text + "', PackageDetailsPrice = '" + txtPackageDetailsPrice.Text + "' WHERE (PackageDetailsId = '" + hfKeyValue.Value + "')");

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
        private void Review(int intPackageDetailsId)
        {
            DataTable dt = new DataTable();
            dt = GetData("Select * From PackageDetails Where PackageDetailsId = " + intPackageDetailsId);
            if (dt != null && dt.Rows.Count > 0)
            {
                hfEventStatus.Value = "2";
                hfKeyValue.Value = dt.Rows[0]["PackageDetailsId"].ToString();
                ddlPackages.SelectedValue = dt.Rows[0]["PackageId"].ToString();
                ddlPackageElements.SelectedValue = dt.Rows[0]["PackageElementsId"].ToString();
                txtPackageDetailsValue.Text = dt.Rows[0]["PackageDetailsValue"].ToString();
                txtPackageDetailsPrice.Text = dt.Rows[0]["PackageDetailsPrice"].ToString();
            }
        }
        private void Clear()
        {
            txtPackageDetailsValue.Text = string.Empty;
            txtPackageDetailsPrice.Text = string.Empty;
            ddlPackages.SelectedValue = "0";
            ddlPackageElements.SelectedValue = "0";
            hfEventStatus.Value = "1";
            hfKeyValue.Value = "0";
            ContentAlert.InnerText = string.Empty;
        }
        private void Delete(int intPackageDetailsId)
        {
            try
            {
                TransactionDML("DELETE FROM PackageDetails WHERE (PackageDetailsId = " + intPackageDetailsId + ")");
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