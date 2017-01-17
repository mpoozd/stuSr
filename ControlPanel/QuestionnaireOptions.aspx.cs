using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace StudentServices.ControlPanel
{
    public partial class QuestionnaireOptions : BasePage
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
                    TransactionDML("INSERT INTO QuestionnaireOptions (QuestionnairesId, QuestionnaireOptionsTitleAr, QuestionnaireOptionsTitleEn) VALUES (" + ddlQuestionnaireOptions.SelectedValue + ", '" + txtQuestionnaireOptionsTitleAr.Text + "', '" + txtQuestionnaireOptionsTitleEn.Text + "')");
                else
                    TransactionDML("UPDATE QuestionnaireOptions SET QuestionnairesId = " + ddlQuestionnaireOptions.SelectedValue + ", QuestionnaireOptionsTitleAr = '" + txtQuestionnaireOptionsTitleAr.Text + "', QuestionnaireOptionsTitleEn = '" + txtQuestionnaireOptionsTitleEn.Text + "'  WHERE (QuestionnaireOptionsId = '" + hfKeyValue.Value + "')");

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
        private void Review(int intQuestionnaireOptionsId)
        {
            DataTable dt = new DataTable();
            dt = GetData("Select * From QuestionnaireOptions Where QuestionnaireOptionsId = " + intQuestionnaireOptionsId);
            if (dt != null && dt.Rows.Count > 0)
            {
                hfEventStatus.Value = "2";
                hfKeyValue.Value = dt.Rows[0]["QuestionnaireOptionsId"].ToString();
                txtQuestionnaireOptionsTitleAr.Text = dt.Rows[0]["QuestionnaireOptionsTitleAr"].ToString();
                txtQuestionnaireOptionsTitleEn.Text = dt.Rows[0]["QuestionnaireOptionsTitleEn"].ToString();
                ddlQuestionnaireOptions.SelectedValue = dt.Rows[0]["QuestionnairesId"].ToString();
            }
        }
        private void Clear()
        {
            txtQuestionnaireOptionsTitleAr.Text = string.Empty;
            txtQuestionnaireOptionsTitleEn.Text = string.Empty;
            ddlQuestionnaireOptions.SelectedIndex = 0;
            hfEventStatus.Value = "1";
            hfKeyValue.Value = "0";
            ContentAlert.InnerText = string.Empty;
        }
        private void Delete(int intQuestionnaireOptionsId)
        {
            try
            {
                TransactionDML("DELETE FROM QuestionnaireOptions WHERE (QuestionnaireOptionsId = " + intQuestionnaireOptionsId + ")");
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