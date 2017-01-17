﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace StudentServices.ControlPanel
{
    public partial class Questionnaires : BasePage
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
                    TransactionDML("INSERT INTO Questionnaires (QuestionnairesTitleAr, QuestionnairesTitleEn, QuestionnairesStatus) VALUES ('" + txtQuestionnairesTitleAr.Text + "', '" + txtQuestionnairesTitleEn.Text + "', " + ConvertToInt(chkQuestionnairesStatus.Checked) + ")");
                else
                    TransactionDML("UPDATE Questionnaires SET QuestionnairesTitleAr = '" + txtQuestionnairesTitleAr.Text + "', QuestionnairesTitleEn = '" + txtQuestionnairesTitleEn.Text + "', QuestionnairesStatus = " + ConvertToInt(chkQuestionnairesStatus.Checked) + " WHERE (QuestionnairesId = '" + hfKeyValue.Value + "')");

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
        private void Review(int intQuestionnairesId)
        {
            DataTable dt = new DataTable();
            dt = GetData("Select * From Questionnaires Where QuestionnairesId = " + intQuestionnairesId);
            if (dt != null && dt.Rows.Count > 0)
            {
                hfEventStatus.Value = "2";
                hfKeyValue.Value = dt.Rows[0]["QuestionnairesId"].ToString();
                txtQuestionnairesTitleAr.Text = dt.Rows[0]["QuestionnairesTitleAr"].ToString();
                txtQuestionnairesTitleEn.Text = dt.Rows[0]["QuestionnairesTitleEn"].ToString();
                chkQuestionnairesStatus.Checked = ConvertToBoolean(dt.Rows[0]["QuestionnairesStatus"].ToString());
            }
        }
        private void Clear()
        {
            txtQuestionnairesTitleAr.Text = string.Empty;
            txtQuestionnairesTitleEn.Text = string.Empty;
            chkQuestionnairesStatus.Checked = false;
            hfEventStatus.Value = "1";
            hfKeyValue.Value = "0";
            ContentAlert.InnerText = string.Empty;
        }
        private void Delete(int intQuestionnairesId)
        {
            try
            {
                TransactionDML("DELETE FROM Questionnaires WHERE (QuestionnairesId = " + intQuestionnairesId + ")");
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