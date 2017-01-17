using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


namespace StudentServices.ControlPanel
{
    public partial class Cities : BasePage
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
                    TransactionDML("INSERT INTO Cities (CityNameAr, CityNameEn) VALUES ('" + txtCityNameAr.Text + "', '" + txtCityNameEn.Text + "')");
                else
                    TransactionDML("UPDATE Cities SET CityNameAr = '" + txtCityNameAr.Text + "', CityNameEn = '" + txtCityNameEn.Text + "' WHERE (CityId = '" + hfKeyValue.Value + "')");

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
        private void Review(int intCityId)
        {
            DataTable dt = new DataTable();
            dt = GetData("Select CityId, CityNameAr, CityNameEn From Cities Where CityId = " + intCityId);
            if (dt != null && dt.Rows.Count > 0)
            {
                hfEventStatus.Value = "2";
                hfKeyValue.Value = dt.Rows[0]["CityId"].ToString();
                txtCityNameEn.Text = dt.Rows[0]["CityNameEn"].ToString();
                txtCityNameAr.Text = dt.Rows[0]["CityNameAr"].ToString();
            }
        }
        private void Clear()
        {
            txtCityNameEn.Text = string.Empty;
            txtCityNameAr.Text = string.Empty;
            hfEventStatus.Value = "1";
            hfKeyValue.Value = "0";
            ContentAlert.InnerText = string.Empty;
        }
        private void Delete(int intCityId)
        {
            try
            {
                TransactionDML("DELETE FROM Cities WHERE (CityId = " + intCityId + ")");
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