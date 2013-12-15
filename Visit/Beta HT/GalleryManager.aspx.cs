using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Data.SqlClient;

public partial class GalleryManager : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetNoStore();
        if (!IsPostBack)
        {
            FileUpload1.Attributes.Add("onkeypress", "return false;");
            FileUpload2.Attributes.Add("onkeypress", "return false;");
            FileUpload3.Attributes.Add("onkeypress", "return false;");

            #region Fetch Grid Page Size Details...
            DataTable ds = new DataTable();
            GeneralBAL gl = new GeneralBAL();
            ds = gl.FetchGridPageSize();
            if (ds.Rows.Count != 0 && ds.Rows[0][1].ToString() != string.Empty)
                GridView1.PageSize = Convert.ToInt32(ds.Rows[0][1].ToString());
            #endregion

            //#region Fetch Map Grid Page Size map Details....
            //DataTable ds1 = new DataTable();
            //GeneralBAL gl1 = new GeneralBAL();
            //ds = gl.FetchMapGridPageSize();
            //if (ds1.Rows.Count != 0 && ds1.Rows[0][1].ToString() != string.Empty)
            //    GridView3.PageSize = Convert.ToInt32(ds1.Rows[0][1].ToString());
            //#endregion

        }
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedItem.Text == "Home")
        {
            DropDownList2.Items.Clear();
            DropDownList2.Items.Add("Select");
            DropDownList2.Items.Add("Banner");
            trBanner.Visible = false;
            trGallery.Visible = false;
            trGrid.Visible = false;
        }
        else if (DropDownList1.SelectedItem.Text == "Historical Spots")
        {
            DropDownList2.Items.Clear();
            DropDownList2.Items.Add("Select");
            DropDownList2.Items.Add("Banner");
            DropDownList2.Items.Add("Gallery");
            DropDownList2.Items.Add("Map");
            trBanner.Visible = false;
            trGallery.Visible = false;
            trGrid.Visible = false;
           
        }
        else if (DropDownList1.SelectedItem.Text == "LP")
        {
            DropDownList2.Items.Clear();
            DropDownList2.Items.Add("Select");
            DropDownList2.Items.Add("Banner");
            DropDownList2.Items.Add("Gallery");
            trBanner.Visible = false;
            trGallery.Visible = false;
            trGrid.Visible = false;
        }
        else if (DropDownList1.SelectedItem.Text == "Festivals")
        {
            DropDownList2.Items.Clear();
            DropDownList2.Items.Add("Select");
            DropDownList2.Items.Add("Banner");
            DropDownList2.Items.Add("Gallery");
            trBanner.Visible = false;
            trGallery.Visible = false;
            trGrid.Visible = false;
        }
        else
        {
            DropDownList2.Items.Clear();
            DropDownList2.Items.Add("Select");
            trBanner.Visible = false;
            trGallery.Visible = false;
            trGrid.Visible = false;
            tr2.Visible = false;
            trgrid4.Visible = false;
        }
    }

    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList2.SelectedItem.Text == "Banner")
        {
            trBanner.Visible = true;
            trGallery.Visible = false;
            trGrid.Visible = false;
            tr2.Visible = false;
            trgrid4.Visible = false;

            DataSet ds1 = new DataSet();
            GeneralDAL lp = new GeneralDAL();
            ds1 = lp.FetchBanner();
           
            if (DropDownList1.SelectedItem.Text == "Historical Spots")
                GridView2.DataSource = ds1.Tables[1];
            else if (DropDownList1.SelectedItem.Text == "LP")
                GridView2.DataSource = ds1.Tables[2];
            else if (DropDownList1.SelectedItem.Text == "Festivals")
                GridView2.DataSource = ds1.Tables[3];
            else if (DropDownList1.SelectedItem.Text == "Home")
                GridView2.DataSource = ds1.Tables[0];
            GridView2.DataBind();

        }
        else if (DropDownList2.SelectedItem.Text == "Gallery")
        {
            tr2.Visible = false;
            trgrid4.Visible = false;
            trBanner.Visible = false;
            trGallery.Visible = true;
            trGrid.Visible = true;
            tr1.Visible = false;
            GridView1.DataSource = null;
            GridView1.DataBind();
            if (DropDownList1.SelectedItem.Text == "Historical Spots")
            {
                lblColumn.Text = "Spot Name";
                DataSet ds = new DataSet();
                SpotDetailsBAL sp = new SpotDetailsBAL();
                ds = sp.FetchSpotDetails1();

                ddlColumn.DataSource = ds.Tables[4];
                ddlColumn.DataTextField = "spotname";
                ddlColumn.DataValueField = "spotid";
                ddlColumn.DataBind();
                ddlColumn.Items.Insert(0, "Select");
                RequiredFieldValidator1.ErrorMessage = "Choose Spot Name";
            }
            else if (DropDownList1.SelectedItem.Text == "LP")
            {
                lblColumn.Text = "LP Category Name";
                DataSet ds = new DataSet();
                LPDetailsBAL lp = new LPDetailsBAL();
                ds = lp.FetchLP1();

                ddlColumn.DataSource = ds.Tables[2];
                ddlColumn.DataTextField = "lpcategoryname";
                ddlColumn.DataValueField = "lpcategoryid";
                ddlColumn.DataBind();
                ddlColumn.Items.Insert(0, "Select");
                RequiredFieldValidator1.ErrorMessage = "Choose LP Category Name";
                
            }
            else if (DropDownList1.SelectedItem.Text == "Festivals")
            {
                lblColumn.Text = "Festival Name";
                DataSet ds = new DataSet();
                FestivalBAL fs = new FestivalBAL();
                ds = fs.FetchFestival1();

                ddlColumn.DataSource = ds.Tables[0];
                ddlColumn.DataTextField = "Name";
                ddlColumn.DataValueField = "FestivalID";
                ddlColumn.DataBind();
                ddlColumn.Items.Insert(0, "Select");
                RequiredFieldValidator1.ErrorMessage = "Choose Festival Name";
            }
            else
            {
                lblColumn.Text = string.Empty;
                ddlColumn.Items.Clear();
                ddlColumn.Items.Add("Select");
            }
        }
        else if (DropDownList2.SelectedItem.Text == "Map")
        {
            tr2.Visible = true;
            trgrid4.Visible = true;
            trBanner.Visible = false;
            trGallery.Visible = false ;
            trGrid.Visible = false;
            tr1.Visible = false;
            // GridView3.DataSource = null;
            GridView3.DataBind();
            if (DropDownList1.SelectedItem.Text == "Historical Spots")
            {
                 Label8.Text = "Spot Name";
                DataSet ds = new DataSet();
                SpotDetailsBAL sp = new SpotDetailsBAL();
                ds = sp.FetchSpotDetails1();

                DropDownList3.DataSource = ds.Tables[4];
                DropDownList3.DataTextField = "spotname";
                DropDownList3.DataValueField = "spotid";
                DropDownList3.DataBind();
                DropDownList3.Items.Insert(0, "Select");
                RequiredFieldValidator1.ErrorMessage = "Choose Spot Name";


            }
            else if (DropDownList1.SelectedItem.Text == "LP")
            {
                lblColumn.Text = "LP Category Name";
                DataSet ds = new DataSet();
                LPDetailsBAL lp = new LPDetailsBAL();
                ds = lp.FetchLP1();

                ddlColumn.DataSource = ds.Tables[2];
                ddlColumn.DataTextField = "lpcategoryname";
                ddlColumn.DataValueField = "lpcategoryid";
                ddlColumn.DataBind();
                ddlColumn.Items.Insert(0, "Select");
                RequiredFieldValidator1.ErrorMessage = "Choose LP Category Name";

            }
            else if (DropDownList1.SelectedItem.Text == "Festivals")
            {
                lblColumn.Text = "Festival Name";
                DataSet ds = new DataSet();
                FestivalBAL fs = new FestivalBAL();
                ds = fs.FetchFestival1();

                ddlColumn.DataSource = ds.Tables[0];
                ddlColumn.DataTextField = "Name";
                ddlColumn.DataValueField = "FestivalID";
                ddlColumn.DataBind();
                ddlColumn.Items.Insert(0, "Select");
                RequiredFieldValidator1.ErrorMessage = "Choose Festival Name";
            }
            else
            {
                lblColumn.Text = string.Empty;
                ddlColumn.Items.Clear();
                ddlColumn.Items.Add("Select");
            }
        }

        else
        {
            trBanner.Visible = false;
            trGallery.Visible = false;
            trGrid.Visible = false;
            tr2.Visible = false;
            trgrid4.Visible = false;
        }
   
    }

    #region Adding image for banner....
    protected void Button1_Click(object sender, EventArgs e)
    {
        int a = 0;
        string path = Server.MapPath("");
        string OriginalName = FileUpload1.FileName.ToString();
        byte[] Filedata = (byte[])FileUpload1.FileBytes;
        int count = Filedata.Length;

        Stream sr = FileUpload1.PostedFile.InputStream;
        sr.InitializeLifetimeService();
        sr.Read(Filedata, 0, count);

        if (System.IO.Path.GetExtension(OriginalName).ToLower() == ".jpg")
        {
            System.Drawing.Image img;
            img = System.Drawing.Image.FromStream(sr);
            if (FileUpload1.HasFile == true && FileUpload1.PostedFile.ContentLength != 0 && img.Height >= 128 && img.Width >= 128)
            {
                try
                {
                    if (DropDownList1.SelectedItem.Text == "Home")
                    {
                        if (DropDownList2.SelectedItem.Text == "Banner")
                        {
                            GeneralBAL ph = new GeneralBAL();
                            a = ph.InsertBanner("home", txtDescription1.Text);
                            FileStream fs = new FileStream(path + @"\image\home_banner.jpg", FileMode.OpenOrCreate, FileAccess.Write);
                            fs.Write(Filedata, 0, count);
                            fs.Flush();
                            fs.Close();
                        }
                    }
                    else if (DropDownList1.SelectedItem.Text == "Historical Spots")
                    {
                        if (DropDownList2.SelectedItem.Text == "Banner")
                        {
                            GeneralBAL ph = new GeneralBAL();
                            a = ph.InsertBanner("hs", txtDescription1.Text);
                            FileStream fs = new FileStream(path + @"\image\hs_banner.jpg", FileMode.OpenOrCreate, FileAccess.Write);
                            fs.Write(Filedata, 0, count);
                            fs.Flush();
                            fs.Close();
                        }
                    }
                    else if (DropDownList1.SelectedItem.Text == "LP")
                    {
                        if (DropDownList2.SelectedItem.Text == "Banner")
                        {
                            GeneralBAL ph = new GeneralBAL();
                            a = ph.InsertBanner("lp", txtDescription1.Text);
                            FileStream fs = new FileStream(path + @"\image\lp_banner.jpg", FileMode.OpenOrCreate, FileAccess.Write);
                            fs.Write(Filedata, 0, count);
                            fs.Flush();
                            fs.Close();
                        }
                    }
                    else if (DropDownList1.SelectedItem.Text == "Festivals")
                    {
                        if (DropDownList2.SelectedItem.Text == "Banner")
                        {
                            GeneralBAL ph = new GeneralBAL();
                            a = ph.InsertBanner("fs", txtDescription1.Text);
                            FileStream fs = new FileStream(path + @"\image\fs_banner.jpg", FileMode.OpenOrCreate, FileAccess.Write);
                            fs.Write(Filedata, 0, count);
                            fs.Flush();
                            fs.Close();
                        }
                    }

                    if (a != 0)
                        Page.ClientScript.RegisterStartupScript(typeof(Page), "key", "alert('Photo Added.');location='GalleryManager.aspx';", true);
                    else
                        Page.ClientScript.RegisterStartupScript(typeof(Page), "key", "alert('Contact Administrator.');location='GalleryManager.aspx';", true);
                }
                catch
                {
                    Page.ClientScript.RegisterStartupScript(typeof(Page), "key", "alert('Some problem occured while adding the photo. Please contact administrator');location='GalleryManager.aspx';", true);
                }
            }
            else
                Page.ClientScript.RegisterStartupScript(typeof(Page), "key", "alert('Please choose correct size and type photo .');location='GalleryManager.aspx';", true);
        }
        else
            Page.ClientScript.RegisterStartupScript(typeof(Page), "key", "alert('Please choose correct size and type photo .');location='GalleryManager.aspx';", true);
    }
    #endregion

    #region Adding image for gallery....
    protected void btn_AddImage1_Click(object sender, EventArgs e)
    {
        if (DropDownList2.SelectedItem.Text == "Gallery")
        {
            int a = 0;
            string path = Server.MapPath("");
            string sid = ddlColumn.SelectedValue.ToString();
            string OriginalName = FileUpload2.FileName.ToString();
            byte[] Filedata = (byte[])FileUpload2.FileBytes;
            int count = Filedata.Length;

            Stream sr = FileUpload2.PostedFile.InputStream;
            sr.InitializeLifetimeService();
            sr.Read(Filedata, 0, count);

            if (System.IO.Path.GetExtension(OriginalName).ToLower() == ".jpg")
            {
                System.Drawing.Image img;
                img = System.Drawing.Image.FromStream(sr);
                if (FileUpload2.HasFile == true && FileUpload2.PostedFile.ContentLength != 0 && img.Height >= 128 && img.Width >= 128)
                {
                    try
                    {
                        if (DropDownList1.SelectedItem.Text == "Historical Spots")
                        {
                            GeneralBAL ph = new GeneralBAL();
                            a = ph.InsertSpotPhoto(sid, ("~/image/" + sid + "_HS_" + OriginalName), txtDecription.Text, txtImageTitle.Text);
                            FileStream fs = new FileStream(path + @"\image\" + sid + "_HS_" + OriginalName, FileMode.OpenOrCreate, FileAccess.Write);
                            fs.Write(Filedata, 0, count);
                            fs.Flush();
                            fs.Close();
                        }
                        else if (DropDownList1.SelectedItem.Text == "LP")
                        {
                            string lpid = ddlColumn1.SelectedValue.ToString();
                            GeneralBAL ph = new GeneralBAL();
                            a = ph.InsertLPPhoto(lpid, ("~/image/" + lpid + "_LP_" + OriginalName), txtDecription.Text, txtImageTitle.Text);
                            FileStream fs = new FileStream(path + @"\image\" + lpid + "_LP_" + OriginalName, FileMode.OpenOrCreate, FileAccess.Write);
                            fs.Write(Filedata, 0, count);
                            fs.Flush();
                            fs.Close();
                        }
                        else if (DropDownList1.SelectedItem.Text == "Festivals")
                        {
                            GeneralBAL ph = new GeneralBAL();
                            a = ph.InsertFestivalPhoto(sid, ("~/image/" + sid + "_Fest_" + OriginalName), txtDecription.Text, txtImageTitle.Text);
                            FileStream fs = new FileStream(path + @"\image\" + sid + "_Fest_" + OriginalName, FileMode.OpenOrCreate, FileAccess.Write);
                            fs.Write(Filedata, 0, count);
                            fs.Flush();
                            fs.Close();
                        }

                        if (a != 0)
                            Page.ClientScript.RegisterStartupScript(typeof(Page), "key", "alert('Photo Added.');location='GalleryManager.aspx';", true);
                        else
                            Page.ClientScript.RegisterStartupScript(typeof(Page), "key", "alert('Contact Administrator.');", true);
                    }
                    catch
                    {
                        Page.ClientScript.RegisterStartupScript(typeof(Page), "key", "alert('Some problem occured while adding the photo. Please contact administrator');location='GalleryManager.aspx';", true);
                    }
                }
                else
                    Page.ClientScript.RegisterStartupScript(typeof(Page), "key", "alert('Please choose correct size and type photo .');location='GalleryManager.aspx';", true);
            }
            else
                Page.ClientScript.RegisterStartupScript(typeof(Page), "key", "alert('Please choose correct size and type photo .');location='GalleryManager.aspx';", true);
        }
    }
    #endregion

    #region first column changed.... it means 3rd ddl...
    protected void ddlColumn_SelectedIndexChanged(object sender, EventArgs e)
    {
        tr1.Visible = false;
        if (ddlColumn.SelectedItem.Text != "Select" && DropDownList1.SelectedItem.Text == "LP")
        {
            tr1.Visible = true;
            lblColumn1.Text = "LP Name";
            DataTable ds = new DataTable();
            GeneralBAL lp = new GeneralBAL();
            ds = lp.FetchLPGridDetails1(ddlColumn.SelectedItem.Text);

            ddlColumn1.DataSource = ds;
            ddlColumn1.DataTextField = "lpname";
            ddlColumn1.DataValueField = "lpid";
            ddlColumn1.DataBind();
            ddlColumn1.Items.Insert(0, "Select");
            RequiredFieldValidator2.ErrorMessage = "Choose LP Name";
        }
        else if (DropDownList1.SelectedItem.Text == "Festivals" && ddlColumn.SelectedItem.Text != "Select")
        {
            DataSet details = new DataSet();
            GeneralBAL fest = new GeneralBAL();
            details = fest.FetchFestivalBySearch(ddlColumn.SelectedValue.ToString());
            GridView1.DataSource = details.Tables[1];
            GridView1.DataBind();
        }
        else if (DropDownList1.SelectedItem.Text == "Historical Spots" && ddlColumn.SelectedItem.Text != "Select")
        {
            DataSet details = new DataSet();
            GeneralBAL fest = new GeneralBAL();
            details = fest.FetchDetailBySearch(ddlColumn.SelectedValue.ToString());
            GridView1.DataSource = details.Tables[1];
            GridView1.DataBind();
        }
    }
#endregion

    #region second column changed.... it means 4th ddl...
    protected void ddlColumn1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedItem.Text == "LP" && ddlColumn1.SelectedItem.Text != "Select")
        {
            DataSet details = new DataSet();
            GeneralBAL fest = new GeneralBAL();
            details = fest.FetchLPDetailBySearch(ddlColumn1.SelectedValue.ToString());
            GridView1.DataSource = details.Tables[1];
            GridView1.DataBind();
        }
    }
    #endregion

    #region grid Post Jobs Functionality..

    protected void Gridview_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            LinkButton lnk_grddelete = (LinkButton)e.Row.FindControl("grdDelete");
            lnk_grddelete.CommandArgument = e.Row.RowIndex.ToString();

        }

    }
    protected void Gridview_OnRowCommand(object sender, GridViewCommandEventArgs e)
    {
        string _commandName;
        if (e.CommandArgument.ToString() == "Next" || e.CommandArgument.ToString() == "Last" || e.CommandArgument.ToString() == "First" || e.CommandArgument.ToString() == "Prev")
        {
        }
        else
        {
            // Get the selected index and the command name
            int _selectedIndex = int.Parse(e.CommandArgument.ToString());

            _commandName = e.CommandName;
            if (_commandName == "PhotoDelete")
            {
                int a = 0;
                Label lpid = (Label)GridView1.Rows[_selectedIndex].Cells[0].FindControl("grdID");
                Image lblPhtoPath = (Image)GridView1.Rows[_selectedIndex].Cells[0].FindControl("grdImg");

                if (ddlColumn.SelectedItem.Text != "Select" && DropDownList1.SelectedItem.Text == "LP" && ddlColumn1.SelectedItem.Text != "Select")
                {
                    GeneralBAL ph = new GeneralBAL();
                    a = ph.DeleteLPPhoto(lpid.Text);
                }
                else if (DropDownList1.SelectedItem.Text == "Festivals" && ddlColumn.SelectedItem.Text != "Select")
                {
                    GeneralBAL ph = new GeneralBAL();
                    a = ph.DeleteFestivalPhoto(lpid.Text);
                }
                else if (DropDownList1.SelectedItem.Text == "Historical Spots" && ddlColumn.SelectedItem.Text != "Select")
                {
                    GeneralBAL ph = new GeneralBAL();
                    a = ph.DeleteSpotPhoto(lpid.Text);
                }

                if (a != 0)
                {
                    string pt = Server.MapPath("");
                    string st = lblPhtoPath.ImageUrl.ToString().Remove(0, 1).Replace('/', '\\');
                    System.IO.File.Delete(pt + st);
                    Page.ClientScript.RegisterStartupScript(typeof(Page), "key", "alert('Photo Deleted.');location='GalleryManager.aspx';", true);
                }
                else
                    Page.ClientScript.RegisterStartupScript(typeof(Page), "key", "alert('Contact Administrator.');location='GalleryManager.aspx';", true);
                
            }
        }

    }

    protected void gridPageChanging(object sender, GridViewPageEventArgs e)
    {
        if (DropDownList2.SelectedItem.Text == "Gallery")
        {
            if (DropDownList1.SelectedItem.Text == "Historical Spots" && ddlColumn.SelectedItem.Text != "Select")
            {
                DataSet details = new DataSet();
                GeneralBAL fest = new GeneralBAL();
                details = fest.FetchDetailBySearch(ddlColumn.SelectedValue.ToString());
                GridView1.DataSource = details.Tables[1];
                GridView1.PageIndex = e.NewPageIndex;
                GridView1.DataBind();
            }
            else if (DropDownList1.SelectedItem.Text == "LP" && ddlColumn1.SelectedItem.Text != "Select")
            {
                DataSet details = new DataSet();
                GeneralBAL fest = new GeneralBAL();
                details = fest.FetchLPDetailBySearch(ddlColumn1.SelectedValue.ToString());
                GridView1.DataSource = details.Tables[1];
                GridView1.PageIndex = e.NewPageIndex;
                GridView1.DataBind();
            }
            else if (DropDownList1.SelectedItem.Text == "Festivals" && ddlColumn.SelectedItem.Text != "Select")
            {
                DataSet details = new DataSet();
                GeneralBAL fest = new GeneralBAL();
                details = fest.FetchFestivalBySearch(ddlColumn.SelectedValue.ToString());
                GridView1.DataSource = details.Tables[1];
                GridView1.PageIndex = e.NewPageIndex;
                GridView1.DataBind();
            }
        }
    }
    #endregion
  
    #region Adding image for mappath
    protected void Button1_Click1(object sender, EventArgs e)
    {

        if (DropDownList2.SelectedItem.Text == "Map")
        {
            int a = 0;
            string path = Server.MapPath("");
            string sid =DropDownList3.SelectedValue.ToString();
            string OriginalName = FileUpload3.FileName.ToString();
            byte[] Filedata = (byte[])FileUpload3.FileBytes;
            int count = Filedata.Length;

            Stream sr = FileUpload3.PostedFile.InputStream;
            sr.InitializeLifetimeService();
            sr.Read(Filedata, 0, count);

            if (System.IO.Path.GetExtension(OriginalName).ToLower() == ".jpg")
            {
                System.Drawing.Image img;
                img = System.Drawing.Image.FromStream(sr);
                if (FileUpload3.HasFile == true && FileUpload3.PostedFile.ContentLength != 0 && img.Height >= 128 && img.Width >= 128)
                {
                    try
                    {
                        if (DropDownList1.SelectedItem.Text == "Historical Spots")
                        {
                            string lpid = DropDownList3.SelectedValue.ToString();
                            GeneralBAL ph = new GeneralBAL();
                            a = ph.InsertSpotMap(sid, ("~/image/" + sid + "_Map_" + OriginalName));
                            FileStream fs = new FileStream(path + @"\image\" + sid + "_Map_" + OriginalName, FileMode.OpenOrCreate, FileAccess.Write);
                            fs.Write(Filedata, 0, count);
                            fs.Flush();
                            fs.Close();

                        }
                        if (a != 0)
                            Page.ClientScript.RegisterStartupScript(typeof(Page), "key", "alert('Map Photo Added.');location='GalleryManager.aspx';", true);
                        else
                            Page.ClientScript.RegisterStartupScript(typeof(Page), "key", "alert('Contact Administrator.');", true);
                    }
                    catch
                    {
                        Page.ClientScript.RegisterStartupScript(typeof(Page), "key", "alert('Some problem occured while adding the photo. Please contact administrator');location='GalleryManager.aspx';", true);
                    }
                }
                else
                    Page.ClientScript.RegisterStartupScript(typeof(Page), "key", "alert('Please choose correct size and type photo .');location='GalleryManager.aspx';", true);
            }
            else
                Page.ClientScript.RegisterStartupScript(typeof(Page), "key", "alert('Please choose correct size and type photo .');location='GalleryManager.aspx';", true);
        }
    }
    #endregion
    protected void GridView3_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            string _commandName;
            if (e.CommandArgument.ToString() == "Next" || e.CommandArgument.ToString() == "Last" || e.CommandArgument.ToString() == "First" || e.CommandArgument.ToString() == "Prev")
            {

            }
            else
            {
                // Get the selected index and the command name
                int _selectedIndex = int.Parse(e.CommandArgument.ToString());

                _commandName = e.CommandName;
                if (_commandName == "PhotoDelete")
                {
                    int a = 0;
                    Label lpid = (Label)GridView3.Rows[_selectedIndex].Cells[0].FindControl("grdID1");
                    Image lblPhtoPath = (Image)GridView3.Rows[_selectedIndex].Cells[0].FindControl("grdImg1");

                    if (DropDownList1.SelectedItem.Text == "Historical Spots" && DropDownList3.SelectedItem.Text != "Select")
                    {
                        GeneralBAL ph = new GeneralBAL();
                        a = ph.DeleteSpotMapphoto(lpid.Text);
                    }

                    if (a != 0)
                    {
                        string pt = Server.MapPath("");
                        string st = lblPhtoPath.ImageUrl.ToString().Remove(0, 1).Replace('/', '\\');
                        System.IO.File.Delete(pt + st);
                        Page.ClientScript.RegisterStartupScript(typeof(Page), "key", "alert('Photo Deleted.');location='GalleryManager.aspx';", true);
                    }
                    else
                        Page.ClientScript.RegisterStartupScript(typeof(Page), "key", "alert('Contact Administrator.');location='GalleryManager.aspx';", true);

                }
            }
        }
        catch
        {
        }
    }
    protected void GridView3_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            LinkButton lnk_grddelete = (LinkButton)e.Row.FindControl("grdDelete1");
            lnk_grddelete.CommandArgument = e.Row.RowIndex.ToString();

        }
    }
    protected void GridView3_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        if (DropDownList2.SelectedItem.Text == "Map")
        {
            if (DropDownList1.SelectedItem.Text == "Historical Spots" && DropDownList3.SelectedItem.Text != "Select")
            {
                DataSet details = new DataSet();
                GeneralBAL fest = new GeneralBAL();
                details = fest.FetchDetailBySearch(DropDownList3.SelectedValue.ToString());
               GridView3.DataSource = details.Tables[1];
                GridView3.PageIndex = e.NewPageIndex;
                GridView3.DataBind();
            }
        }
    }
    protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedItem.Text == "Historical Spots" && DropDownList3.SelectedItem.Text != "Select")
        {
            DataSet details = new DataSet();
            GeneralBAL fest = new GeneralBAL();
            details = fest.FetchDetailBySearch(DropDownList3.SelectedValue.ToString());
            GridView3.DataSource = details.Tables[3];
            GridView3.DataBind();
        }
    }
}
