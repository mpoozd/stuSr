using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


namespace StudentServices.ControlPanel
{
    public partial class Packages : BasePage
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
                    TransactionDML("INSERT INTO Packages (PackageTitleAr, PackageTitleEn, PackageStatus, PackageSubTitleAr, PackageSubTitleEn) VALUES ('" + txtPackageTitleAr.Text + "', '" + txtPackageTitleEn.Text + "', " + ConvertToInt(cbPackageStatus.Checked) + ", '" + txtPackageSubTitleAr.Text + "', '" + txtPackageSubTitleEn.Text + "')");
                else
                    TransactionDML("UPDATE Packages SET PackageTitleAr = '" + txtPackageTitleAr.Text + "', PackageTitleEn = '" + txtPackageTitleEn.Text + "' ,PackageStatus = " + ConvertToInt(cbPackageStatus.Checked) + ", PackageSubTitleAr = '" + txtPackageSubTitleAr.Text + "', PackageSubTitleEn = '" + txtPackageSubTitleEn.Text + "'   WHERE (PackageId = '" + hfKeyValue.Value + "')");

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
        private void Review(int intPackageId)
        {
            DataTable dt = new DataTable();
            dt = GetData("Select PackageId, PackageTitleAr, PackageTitleEn, PackageStatus, PackageStatus, PackageSubTitleAr,  PackageSubTitleEn From Packages Where PackageId = " + intPackageId);
            if (dt != null && dt.Rows.Count > 0)
            {
                hfEventStatus.Value = "2";
                hfKeyValue.Value = dt.Rows[0]["PackageId"].ToString();
                txtPackageTitleEn.Text = dt.Rows[0]["PackageTitleEn"].ToString();
                txtPackageTitleAr.Text = dt.Rows[0]["PackageTitleAr"].ToString();

                txtPackageSubTitleAr.Text = dt.Rows[0]["PackageSubTitleEn"].ToString();
                txtPackageSubTitleAr.Text = dt.Rows[0]["PackageSubTitleAr"].ToString();
                cbPackageStatus.Checked = ConvertToBoolean(dt.Rows[0]["PackageStatus"].ToString());
            }
        }
        private void Clear()
        {
            txtPackageTitleEn.Text = string.Empty;
            txtPackageTitleAr.Text = string.Empty;
            hfEventStatus.Value = "1";
            hfKeyValue.Value = "0";
            ContentAlert.InnerText = string.Empty;
        }
        private void Delete(int intPackageId)
        {
            try
            {
                TransactionDML("DELETE FROM Packages WHERE (PackageId = " + intPackageId + ")");
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