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
using System.Globalization;

public partial class index : System.Web.UI.Page
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

            // Bind the banner of the image.
            DataSet ds = new DataSet();
            DataTable fest = new DataTable();
            GeneralBAL lp = new GeneralBAL();
            ds = lp.FetchBanner();
            if (ds.Tables[0].Rows.Count != 0)
                imgBanner.ImageUrl = ds.Tables[0].Rows[0][1].ToString();
            //End Bind the banner of the image.
            fest = lp.FetchFestivalByMonth();
            grdFestival.DataSource = fest;
            grdFestival.DataBind();

            // Bind the search category value in first ddl
            DataTable ds1 = new DataTable();
            GeneralBAL lp1 = new GeneralBAL();
            ds1 = lp1.FetchSearchCategory();

            ddlSearchCategory.DataSource = ds1;
            ddlSearchCategory.DataTextField = "SearchCategoryName";
            ddlSearchCategory.DataValueField = "SearchCategoryID";
            ddlSearchCategory.DataBind();
            ddlSearchCategory.Items.Insert(0, "Select");
            //End Bind the search category value in first ddl

            // fetch value of the grid details....
            DataSet fetchspotdetails = new DataSet();
            SpotDetailsBAL det = new SpotDetailsBAL();
            fetchspotdetails = det.FetchSpotDetails();
            grdSpotName.DataSource = fetchspotdetails.Tables[4];
            grdSpotName.DataBind();
            //End  first value of the grid details....

            Lbl_Festival.Text = "Festival(s) in " + GetMonthName(DateTime.Now);

            // Bind Active list details
            DataSet ds2 = new DataSet();
            GeneralBAL act = new GeneralBAL();
            ds2 = act.FetchNoOfActiveList();
            if (ds2.Tables[0].Rows.Count != 0)
            {
                lblSpot.Visible = true;
                lblSpot.Text = ds2.Tables[0].Rows[0][0].ToString();
            }
            else
                lblSpot.Visible = false;

            if (ds2.Tables[1].Rows.Count != 0)
            {
                lblLp.Visible = true;
                lblLp.Text = ds2.Tables[1].Rows[0][0].ToString();
            }
            else
                lblLp.Visible = false;

            if (ds2.Tables[2].Rows.Count != 0)
            {
                lblFest.Visible = true;
                lblFest.Text = ds2.Tables[2].Rows[0][0].ToString();
            }
            else
                lblFest.Visible = false;
            //end  Bind Active list details
        }
    }

    #region Get Current Month...
    public static string GetMonthName(DateTime dateValue)
    {
        DateTimeFormatInfo info = new DateTimeFormatInfo();
        string[] names;

        names = info.MonthNames;

        return names[dateValue.Month - 1];
    }
    #endregion

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
            // fetch value of the grid details....
            DataSet fetchspotdetails = new DataSet();
            SpotDetailsBAL det = new SpotDetailsBAL();
            fetchspotdetails = det.FetchSpotDetails();
            grdSpotName.DataSource = fetchspotdetails.Tables[4];
            grdSpotName.DataBind();
            //End  first value of the grid details....
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

    #region festival calendar grid Functionality..

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
            if (_commandName == "Festshow")
            {
                LinkButton festid = (LinkButton)grdFestival.Rows[_selectedIndex].Cells[1].FindControl("lblgrdFestId");
                Session["festivalId"] = festid.Text;
                Response.Redirect("Festivals.aspx");
            }
        }

    }

    protected void gridPageChanging(object sender, GridViewPageEventArgs e)
    {
            DataTable ds = new DataTable();
            GeneralBAL lp = new GeneralBAL();
            ds = lp.FetchFestivalByMonth();
            grdFestival.DataSource = ds;
            grdFestival.PageIndex = e.NewPageIndex;
            grdFestival.DataBind();
    }
    #endregion

    #region Spot name grid Functionality..

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
            if (_commandName == "spotshow")
            {
                LinkButton spotid = (LinkButton)grdSpotName.Rows[_selectedIndex].Cells[1].FindControl("lblgrdSpotNameId");
                Session["SpotId"] = spotid.Text;
                Response.Redirect("HistoricalSpots.aspx");
            }
        }

    }

    protected void gridPageChanging1(object sender, GridViewPageEventArgs e)
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
}
