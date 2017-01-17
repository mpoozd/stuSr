using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace StudentServices
{
    public partial class Checkout : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(! IsPostBack)
            {
                if (Request.QueryString["Id"] != null && Request.QueryString["Id"].ToString() != string.Empty)
                {
                    GetInfoPurchaser(Request.QueryString["Id"].ToString());
                }
               
            }
        }

        protected void GetInfoPurchaser(string strId)
        {
            int intCompanyId = 2;
            DataTable ListInfoPurchasers = GetData("SELECT Top 1 * FROM CompaniesCreditCard WHERE (CompanyId = " + intCompanyId + ") ORDER BY CreditCardSer DESC");
            if (ListInfoPurchasers.Rows.Count > 0)
            {
                txtFristName.Text = ListInfoPurchasers.Rows[0]["FristName"].ToString();
                txtLastName.Text = ListInfoPurchasers.Rows[0]["LastName"].ToString();
                txtEmailAddress.Text = ListInfoPurchasers.Rows[0]["EmailAddress"].ToString();
                txtMobile.Text = ListInfoPurchasers.Rows[0]["Mobile"].ToString();
                ddlCountry.SelectedItem.Text = ListInfoPurchasers.Rows[0]["Country"].ToString();
                txtCity.Text = ListInfoPurchasers.Rows[0]["City"].ToString();
                txtAddress.Text = ListInfoPurchasers.Rows[0]["Address"].ToString();
            }

            DataTable ListPackages = GetData("SELECT * FROM V_PackagesInfo WHERE PackageId = " + strId);
            if (ListPackages.Rows.Count >0)
            {
                PackageTitleEn.InnerText = "Package  " + ListPackages.Rows[0]["PackageTitleEn"].ToString();
                Price.InnerHtml = "SAR " + ListPackages.Rows[0]["Price"].ToString();
                TotalPrice.InnerHtml = "SAR " + ListPackages.Rows[0]["Price"].ToString();
            }
            
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                //TransactionDML("");
            }
            catch (Exception ex) { }
        }


    }
}