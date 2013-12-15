using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data.SqlClient;

public partial class HistoricalSpots2 : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!IsPostBack)
        {
           

            #region Fetch Grid Page Size Details...
            DataTable pg = new DataTable();
            GeneralBAL pz = new GeneralBAL();
            pg = pz.FetchGridPageSize();
            if (pg.Rows.Count != 0 && pg.Rows[0][0].ToString() != string.Empty)
            {
                grdSpotName.PageSize = Convert.ToInt32(pg.Rows[0][0].ToString());
                grdFestival.PageSize = Convert.ToInt32(pg.Rows[0][0].ToString());
            }
            #endregion

            // Bind the search category value in first ddl
            DataTable ds = new DataTable();
            GeneralBAL lp = new GeneralBAL();
            ds = lp.FetchSearchCategory();

            ddlSearchCategory.DataSource = ds;
            ddlSearchCategory.DataTextField = "SearchCategoryName";
            ddlSearchCategory.DataValueField = "SearchCategoryID";
            ddlSearchCategory.DataBind();
            ddlSearchCategory.Items.Insert(0, "Select");
            //End Bind the search category value in first ddl

            // Bind the banner of the image.
            DataSet dsphoto = new DataSet();
            GeneralDAL lpphoto = new GeneralDAL();
            dsphoto = lpphoto.FetchBanner();
            if (dsphoto.Tables[1].Rows.Count != 0)
                imgBanner.ImageUrl = dsphoto.Tables[1].Rows[0][1].ToString();
            //End Bind the banner of the image.

            //// Bind the map of the image.
            //DataSet dsmapphoto = new DataSet();
            //GeneralDAL lpmapphoto = new GeneralDAL();
            //dsmapphoto = lpmapphoto.FetchMap();
            //if (dsmapphoto.Tables[1].Rows.Count != 0)
            //    Image1.ImageUrl = dsmapphoto.Tables[1].Rows[0][1].ToString();
            //// End Bind the map of the image.
           
            // fetch  value of the grid details....
            DataSet fetchspotdetails = new DataSet();
            SpotDetailsBAL det = new SpotDetailsBAL();
            fetchspotdetails = det.FetchSpotDetails();
            grdSpotName.DataSource = fetchspotdetails.Tables[4];
            grdSpotName.DataBind();
            //End  value of the grid details....

            if (Session["SpotId"] != null)
            {
                int rowno = 0;
                for (int i = 0; fetchspotdetails.Tables[4].Rows.Count > i; i++)
                {
                    if (fetchspotdetails.Tables[4].Rows[i]["spotid"].ToString() == Session["SpotId"].ToString())
                        rowno = i;
                }
                FetchGridDetails(Session["SpotId"].ToString());
                grdSpotName.PageIndex = rowno / grdSpotName.PageSize;
                int SelectedRowIndex = rowno - (grdSpotName.PageSize * grdSpotName.PageIndex);
                grdSpotName.DataBind();
                grdSpotName.Rows[SelectedRowIndex].BackColor = System.Drawing.Color.LightGray;
                Session["SpotId"] = null;
            }
            else if (Request.QueryString["SpotId"] != null)
            {
                int rowno = 0;
                for (int i = 0; fetchspotdetails.Tables[4].Rows.Count > i; i++)
                {
                    if (fetchspotdetails.Tables[4].Rows[i]["spotid"].ToString() == Request.QueryString["SpotId"].ToString())
                        rowno = i;
                }
                FetchGridDetails(Request.QueryString["SpotId"].ToString());
                grdSpotName.PageIndex = rowno / grdSpotName.PageSize;
                int SelectedRowIndex = rowno - (grdSpotName.PageSize * grdSpotName.PageIndex);
                grdSpotName.DataBind();
                grdSpotName.Rows[SelectedRowIndex].BackColor = System.Drawing.Color.LightGray;
            }
            else
            {
                if (fetchspotdetails.Tables[4].Rows.Count != 0)
                {
                    grdSpotName.Rows[0].BackColor = System.Drawing.Color.LightGray;
                    FetchGridDetails(fetchspotdetails.Tables[4].Rows[0][0].ToString());
                }
            }
        }
    }

    #region Select First ddl category...
    protected void ddlSearchCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlSearchCategory.SelectedItem.Text != "Select")
        {
            // Bind the search category value in second ddl
            DataTable ds = new DataTable();
            GeneralBAL lp = new GeneralBAL();
            ds = lp.FetchDetailBySearchCategory(ddlSearchCategory.SelectedItem.Text);


            ddlSearchCategory1.DataSource = ds;
            if (ddlSearchCategory.SelectedItem.Text == "Religion")
            {
                ddlSearchCategory1.DataTextField = "ReligionName";
                ddlSearchCategory1.DataValueField = "ReligionID";
            }
            else if (ddlSearchCategory.SelectedItem.Text == "Spot Category")
            {
                ddlSearchCategory1.DataTextField = "SpotCategoryName";
                ddlSearchCategory1.DataValueField = "SpotCategoryID";
            }

            ddlSearchCategory1.DataBind();
            ddlSearchCategory1.Items.Insert(0, "Select");
            //End Bind the search category value in second ddl
        }
        else
        {
            ddlSearchCategory1.Items.Clear();
            ddlSearchCategory1.Items.Add("Select");
            // fetch  value of the grid details....
            DataSet fetchspotdetails = new DataSet();
            SpotDetailsBAL det = new SpotDetailsBAL();
            fetchspotdetails = det.FetchSpotDetails();
            grdSpotName.DataSource = fetchspotdetails.Tables[4];
            grdSpotName.DataBind();
            //End  value of the grid details....
        }
    }
    #endregion

    #region Select Second ddl category...
    protected void ddlSearchCategory1_SelectedIndexChanged(object sender, EventArgs e)
    {
        // to bind the grid details in gridview based on the second ddl value...
        DataTable ds = new DataTable();
        GeneralBAL lp = new GeneralBAL();
        ds = lp.SearchBySearchCategory(ddlSearchCategory1.SelectedItem.Text);

        grdSpotName.DataSource = ds;
        grdSpotName.DataBind();
    }
    #endregion
    
    #region SpotName grid Functionality..

    protected void Gridview_RowDataBound(object sender, GridViewRowEventArgs e)
    {
       
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            // Get the LinkButton control in the first cell
            LinkButton _singleClickButton = (LinkButton)e.Row.Cells[0].Controls[0];
            // Get the javascript which is assigned to this LinkButton
            string _jsSingle = ClientScript.GetPostBackClientHyperlink(_singleClickButton, "");
            // To prevent the first click from posting back immediately 
            // (therefore giving the user a chance to double click) pause the 
            // postback for 300 milliseconds by using setTimeout
            _jsSingle = _jsSingle.Insert(11, "setTimeout(\"");
            _jsSingle += "\", 300)";

            // Add this javascript to the onclick Attribute of the row
            e.Row.Attributes["onclick"] = _jsSingle;

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
            if (_commandName == "spotshow")
            {
                for (int j = 0; j < grdSpotName.Rows.Count; j++)
                    grdSpotName.Rows[j].BackColor = System.Drawing.Color.White;
                grdSpotName.Rows[_selectedIndex].BackColor = System.Drawing.Color.LightGray;
                LinkButton spotid = (LinkButton)grdSpotName.Rows[_selectedIndex].Cells[1].FindControl("lblgrdSpotNameId");
                FetchGridDetails(spotid.Text);
                UpdatePanel2.Update();
                UpdatePanel3.Update();
            }
        }

    }

    protected void gridPageChanging(object sender, GridViewPageEventArgs e)
    {
        if (ddlSearchCategory.SelectedItem.Text == "Select" & ddlSearchCategory1.SelectedItem.Text == "Select")
        {
            DataSet fetchspotdetails = new DataSet();
            SpotDetailsBAL det = new SpotDetailsBAL();
            fetchspotdetails = det.FetchSpotDetails();
            grdSpotName.DataSource = fetchspotdetails.Tables[4];
            grdSpotName.PageIndex = e.NewPageIndex;
            grdSpotName.DataBind();

        }
        else
        {
            DataTable ds = new DataTable();
            GeneralBAL lp = new GeneralBAL();
            ds = lp.SearchBySearchCategory(ddlSearchCategory1.SelectedItem.Text);

            grdSpotName.DataSource = ds;
            grdSpotName.PageIndex = e.NewPageIndex;
            grdSpotName.DataBind();
        }
    }
    #endregion

    #region Festival grid Functionality..

    protected void Gridview_RowDataBound1(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            // Get the LinkButton control in the first cell
            LinkButton _singleClickButton = (LinkButton)e.Row.Cells[0].Controls[0];
            // Get the javascript which is assigned to this LinkButton
            string _jsSingle = ClientScript.GetPostBackClientHyperlink(_singleClickButton, "");
            // To prevent the first click from posting back immediately 
            // (therefore giving the user a chance to double click) pause the 
            // postback for 300 milliseconds by using setTimeout
            _jsSingle = _jsSingle.Insert(11, "setTimeout(\"");
            _jsSingle += "\", 300)";

            // Add this javascript to the onclick Attribute of the row
            e.Row.Attributes["onclick"] = _jsSingle;

        }

    }
    protected void Gridview_OnRowCommand1(object sender, GridViewCommandEventArgs e)
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
            if (_commandName == "Festshow")
            {
                for (int j = 0; j < grdFestival.Rows.Count; j++)
                    grdFestival.Rows[j].BackColor = System.Drawing.Color.White;
                grdFestival.Rows[_selectedIndex].BackColor = System.Drawing.Color.LightGray;
                LinkButton festid = (LinkButton)grdFestival.Rows[_selectedIndex].Cells[1].FindControl("lblgrdFestId");
                Session["festivalId"] = festid.Text;
                Response.Redirect("Festivals.aspx");
            }
        }

    }

    protected void gridPageChanging1(object sender, GridViewPageEventArgs e)
    {
        DataSet details = new DataSet();
        GeneralBAL spot = new GeneralBAL();
        details = spot.FetchDetailBySearch(lblSpotID.Text);
        grdFestival.DataSource = details.Tables[2];
        grdFestival.PageIndex = e.NewPageIndex;
        grdFestival.DataBind();
    }
    #endregion

    #region Fetch Grid Details
    public void FetchGridDetails(string SpotId)
    {
        DataSet details = new DataSet();
        GeneralBAL spot = new GeneralBAL();
        details = spot.FetchDetailBySearch(SpotId);
        if (details.Tables[0].Rows.Count != 0)
        {
            lblSpotID.Text = details.Tables[0].Rows[0][0].ToString();
            lblName.Text = details.Tables[0].Rows[0][1].ToString();
            if (string.IsNullOrEmpty(details.Tables[0].Rows[0][2].ToString()))
            {
                lblDescription.Visible = false;
                tr1.Visible = false;
                trs1.Visible = false;
            }
            else
            {
                lblDescription.Visible = true;
                lblDescription.Text = details.Tables[0].Rows[0][2].ToString();
                tr1.Visible = true;
                trs1.Visible = true;
            }
            if (string.IsNullOrEmpty(details.Tables[0].Rows[0][3].ToString()))
            {
                tr1.Visible = true;
                lblReligion.Visible = false;
                lblReligionVal.Visible = false;
                tr12.Visible = false;
                trs12.Visible = false;
            }
            else if (!string.IsNullOrEmpty(details.Tables[0].Rows[0][3].ToString()) && details.Tables[0].Rows[0][3].ToString() != "==Select==")
            {
                lblReligion.Visible = true;
                lblReligionVal.Visible = true;
                lblReligionVal.Text = details.Tables[0].Rows[0][3].ToString();
                tr12.Visible = true;
                trs12.Visible = true;
            }
            else
            {
                lblReligion.Visible = false;
                lblReligionVal.Visible = false;
                tr12.Visible = false;
                trs12.Visible = false;
            }
            if (string.IsNullOrEmpty(details.Tables[0].Rows[0][4].ToString()))
            {
                lblDeity.Visible = false;
                lblDeityVal.Visible = false;
                tr14.Visible = false;
                trs14.Visible = false;
            }
            else
            {
                lblDeity.Visible = true;
                lblDeityVal.Visible = true;
                lblDeityVal.Text = details.Tables[0].Rows[0][4].ToString();
                tr14.Visible = true;
                trs14.Visible = true;
            }
            if (string.IsNullOrEmpty(details.Tables[0].Rows[0][5].ToString()))
            {
                lblPeriod.Visible = false;
                lblPeriodVal.Visible = false;
                tr16.Visible = false;
                trs16.Visible = false;
            }
            else if (!string.IsNullOrEmpty(details.Tables[0].Rows[0][5].ToString()) && details.Tables[0].Rows[0][5].ToString() != "==Select==")
            {
                lblPeriod.Visible = true;
                lblPeriodVal.Visible = true;
                string period = lblPeriodVal.Text = details.Tables[0].Rows[0][5].ToString();
                int intperiod = int.Parse(period);
                if (intperiod == 11 || intperiod == 12 || intperiod == 13)
                {
                    period = period + "th Century";
                    lblPeriodVal.Text = period;
                }
                else
                {
                    int lastnumber = intperiod % 10;
                    if (lastnumber == 0 || lastnumber == 4 || lastnumber == 5 || lastnumber == 6 || lastnumber == 7 || lastnumber == 8 || lastnumber == 9)
                    {
                        period = period + "th Century";
                        lblPeriodVal.Text = period;
                    }
                    else if (lastnumber == 1)
                    {
                        period = period + "st Century";
                        lblPeriodVal.Text = period;
                    }
                    else if (lastnumber == 2)
                    {
                        period = period + "nd Century";
                        lblPeriodVal.Text = period;
                    }
                    else if (lastnumber == 3)
                    {
                        period = period + "rd Century";
                        lblPeriodVal.Text = period;
                    }
                }
                tr16.Visible = true;
                trs16.Visible = true;
            }
            else
            {
                lblPeriod.Visible = false;
                lblPeriodVal.Visible = false;
                tr16.Visible = false;
                trs16.Visible = false;
            }
            if (string.IsNullOrEmpty(details.Tables[0].Rows[0][6].ToString()))
            {
                lblBuiltBy.Visible = false;
                lblBuiltByVal.Visible = false;
                tr15.Visible = false;
                trs15.Visible = false;
            }
            else if (!string.IsNullOrEmpty(details.Tables[0].Rows[0][6].ToString()) && details.Tables[0].Rows[0][6].ToString() != "==Select==")
            {
                lblBuiltBy.Visible = true;
                lblBuiltByVal.Visible = true;
                lblBuiltByVal.Text = details.Tables[0].Rows[0][6].ToString();
                tr15.Visible = true;
                trs15.Visible = true;
            }
            else
            {
                lblBuiltBy.Visible = false;
                lblBuiltByVal.Visible = false;
                tr15.Visible = false;
                trs15.Visible = false;
            }
            if (string.IsNullOrEmpty(details.Tables[0].Rows[0][7].ToString()))
            {
                lblArchitecture.Visible = false;
                lblArchitectureVal.Visible = false;
                tr3.Visible = false;
                trs3.Visible = false;
            }
            else
            {
                lblArchitecture.Visible = true;
                lblArchitectureVal.Visible = true;
                lblArchitectureVal.Text = details.Tables[0].Rows[0][7].ToString();
                tr3.Visible = true;
                trs3.Visible = true;
            }
            if (string.IsNullOrEmpty(details.Tables[0].Rows[0][8].ToString()))
            {
                lblSculpture.Visible = false;
                lblSculptureVal.Visible = false;
                tr4.Visible = false;
                trs4.Visible = false;
            }
            else
            {
                lblSculpture.Visible = true;
                lblSculptureVal.Visible = true;
                lblSculptureVal.Text = details.Tables[0].Rows[0][8].ToString();
                tr4.Visible = true;
                trs4.Visible = true;
            }
            if (string.IsNullOrEmpty(details.Tables[0].Rows[0][9].ToString()))
            {
                lblPainting.Visible = false;
                lblPaintingVal.Visible = false;
                tr5.Visible = false;
                trs5.Visible = false;
            }
            else
            {
                lblPainting.Visible = true;
                lblPaintingVal.Visible = true;
                lblPaintingVal.Text = details.Tables[0].Rows[0][9].ToString();
                tr5.Visible = true;
                trs5.Visible = true;
            }
            if (string.IsNullOrEmpty(details.Tables[0].Rows[0][10].ToString()))
            {
                lblInscription.Visible = false;
                lblInscriptionVal.Visible = false;
                tr6.Visible = false;
                trs6.Visible = false;
            }
            else
            {
                lblInscription.Visible = true;
                lblInscriptionVal.Visible = true;
                lblInscriptionVal.Text = details.Tables[0].Rows[0][10].ToString();
                tr6.Visible = true;
                trs6.Visible = true;
            }
            if (string.IsNullOrEmpty(details.Tables[0].Rows[0][11].ToString()))
            {
                lblHymns.Visible = false;
                lblHymnsVal.Visible = false;
                tr7.Visible = false;
                trs7.Visible = false;
            }
            else
            {
                lblHymns.Visible = true;
                lblHymnsVal.Visible = true;
                lblHymnsVal.Text = details.Tables[0].Rows[0][11].ToString();
                tr7.Visible = true;
                trs7.Visible = true;
            }
            if (string.IsNullOrEmpty(details.Tables[0].Rows[0][12].ToString()))
            {
                lblMythology.Visible = false;
                lblMythologyVal.Visible = false;
                tr8.Visible = false;
                trs8.Visible = false;
            }
            else
            {
                lblMythology.Visible = true;
                lblMythologyVal.Visible = true;
                lblMythologyVal.Text = details.Tables[0].Rows[0][12].ToString();
                tr8.Visible = true;
                trs8.Visible = true;
            }
            if (string.IsNullOrEmpty(details.Tables[0].Rows[0][13].ToString()))
            {
                lblEvents.Visible = false;
                lblEventsVal.Visible = false;
                tr9.Visible = false;
                trs9.Visible = false;
            }
            else
            {
                lblEvents.Visible = true;
                lblEventsVal.Visible = true;
                lblEventsVal.Text = details.Tables[0].Rows[0][13].ToString();
                tr9.Visible = true;
                trs9.Visible = true;
            }
            if (string.IsNullOrEmpty(details.Tables[0].Rows[0][14].ToString()))
            {
                lblTiming.Visible = false;
                lblTimingVal.Visible = false;
                tr13.Visible = false;
                trs13.Visible = false;
            }
            else
            {
                lblTiming.Visible = true;
                lblTimingVal.Visible = true;
                lblTimingVal.Text = details.Tables[0].Rows[0][14].ToString();
                tr13.Visible = true;
                trs13.Visible = true;
            }
            if (string.IsNullOrEmpty(details.Tables[0].Rows[0][15].ToString()))
            {
                lblLocation.Visible = false;
                lblLocationVal.Visible = false;
                tr2.Visible = false;
                trs2.Visible = false;
            }
            else
            {
                lblLocation.Visible = true;
                lblLocationVal.Visible = true;
                lblLocationVal.Text = details.Tables[0].Rows[0][15].ToString();
                tr2.Visible = true;
                trs2.Visible = true;
            }
            if (string.IsNullOrEmpty(details.Tables[0].Rows[0][17].ToString()))
            {
                lblSpotCategory.Visible = false;
                lblSpotCategoryVal.Visible = false;
                tr18.Visible = false;
                trs18.Visible = false;
            }
            else if (!string.IsNullOrEmpty(details.Tables[0].Rows[0][17].ToString()) && details.Tables[0].Rows[0][17].ToString() != "==Select==")
            {
                lblSpotCategory.Visible = true;
                lblSpotCategoryVal.Visible = true;
                lblSpotCategoryVal.Text = details.Tables[0].Rows[0][17].ToString();
                tr18.Visible = true;
                trs18.Visible = true;
            }
            else
            {
                lblSpotCategory.Visible = false;
                lblSpotCategoryVal.Visible = false;
                tr18.Visible = false;
                trs18.Visible = false;
            }
            if (string.IsNullOrEmpty(details.Tables[0].Rows[0][18].ToString()))
            {
                lblSanctifiedBy.Visible = false;
                lblSanctifiedByVal.Visible = false;
                tr17.Visible = false;
                trs17.Visible = false;
            }
            else if (!string.IsNullOrEmpty(details.Tables[0].Rows[0][18].ToString()) && details.Tables[0].Rows[0][18].ToString() != "==Select==")
            {
                lblSanctifiedBy.Visible = true;
                lblSanctifiedByVal.Visible = true;
                lblSanctifiedByVal.Text = details.Tables[0].Rows[0][18].ToString();
                tr17.Visible = true;
                trs17.Visible = true;
            }
            else
            {
                lblSanctifiedBy.Visible = false;
                lblSanctifiedByVal.Visible = false;
                tr17.Visible = false;
                trs17.Visible = false;
            }
            // bind the festival details basaed on the spotname....
            if (details.Tables[2].Rows.Count != 0)
            {
                if (!string.IsNullOrEmpty(details.Tables[2].Rows[0][0].ToString()))
                {
                    lblFestivals.Visible = true;
                    grdFestival.DataSource = details.Tables[2];
                    grdFestival.DataBind();
                    tr19.Visible = true;
                }
                else
                    tr19.Visible = false;
            }
            else
                tr19.Visible = false;
            //end bind the festival details basaed on the spotname....

            // bind the image details basaed on the spotname....
            if (details.Tables[1].Rows.Count != 0)
            {
                if (!string.IsNullOrEmpty(details.Tables[1].Rows[0][0].ToString()))
                {
                    GridView1.DataSource = details.Tables[1];
                    GridView1.DataBind();
                    tr10.Visible = true;
                }
                else
                    tr10.Visible = false;
            }
            else
                tr10.Visible = false;
            //end bind the image details basaed on the spotname....



            //bind the map image based on spotname....
            if (details.Tables[3].Rows.Count != 0)
            {
                if (!string.IsNullOrEmpty(details.Tables[3].Rows[0][0].ToString()))
                {
                    GridView2.DataSource = details.Tables[3];
                    GridView2.DataBind();
                    tr11.Visible = true;
                }
                else
                    tr11.Visible = false;
            }
            else
                tr11.Visible = false;



            #region Batch process...
            DataTable bt = new DataTable();
            GeneralBAL bto = new GeneralBAL();
            bt = bto.FetchBatchProcess();
            if (bt.Rows.Count != 0)
            {
                for (int i = 0; i < bt.Rows.Count; i++)
                {
                    if (!bt.Rows[i]["destination"].ToString().Contains("HistoricalSpots.aspx"))
                    {
                        lblDescription.Text = lblDescription.Text.Replace(bt.Rows[i]["li"].ToString(), bt.Rows[i]["destination"].ToString());
                        lblArchitectureVal.Text = lblArchitectureVal.Text.Replace(bt.Rows[i]["li"].ToString(), bt.Rows[i]["destination"].ToString());
                        lblSculptureVal.Text = lblSculptureVal.Text.Replace(bt.Rows[i]["li"].ToString(), bt.Rows[i]["destination"].ToString());
                        lblPaintingVal.Text = lblPaintingVal.Text.Replace(bt.Rows[i]["li"].ToString(), bt.Rows[i]["destination"].ToString());
                        lblInscriptionVal.Text = lblInscriptionVal.Text.Replace(bt.Rows[i]["li"].ToString(), bt.Rows[i]["destination"].ToString());
                        lblHymnsVal.Text = lblHymnsVal.Text.Replace(bt.Rows[i]["li"].ToString(), bt.Rows[i]["destination"].ToString());
                        lblMythologyVal.Text = lblMythologyVal.Text.Replace(bt.Rows[i]["li"].ToString(), bt.Rows[i]["destination"].ToString());
                        lblEventsVal.Text = lblEventsVal.Text.Replace(bt.Rows[i]["li"].ToString(), bt.Rows[i]["destination"].ToString());
                        lblLocationVal.Text = lblLocationVal.Text.Replace(bt.Rows[i]["li"].ToString(), bt.Rows[i]["destination"].ToString());
                    }
                }
            }
            #endregion
        }
        else
        {
            lblName.Text = "Details not available.";
            lblDescription.Visible = false;
            lblSanctifiedBy.Visible = false;
            lblSanctifiedByVal.Visible = false;
            lblSpotCategory.Visible = false;
            lblSpotCategoryVal.Visible = false;
            lblLocation.Visible = false;
            lblLocationVal.Visible = false;
            lblTiming.Visible = false;
            lblTimingVal.Visible = false;
            lblPainting.Visible = false;
            lblPaintingVal.Visible = false;
            lblInscription.Visible = false;
            lblInscriptionVal.Visible = false;
            lblHymns.Visible = false;
            lblHymnsVal.Visible = false;
            lblMythology.Visible = false;
            lblMythologyVal.Visible = false;
            lblEvents.Visible = false;
            lblEventsVal.Visible = false;
            lblMythology.Visible = false;
            lblMythologyVal.Visible = false;
            lblHymns.Visible = false;
            lblHymnsVal.Visible = false;
            lblInscription.Visible = false;
            lblInscriptionVal.Visible = false;
            lblPainting.Visible = false;
            lblPaintingVal.Visible = false;
            lblSculpture.Visible = false;
            lblSculptureVal.Visible = false;
            lblArchitecture.Visible = false;
            lblArchitectureVal.Visible = false;
            lblBuiltBy.Visible = false;
            lblBuiltByVal.Visible = false;
            lblPeriod.Visible = false;
            lblPeriodVal.Visible = false;
            lblDeity.Visible = false;
            lblDeityVal.Visible = false;
            lblReligion.Visible = false;
            lblReligionVal.Visible = false;
            tr10.Visible = false;
            tr11.Visible = false;
            GridView1.Visible = false;
            GridView2.Visible = false;
            lblFestivals.Visible = false;
            grdFestival.Visible = false;
        }

    }
    #endregion
    protected void grdSpotName_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
   
}
