using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Festivals : System.Web.UI.Page
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
                grdFestival.PageSize = Convert.ToInt32(pg.Rows[0][0].ToString());
            #endregion

            // Bind the banner of the image.
            DataSet ds = new DataSet();
            GeneralDAL lp = new GeneralDAL();
            ds = lp.FetchBanner();
            if (ds.Tables[3].Rows.Count != 0)
            //  imgBanner.ImageUrl = ds.Tables[3].Rows[0][1].ToString();
            //End Bind the banner of the image.
            {
                // fetch value of the grid details....
                DataSet ds1 = new DataSet();
                FestivalBAL fs = new FestivalBAL();
                ds1 = fs.FetchFestival();
                grdFestival.DataSource = ds1.Tables[0];
                grdFestival.DataBind();
                //End fetch value of the grid details....

           
            //if comes from index page 
            if (Session["festivalId"] != null)
            {
                int rowno = 0;
                for (int i = 0; ds1.Tables[0].Rows.Count > i; i++)
                {
                    if (ds1.Tables[0].Rows[i]["festivalid"].ToString() == Session["festivalId"].ToString())
                        rowno = i;
                }
                FetchGridDetails(Session["festivalId"].ToString());
                grdFestival.PageIndex = rowno / grdFestival.PageSize;
                int SelectedRowIndex = rowno - (grdFestival.PageSize * grdFestival.PageIndex);
                grdFestival.DataBind();
                grdFestival.Rows[SelectedRowIndex].BackColor = System.Drawing.Color.LightGray;
                Session["festivalId"] = null;
            }//other load festival here.....
            else if (Request.QueryString["festivalId"] != null)
            {
                int rowno = 0;
                for (int i = 0; ds1.Tables[0].Rows.Count > i; i++)
                {
                    if (ds1.Tables[0].Rows[i]["festivalid"].ToString() == Request.QueryString["festivalId"].ToString())
                        rowno = i;
                }
                FetchGridDetails(Request.QueryString["festivalId"].ToString());
                grdFestival.PageIndex = rowno / grdFestival.PageSize;
                int SelectedRowIndex = rowno - (grdFestival.PageSize * grdFestival.PageIndex);
                grdFestival.DataBind();
                grdFestival.Rows[SelectedRowIndex].BackColor = System.Drawing.Color.LightGray;
            }
            else
            {
                if (ds1.Tables[0].Rows.Count != 0)
                {
                    FetchGridDetails(ds1.Tables[0].Rows[0][0].ToString());
                    grdFestival.Rows[0].BackColor = System.Drawing.Color.LightGray;
                }
            }
            }

        }
    }

    #region Select First ddl category...
    protected void ddlSearchCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlSearchCategory.SelectedItem.Text != "Select")
            ddlSearchCategory1.Enabled = true;
        else
        {
            ddlSearchCategory1.SelectedIndex = 0;
            ddlSearchCategory1.Enabled = false;
            // fetch value of the grid details....
            DataSet ds1 = new DataSet();
            FestivalBAL fs = new FestivalBAL();
            ds1 = fs.FetchFestival();
            grdFestival.DataSource = ds1.Tables[0];
            grdFestival.DataBind();
            //End fetch value of the grid details....
        }
    }
    #endregion

    #region Select Second ddl category...
    protected void ddlSearchCategory1_SelectedIndexChanged(object sender, EventArgs e)
    {

        DataTable ds = new DataTable();
        GeneralBAL lp = new GeneralBAL();
        ds = lp.FetchFestivalGridDetails(ddlSearchCategory1.SelectedItem.Text);

        grdFestival.DataSource = ds;
        grdFestival.DataBind();
    }
    #endregion

    #region grid Functionality..

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
                for (int j = 0; j < grdFestival.Rows.Count; j++)
                    grdFestival.Rows[j].BackColor = System.Drawing.Color.White;
                grdFestival.Rows[_selectedIndex].BackColor = System.Drawing.Color.LightGray;
                LinkButton festid = (LinkButton)grdFestival.Rows[_selectedIndex].Cells[1].FindControl("lblgrdFestId");
                FetchGridDetails(festid.Text);
                UpdatePanel2.Update();
                UpdatePanel3.Update();
            }
        }

    }

    protected void gridPageChanging(object sender, GridViewPageEventArgs e)
    {
        if (ddlSearchCategory.SelectedItem.Text == "Select" & ddlSearchCategory1.SelectedItem.Text == "Select")
        {
            DataSet ds1 = new DataSet();
            FestivalBAL fs = new FestivalBAL();
            ds1 = fs.FetchFestival();
            grdFestival.DataSource = ds1.Tables[0];
            grdFestival.PageIndex = e.NewPageIndex;
            grdFestival.DataBind();
        }
        else
        {
            DataTable ds = new DataTable();
            GeneralBAL lp = new GeneralBAL();
            ds = lp.FetchFestivalGridDetails(ddlSearchCategory1.SelectedItem.Text);
            grdFestival.DataSource = ds;
            grdFestival.PageIndex = e.NewPageIndex;
            grdFestival.DataBind();
        }
    }
    #endregion

    #region Fetch Grid Details..
    public void FetchGridDetails(string FestivalID)
    {
        DataSet details = new DataSet();
        GeneralBAL fest = new GeneralBAL();
        details = fest.FetchFestivalBySearch(FestivalID);

        if (details.Tables[0].Rows.Count != 0)
        {
            lblName.Text = details.Tables[0].Rows[0][1].ToString();
            //lnkSpotName.CommandArgument = details.Tables[0].Rows[0][1].ToString();

            if (string.IsNullOrEmpty(details.Tables[0].Rows[0][3].ToString()))
            {
                lblDescription.Visible = false;
                tr1.Visible = false;
                trs1.Visible = false;
            }
            else
            {
                lblDescription.Visible = true;
                lblDescription.Text = details.Tables[0].Rows[0][3].ToString();
                tr1.Visible = true;
                trs1.Visible = true;
            }

            if (string.IsNullOrEmpty(details.Tables[0].Rows[0][2].ToString()))
            {
                lblMonth.Visible = false;
                lblMonthVal.Visible = false;
                tr2.Visible = false;
                trs2.Visible = false;
            }
            else if (!string.IsNullOrEmpty(details.Tables[0].Rows[0][2].ToString()) && details.Tables[0].Rows[0][2].ToString() != "Select")
            {
                lblMonth.Visible = true;
                lblMonthVal.Visible = true;
                lblMonthVal.Text = details.Tables[0].Rows[0][2].ToString();
                tr2.Visible = true;
                trs2.Visible = true;
            }
            else
            {
                lblMonth.Visible = false;
                lblMonthVal.Visible = false;
                tr2.Visible = false;
                trs2.Visible = false;
            }

            if (string.IsNullOrEmpty(details.Tables[0].Rows[0][5].ToString()))
            {
                lblSpotName.Visible = false;
                lblSpotNameVal.Visible = false;
                tr3.Visible = false;
                trs3.Visible = false;
            }
            else if (!string.IsNullOrEmpty(details.Tables[0].Rows[0][5].ToString()) && details.Tables[0].Rows[0][5].ToString() != "Select")
            {
                lblSpotName.Visible = true;
                lblSpotNameVal.Visible = true;
                lblSpotNameVal.Text = details.Tables[0].Rows[0][5].ToString();
                tr3.Visible = true;
                trs3.Visible = true;
            }
            else
            {
                lblSpotName.Visible = false;
                lblSpotNameVal.Visible = false;
                tr3.Visible = false;
                trs3.Visible = false;
            }

            if (string.IsNullOrEmpty(details.Tables[0].Rows[0][4].ToString()))
            {
                lblDuration.Visible = false;
                lblDurationVal.Visible = false;
                tr4.Visible = false;
                trs4.Visible = false;
            }
            else
            {
                lblDuration.Visible = true;
                lblDurationVal.Visible = true;
                lblDurationVal.Text = details.Tables[0].Rows[0][4].ToString();
                tr4.Visible = true;
                trs4.Visible = true;
            }

            if (!string.IsNullOrEmpty(details.Tables[0].Rows[0][6].ToString()))
                lnkSpotName.CommandArgument = details.Tables[0].Rows[0][6].ToString();

            if (details.Tables[1].Rows.Count != 0)
            {
                if (!string.IsNullOrEmpty(details.Tables[1].Rows[0][0].ToString()))
                {
                    GridView1.DataSource = details.Tables[1];
                    GridView1.DataBind();
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
                    if (!bt.Rows[i]["destination"].ToString().Contains("Festivals.aspx"))
                        lblDescription.Text = lblDescription.Text.Replace(bt.Rows[i]["li"].ToString(), bt.Rows[i]["destination"].ToString());
            }
            #endregion
        }
        else
        {
            lblName.Text = "Details not available.";
            lblDescription.Visible = false;
            lblMonth.Visible = false;
            lblMonthVal.Visible = false;
            lblSpotName.Visible = false;
            lblSpotNameVal.Visible = false;
            lblDuration.Visible = false;
            lblDurationVal.Visible = false;
            tr11.Visible = false;
            GridView1.Visible = false;
        }
    }
    #endregion

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Session["SpotId"] = lnkSpotName.CommandArgument.ToString();
        Response.Redirect("HistoricalSpots.aspx");
    }

    protected void grdSpotName_SelectedIndexChanged(object sender, EventArgs e)
    {

    }


    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {
        if (TreeView1.SelectedNode.ChildNodes.Count == 0)
        {
            Session["SpotId"] = TreeView1.SelectedNode.Value;
            Response.Redirect("HistoricalSpots.aspx");
        }
    }
}