using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


namespace StudentServices.ControlPanel
{
    public partial class PackageElements : BasePage
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
                    TransactionDML("INSERT INTO PackageElements (PackageElementsTitleAr, PackageElementsTitleEn) VALUES ('" + txtPackageElementAr.Text + "', '" + txtPackageElementEn.Text + "')");
                else
                    TransactionDML("UPDATE PackageElements SET PackageElementsTitleAr = '" + txtPackageElementAr.Text + "', PackageElementsTitleEn = '" + txtPackageElementEn.Text + "' WHERE (PackageElementsId = '" + hfKeyValue.Value + "')");

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
        private void Review(int intPackageElementsId)
        {
            DataTable dt = new DataTable();
            dt = GetData("SELECT PackageElementsId, PackageElementsTitleEn, PackageElementsTitleAr FROM PackageElements WHERE (PackageElementsId = " + intPackageElementsId + ")");
            if (dt != null && dt.Rows.Count > 0)
            {
                hfEventStatus.Value = "2";
                hfKeyValue.Value = dt.Rows[0]["PackageElementsId"].ToString();
                txtPackageElementEn.Text = dt.Rows[0]["PackageElementsTitleEn"].ToString();
                txtPackageElementAr.Text = dt.Rows[0]["PackageElementsTitleAr"].ToString();
            }
        }
        private void Clear()
        {
            txtPackageElementEn.Text = string.Empty;
            txtPackageElementAr.Text = string.Empty;
            hfEventStatus.Value = "1";
            hfKeyValue.Value = "0";
            ContentAlert.InnerText = string.Empty;
        }
        private void Delete(int intPackageElementsId)
        {
            try
            {
                TransactionDML("DELETE FROM PackageElements WHERE (PackageElementsId = " + intPackageElementsId + ")");
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