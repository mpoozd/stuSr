using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace StudentServices
{
    public partial class Default : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["typ"] != null)
                {
                    Session.RemoveAll();
                    Session.Clear();
                    Session.Abandon();
                }

                GetPenner();
                GetSiteStats();
                GetVote();
            }
        }
        protected void GetPenner()
        {
            string HtmlPenner = string.Empty;
            DataTable dtGetPenner = new DataTable();
            dtGetPenner = GetData("SELECT PennerId, PennerTitle, PennerSubTitle, 'Upload/'+PennerImage as PennerImage, 'rs-'+CONVERT(varchar,ROW_NUMBER() OVER (ORDER BY PennerId)) as Row_Count FROM Penner");

            for (int i = 0; i < dtGetPenner.Rows.Count; i++)
            {
                HtmlPenner = HtmlPenner + "<li data-index='" + dtGetPenner.Rows[i]["Row_Count"].ToString() + "' data-transition='zoomout' data-slotamount='default' data-easein='Power4.easeInOut' data-easeout='Power4.easeInOut' data-masterspeed='2000' data-thumb='" + dtGetPenner.Rows[i]["PennerImage"].ToString() + "' data-rotate='0' data-fstransition='fade' data-fsmasterspeed='1500' data-fsslotamount='7' data-saveperformance='off' data-title='Intro' data-description=''>" +
                                           "<img src='" + dtGetPenner.Rows[i]["PennerImage"].ToString() + "' alt='' data-bgposition='center center' data-bgfit='cover' data-bgrepeat='no-repeat' data-bgparallax='10' class='rev-slidebg' data-no-retina>" +
                                           "<div class='tp-caption NotGeneric-Title   tp-resizeme rs-parallaxlevel-0' id='slide-16-layer-1.4' data-x='['left','left','left','left']' data-hoffset='['150','150','100','20']' data-y='['top','top','top','top']' data-voffset='['200','200','180','150']' data-fontsize='['130','100','80','60']' data-lineheight='['100','100','80','50']' data-width='none' data-height='none' data-whitespace='nowrap' data-transform_idle='o:1;' data-transform_in='x:[105%];z:0;rX:45deg;rY:0deg;rZ:90deg;sX:1;sY:1;skX:0;skY:0;s:2000;e:Power4.easeInOut;' data-transform_out='y:[100%];s:1000;e:Power2.easeInOut;s:1000;e:Power2.easeInOut;' data-mask_in='x:0px;y:0px;s:inherit;e:inherit;' data-mask_out='x:inherit;y:inherit;s:inherit;e:inherit;' data-start='1000' data-splitin='chars' data-splitout='none' data-responsive_offset='on' data-elementdelay='0.05' style='z-index: 5; white-space: nowrap;'> " + dtGetPenner.Rows[i]["PennerTitle"].ToString() + " </div>" +
                                           "<div class='tp-caption NotGeneric-SubTitle tp-resizeme rs-parallaxlevel-0' id='slide-16-layer-1.5' data-x='[center,center,center,center]' data-hoffset='['0','0','0','0']'  data-y='[middle,middle,middle,middle]' data-voffset='[52,52,52,51]' data-fontsize='[100,80,80,50]' data-lineheight='[100,100,80,50]' data-width='none' data-height='none' data-whitespace='nowrap' data-transform_idle='o:1;' data-transform_in='y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;s:2000;e:Power4.easeInOut;' data-transform_out='y:[100%];s:1000;e:Power2.easeInOut;s:1000;e:Power2.easeInOut;' data-mask_in='x:0px;y:[100%];s:inherit;e:inherit;' data-mask_out='x:inherit;y:inherit;s:inherit;e:inherit;' data-start='1500' data-splitin='none' data-splitout='none' data-responsive_offset='on' style='z-index: 6; white-space: nowrap;'>  " + dtGetPenner.Rows[i]["PennerSubTitle"].ToString() + " </div> " +
                                           "</li>";
            }
            Penner.InnerHtml = HtmlPenner;
        }
        protected void GetSiteStats()
        {
            JobsPostedNumber.InnerHtml = "<span class='timer' data-from='0' data-to='6.389' data-speed='3000' data-decimals='3'></span>";
            CompaniesNumber.InnerHtml = "<span class='timer' data-from='0' data-to='10.981' data-speed='3000' data-decimals='3'></span>";
            ResumesPostedNumber.InnerHtml = "<span class='timer' data-from='0' data-to='2.038' data-speed='3000' data-decimals='3'></span>";
            MembersNumber.InnerHtml = "<span class='timer' data-from='0' data-to='34.657' data-speed='3000' data-decimals='3'></span>";

        }
        protected void GetVote()
        {
            DataTable dt = new DataTable();
            dt = GetData("SELECT Top 1 QuestionnairesId ,QuestionnairesTitleEn FROM Questionnaires WHERE (QuestionnairesStatus = 1) ORDER BY QuestionnairesId DESC");
            if (dt.Rows.Count > 0)
            {
                QuestionnairesTitleEn.InnerHtml = dt.Rows[0]["QuestionnairesTitleEn"].ToString().Substring(0, 1) + "<span> " + dt.Rows[0]["QuestionnairesTitleEn"].ToString().Substring(1, dt.Rows[0]["QuestionnairesTitleEn"].ToString().Length - 1) + " </span>";
                HFQuestionnairesId.Value = dt.Rows[0]["QuestionnairesId"].ToString();
            }
        }
        protected void btnVote_Click(object sender, EventArgs e)
        {
            try
            {
                if (UserId == 0)
                {
                    TransactionDML("INSERT INTO AnswerQuestionnaires(StudentId, QuestionnairesId, QuestionnaireOptionsId, AnswerQuestionnairesIP) VALUES(" + UserId + " ," + HFQuestionnairesId.Value + " ," + rblVote.SelectedValue + " ,'" + GetUserIP() + "')");
                }
            }
            catch (Exception ex) { }
        }
    }
}