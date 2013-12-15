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

public partial class HistoricalSpots : System.Web.UI.Page
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
                grdLP.PageSize = Convert.ToInt32(pg.Rows[0][0].ToString());
            #endregion

            // Bind the banner of the image.
            DataSet ds = new DataSet();
            GeneralDAL lp = new GeneralDAL();
            ds = lp.FetchBanner();
            if (ds.Tables[2].Rows.Count != 0)
                imgBanner.ImageUrl = ds.Tables[2].Rows[0][1].ToString();
            //End Bind the banner of the image.

            // fetch value of the grid details....
            DataSet ds1 = new DataSet();
            LPDetailsBAL lp1 = new LPDetailsBAL();
            ds1 = lp1.FetchLP();
            grdLP.DataSource = ds1.Tables[0];
            grdLP.DataBind();

            if (Request.QueryString["LPId"] != null)
            {
                int rowno = 0;
                for (int i = 0; ds1.Tables[0].Rows.Count > i; i++)
                {
                    if (ds1.Tables[0].Rows[i]["LPId"].ToString() == Request.QueryString["LPId"].ToString())
                        rowno = i;
                }
                FetchGridDetails(Request.QueryString["LPId"].ToString());
                grdLP.PageIndex = rowno / grdLP.PageSize;
                int SelectedRowIndex = rowno - (grdLP.PageSize * grdLP.PageIndex);
                grdLP.DataBind();
                grdLP.Rows[SelectedRowIndex].BackColor = System.Drawing.Color.LightGray;
            }//other load festival here.....
            else
            {
                if (ds1.Tables[0].Rows.Count != 0)
                {
                    FetchGridDetails(ds1.Tables[0].Rows[0][0].ToString());
                    grdLP.Rows[0].BackColor = System.Drawing.Color.LightGray;
                }
                //End fetch value of the grid details....
            }
        }
    }

    #region Select First ddl category...
    protected void ddlSearchCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlSearchCategory.SelectedItem.Text != "Select")
        {
            // To bind first ddl value list..
            DataSet ds = new DataSet();
            LPDetailsBAL lp = new LPDetailsBAL();
            ds = lp.FetchLP();

            ddlSearchCategory1.DataSource = ds.Tables[2];
            ddlSearchCategory1.DataTextField = "Lpcategoryname";
            ddlSearchCategory1.DataValueField = "Lpcategoryid";
            ddlSearchCategory1.DataBind();
            ddlSearchCategory1.Items.Insert(0, "Select");
        }
        else
        {
            ddlSearchCategory1.Items.Clear();
            ddlSearchCategory1.Items.Add("Select");
            // fetch value of the grid details....
            DataSet ds1 = new DataSet();
            LPDetailsBAL lp1 = new LPDetailsBAL();
            ds1 = lp1.FetchLP();
            grdLP.DataSource = ds1.Tables[0];
            grdLP.DataBind();
        }
    }
    #endregion

    #region Select Second ddl category...
    protected void ddlSearchCategory1_SelectedIndexChanged(object sender, EventArgs e)
    {
        // to bind second ddl value based on the first ddl value...
        DataTable ds = new DataTable();
        GeneralBAL lp = new GeneralBAL();
        ds = lp.FetchLPGridDetails(ddlSearchCategory1.SelectedItem.Text);
        grdLP.DataSource = ds;
        grdLP.DataBind();
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
            if (_commandName == "spotshow")
            {
                for (int j = 0; j < grdLP.Rows.Count; j++)
                    grdLP.Rows[j].BackColor = System.Drawing.Color.White;
                grdLP.Rows[_selectedIndex].BackColor = System.Drawing.Color.LightGray;
                LinkButton spotid = (LinkButton)grdLP.Rows[_selectedIndex].Cells[1].FindControl("lblgrdSpotNameId");
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
            DataSet ds1 = new DataSet();
            LPDetailsBAL lp1 = new LPDetailsBAL();
            ds1 = lp1.FetchLP();
            grdLP.DataSource = ds1.Tables[0];
            grdLP.PageIndex = e.NewPageIndex;
            grdLP.DataBind();
        }
        else
        {
            DataTable ds = new DataTable();
            GeneralBAL lp = new GeneralBAL();
            ds = lp.FetchLPGridDetails(ddlSearchCategory1.SelectedItem.Text);
            grdLP.DataSource = ds;
            grdLP.PageIndex = e.NewPageIndex;
            grdLP.DataBind();
        }
    }
    #endregion

    #region fetch Grid details...
    public void FetchGridDetails(string LPID)
    {
        DataSet details = new DataSet();
        GeneralBAL spot = new GeneralBAL();
        details = spot.FetchLPDetailBySearch(LPID);

        if (details.Tables[0].Rows.Count != 0)
        {
            lblName.Text = details.Tables[0].Rows[0][1].ToString();

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

            if (string.IsNullOrEmpty(details.Tables[0].Rows[0][4].ToString()))
            {
                tr1.Visible = true;
                lblReligion.Visible = false;
                lblReligionVal.Visible = false;
                tr12.Visible = false;
                trs12.Visible = false;
            }
            else if (!string.IsNullOrEmpty(details.Tables[0].Rows[0][4].ToString()) && details.Tables[0].Rows[0][4].ToString() != "==Select==")
            {
                lblReligion.Visible = true;
                lblReligionVal.Visible = true;
                lblReligionVal.Text = details.Tables[0].Rows[0][4].ToString();
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

            if (string.IsNullOrEmpty(details.Tables[0].Rows[0][2].ToString()))
            {
                lblLPCategroy.Visible = false;
                lblLPCategroyVal.Visible = false;
                tr2.Visible = false;
                trs2.Visible = false;
            }
            else if (!string.IsNullOrEmpty(details.Tables[0].Rows[0][2].ToString()) && details.Tables[0].Rows[0][2].ToString() != "==Select==")
            {
                lblLPCategroy.Visible = true;
                lblLPCategroyVal.Visible = true;
                lblLPCategroyVal.Text = details.Tables[0].Rows[0][2].ToString();
                tr2.Visible = true;
                trs2.Visible = true;
            }
            else
            {
                lblLPCategroy.Visible = false;
                lblLPCategroyVal.Visible = false;
                tr2.Visible = false;
                trs2.Visible = false;
            }

            if (string.IsNullOrEmpty(details.Tables[0].Rows[0][5].ToString()))
            {
                lblDynasty.Visible = false;
                lblDynastyVal.Visible = false;
                tr3.Visible = false;
                trs3.Visible = false;
            }
            else if (!string.IsNullOrEmpty(details.Tables[0].Rows[0][5].ToString()) && details.Tables[0].Rows[0][5].ToString() != "==Select==")
            {
                lblDynasty.Visible = true;
                lblDynastyVal.Visible = true;
                lblDynastyVal.Text = details.Tables[0].Rows[0][5].ToString();
                tr3.Visible = true;
                trs3.Visible = true;
            }
            else
            {
                lblDynasty.Visible = false;
                lblDynastyVal.Visible = false;
                tr3.Visible = false;
                trs3.Visible = false;
            }

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
                    if (!bt.Rows[i]["destination"].ToString().Contains("LegendaryPersonalities.aspx"))
                        lblDescription.Text = lblDescription.Text.Replace(bt.Rows[i]["li"].ToString(), bt.Rows[i]["destination"].ToString());
            }
            #endregion
        }
        else
        {
            lblName.Text = "Details not available.";
            lblDescription.Visible = false;
            lblReligion.Visible = false;
            lblReligionVal.Visible = false;
            lblLPCategroy.Visible = false;
            lblLPCategroyVal.Visible = false;
            lblDynasty.Visible = false;
            lblDynastyVal.Visible = false;
            tr11.Visible = false;
            GridView1.Visible = false;
        }
    }
    #endregion 
}
