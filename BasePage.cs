using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;
using System.Drawing.Imaging;
using System.Drawing.Drawing2D;

namespace StudentServices
{
    public class BasePage : System.Web.UI.Page
    {
        public SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["StudentHubConnectionString"].ConnectionString.ToString());
        public SqlCommand cmd = new SqlCommand();
        protected void BindListControl(ListControl listControl, string dataTextField, string dataValueField, DataTable dataTable, string defaultValue = null)
        {
            listControl.DataSource = dataTable;
            listControl.DataTextField = dataTextField;
            listControl.DataValueField = dataValueField;
            listControl.DataBind();
            if (defaultValue != null)
            {
                listControl.Items.Insert(0, defaultValue);
            }
        }
        protected void BindGrid(GridView gridView, DataTable dataTable)
        {
            gridView.DataSource = dataTable;
            gridView.DataBind();
        }
        protected Boolean ConvertToBoolean(object value)
        {
            return value.ToString() == "1";
        }
        protected int ConvertToInt(bool value)
        {
            if (value)
                return 1;
            else
                return 0;
        }
        public int TransactionDML(String sql)
        {
            string str = "";
            cmd = new SqlCommand(sql, cn);
            try
            {
                cmd.Connection.Open();
                cmd.ExecuteNonQuery();
                return 1;
            }
            catch (Exception ex)
            {
                return -1;
            }
            finally
            {
                cmd.Connection.Close();
            }
        }
        public DataTable GetData(string sql)
        {
            SqlDataAdapter da = new SqlDataAdapter(sql, cn);
            DataTable ds = new DataTable();
            try
            {
                cn.Open();
                da.Fill(ds);
                return ds;
            }
            catch (Exception ex)
            {
                string s = ex.Message;
            }
            finally
            {
                cn.Close();
            }
            return null;
        }
        public string GetScalar(String sqlget)
        {
            string str = "";
            string ret = "true";
            cmd = new SqlCommand(sqlget, cn);
            try
            {
                if (cn.State == ConnectionState.Open) cn.Close();
                cn.Open();
                ret = cmd.ExecuteScalar().ToString();
            }
            catch (Exception ex)
            {
                ret = "";
            }
            finally
            {
                cn.Close();
            }
            return ret;
        }
        public string CorrectDate(DateTime v)
        {
            string d = "";
            string m = "";
            string y = "";
            d = v.Day.ToString();
            m = v.Month.ToString();
            y = v.Year.ToString();
            string rtrn = "";
            rtrn = m + "/" + d + "/" + y;
            return rtrn;

        }
        public class RandomImage
        {
            //Default Constructor 
            public RandomImage() { }
            //property
            public string Text
            {
                get { return this.text; }
            }
            public Bitmap Image
            {
                get { return this.image; }
            }
            public int Width
            {
                get { return this.width; }
            }
            public int Height
            {
                get { return this.height; }
            }
            //Private variable
            private string text;
            private int width;
            private int height;
            private Bitmap image;
            private Random random = new Random();
            //Methods declaration
            public RandomImage(string s, int width, int height)
            {
                this.text = s;
                this.SetDimensions(width, height);
                this.GenerateImage();
            }
            public void Dispose()
            {
                GC.SuppressFinalize(this);
                this.Dispose(true);
            }
            protected virtual void Dispose(bool disposing)
            {
                if (disposing)
                    this.image.Dispose();
            }
            private void SetDimensions(int width, int height)
            {
                if (width <= 0)
                    throw new ArgumentOutOfRangeException("width", width,
                        "Argument out of range, must be greater than zero.");
                if (height <= 0)
                    throw new ArgumentOutOfRangeException("height", height,
                        "Argument out of range, must be greater than zero.");
                this.width = width;
                this.height = height;
            }
            private void GenerateImage()
            {
                Bitmap bitmap = new Bitmap
                  (this.width, this.height, PixelFormat.Format32bppArgb);
                Graphics g = Graphics.FromImage(bitmap);
                g.SmoothingMode = SmoothingMode.AntiAlias;
                Rectangle rect = new Rectangle(0, 0, this.width, this.height);
                HatchBrush hatchBrush = new HatchBrush(HatchStyle.SmallConfetti,
                    Color.LightGray, Color.White);
                g.FillRectangle(hatchBrush, rect);
                SizeF size;
                float fontSize = rect.Height + 1;
                Font font;

                do
                {
                    fontSize--;
                    font = new Font(FontFamily.GenericSansSerif, fontSize, FontStyle.Bold);
                    size = g.MeasureString(this.text, font);
                } while (size.Width > rect.Width);
                StringFormat format = new StringFormat();
                format.Alignment = StringAlignment.Center;
                format.LineAlignment = StringAlignment.Center;
                GraphicsPath path = new GraphicsPath();
                //path.AddString(this.text, font.FontFamily, (int) font.Style, 
                //    font.Size, rect, format);
                path.AddString(this.text, font.FontFamily, (int)font.Style, 75, rect, format);
                float v = 4F;
                PointF[] points =
          {
                new PointF(this.random.Next(rect.Width) / v, this.random.Next(
                   rect.Height) / v),
                new PointF(rect.Width - this.random.Next(rect.Width) / v, 
                    this.random.Next(rect.Height) / v),
                new PointF(this.random.Next(rect.Width) / v, 
                    rect.Height - this.random.Next(rect.Height) / v),
                new PointF(rect.Width - this.random.Next(rect.Width) / v,
                    rect.Height - this.random.Next(rect.Height) / v)
          };
                Matrix matrix = new Matrix();
                matrix.Translate(0F, 0F);
                path.Warp(points, rect, matrix, WarpMode.Perspective, 0F);
                hatchBrush = new HatchBrush(HatchStyle.Percent10, Color.Black, Color.SkyBlue);
                g.FillPath(hatchBrush, path);
                int m = Math.Max(rect.Width, rect.Height);
                for (int i = 0; i < (int)(rect.Width * rect.Height / 30F); i++)
                {
                    int x = this.random.Next(rect.Width);
                    int y = this.random.Next(rect.Height);
                    int w = this.random.Next(m / 50);
                    int h = this.random.Next(m / 50);
                    g.FillEllipse(hatchBrush, x, y, w, h);
                }
                font.Dispose();
                hatchBrush.Dispose();
                g.Dispose();
                this.image = bitmap;
            }
        }
        public string GetUserIP()
        {
            string ipList = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            if (!string.IsNullOrEmpty(ipList))
            {
                return ipList.Split(',')[0];
            }
            return Request.ServerVariables["REMOTE_ADDR"];
        }
        public int UserId { get; set; }
        public string UserName { get; set; }

    }
}