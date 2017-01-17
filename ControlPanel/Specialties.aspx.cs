using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace StudentServices.ControlPanel
{
    public partial class Specialties : BasePage
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
                    TransactionDML("INSERT INTO Specialties (SpecialtiesNameAr, SpecialtiesNameEn, CollegesId) VALUES ('" + txtSpecialtiesNameAr.Text + "', '" + txtSpecialtiesNameEn.Text + "', " + ddlCollegesId.SelectedValue + ")");
                else
                    TransactionDML("UPDATE Specialties SET SpecialtiesNameAr = '" + txtSpecialtiesNameAr.Text + "', SpecialtiesNameEn = '" + txtSpecialtiesNameEn.Text + "', CollegesId = " + ddlCollegesId.SelectedValue + "  WHERE (SpecialtiesId = '" + hfKeyValue.Value + "')");

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
        private void Review(int intSpecialtiesId)
        {
            DataTable dt = new DataTable();
            dt = GetData("Select * From Specialties Where SpecialtiesId = " + intSpecialtiesId);
            if (dt != null && dt.Rows.Count > 0)
            {
                hfEventStatus.Value = "2";
                hfKeyValue.Value = dt.Rows[0]["SpecialtiesId"].ToString();
                txtSpecialtiesNameEn.Text = dt.Rows[0]["SpecialtiesNameEn"].ToString();
                txtSpecialtiesNameAr.Text = dt.Rows[0]["SpecialtiesNameAr"].ToString();
                ddlUniversity.SelectedValue = GetScalar("Select UniversitiesId From Colleges Where CollegesId = " + dt.Rows[0]["CollegesId"].ToString());
                ddlCollegesId.DataBind();
                ddlCollegesId.SelectedValue = dt.Rows[0]["CollegesId"].ToString();
            }
        }
        private void Clear()
        {
            txtSpecialtiesNameAr.Text = string.Empty;
            txtSpecialtiesNameEn.Text = string.Empty;
            ddlUniversity.SelectedIndex = 0;
            ddlCollegesId.SelectedIndex = 0;
            hfEventStatus.Value = "1";
            hfKeyValue.Value = "0";
            ContentAlert.InnerText = string.Empty;
        }
        private void Delete(int intSpecialtiesId)
        {
            try
            {
                TransactionDML("DELETE FROM Specialties WHERE (SpecialtiesId = " + intSpecialtiesId + ")");
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