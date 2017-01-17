using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace StudentServices.ControlPanel
{
    public partial class Colleges : BasePage
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
                    TransactionDML("INSERT INTO Colleges (UniversitiesId, CollegesNameAr, CollegesNameEn) VALUES (" + ddlUniversity.SelectedValue + ", '" + txtCollegesNameAr.Text + "', '" + txtCollegesNameEn.Text + "')");
                else
                    TransactionDML("UPDATE Colleges SET CollegesNameAr = '" + txtCollegesNameAr.Text + "', CollegesNameEn = '" + txtCollegesNameEn.Text + "' , UniversitiesId = " + ddlUniversity.SelectedValue + " WHERE (CollegesId = '" + hfKeyValue.Value + "')");

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
        private void Review(int intCollegesId)
        {
            DataTable dt = new DataTable();
            dt = GetData("Select * From Colleges Where CollegesId = " + intCollegesId);
            if (dt != null && dt.Rows.Count > 0)
            {
                hfEventStatus.Value = "2";
                hfKeyValue.Value = dt.Rows[0]["CollegesId"].ToString();
                txtCollegesNameEn.Text = dt.Rows[0]["CollegesNameEn"].ToString();
                txtCollegesNameAr.Text = dt.Rows[0]["CollegesNameAr"].ToString();
                ddlUniversity.SelectedValue = dt.Rows[0]["UniversitiesId"].ToString();
            }
        }
        private void Clear()
        {
            txtCollegesNameEn.Text = string.Empty;
            txtCollegesNameAr.Text = string.Empty;
            ddlUniversity.SelectedIndex = 0;
            hfEventStatus.Value = "1";
            hfKeyValue.Value = "0";
            ContentAlert.InnerText = string.Empty;
        }
        private void Delete(int intCollegesId)
        {
            try
            {
                int intResult = TransactionDML("DELETE FROM Colleges WHERE (CollegesId = " + intCollegesId + ")");
                if (intResult == -1)
                {
                    ContentAlert.InnerText = "There is a relationship with another table";
                    return;
                }
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