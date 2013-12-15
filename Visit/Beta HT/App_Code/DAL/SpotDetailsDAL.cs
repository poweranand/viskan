using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

/// <summary>
/// Summary description for SpotDetailsDAL
/// </summary>
public class SpotDetailsDAL
{
    SqlConnection con = new SqlConnection();
	public SpotDetailsDAL()
    {
        con.ConnectionString = ConfigurationManager.ConnectionStrings["constr"].ToString();
		//
		// TODO: Add constructor logic here
		//
	}

    public DataSet FetchSpotDetails()
    {
        DataSet ds = new DataSet();
        SqlDataAdapter da;
        da = new SqlDataAdapter("sp_FetchDetails", con);
        da.Fill(ds);
        return ds;
    }

    //public DataSet FetchMap()
    //{
    //    DataSet ds = new DataSet();
    //    SqlDataAdapter da = new SqlDataAdapter("select * from tb_mapphoto", con);
    //    da.Fill(ds);
    //    return ds;
    //}

    public DataSet FetchSpotDetails1()
    {
        DataSet ds = new DataSet();
        SqlDataAdapter da;
        da = new SqlDataAdapter("sp_FetchDetails1", con);
        da.Fill(ds);
        return ds;
    }

    public int SaveSpotDetails(string SpotName,string Description,string Religion,string Deity,string Period,string BuiltBy,
        string Architecture,string Sculpture, string painting, string Inscription,string Hymns,string Mythology,string Events,
        string Timing, string Location, string Sketch, string SpotCategory, string SanctifiedBy, int Active)
    {
        SqlCommand cmd = new SqlCommand("sp_insertSpot", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@SpotName", SpotName);
        cmd.Parameters.AddWithValue("@Description", Description);
        cmd.Parameters.AddWithValue("@Religion", Religion);
        cmd.Parameters.AddWithValue("@Deity", Deity);
        cmd.Parameters.AddWithValue("@Period", Period);
        cmd.Parameters.AddWithValue("@BuiltBy", BuiltBy);
        cmd.Parameters.AddWithValue("@Architecture", Architecture);
        cmd.Parameters.AddWithValue("@Sculpture", Sculpture);
        cmd.Parameters.AddWithValue("@Painting", painting);
        cmd.Parameters.AddWithValue("@Inscription", Inscription);
        cmd.Parameters.AddWithValue("@Hymns", Hymns);
        cmd.Parameters.AddWithValue("@Mythology", Mythology);
        cmd.Parameters.AddWithValue("@Events", Events);
        cmd.Parameters.AddWithValue("@Timing", Timing);
        cmd.Parameters.AddWithValue("@Location", Location);
        cmd.Parameters.AddWithValue("@Sketch", Sketch);
        cmd.Parameters.AddWithValue("@SpotCategory", SpotCategory);
        cmd.Parameters.AddWithValue("@SanctifiedBy", SanctifiedBy);
        cmd.Parameters.AddWithValue("@Active", Active);
        con.Open();
        int a = cmd.ExecuteNonQuery();
        con.Close();
        return a;
    }

    public int UpdateSpotDetails(string SpotID,string SpotName, string Description, string Religion, string Deity, string Period, string BuiltBy,
        string Architecture, string Sculpture, string painting, string Inscription, string Hymns, string Mythology, string Events,
        string Timing, string Location, string Sketch, string SpotCategory, string SanctifiedBy, int Active)
    {
        SqlCommand cmd = new SqlCommand("sp_updateSpot", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@SpotID", SpotID);
        cmd.Parameters.AddWithValue("@SpotName", SpotName);
        cmd.Parameters.AddWithValue("@Description", Description);
        cmd.Parameters.AddWithValue("@Religion", Religion);
        cmd.Parameters.AddWithValue("@Deity", Deity);
        cmd.Parameters.AddWithValue("@Period", Period);
        cmd.Parameters.AddWithValue("@BuiltBy", BuiltBy);
        cmd.Parameters.AddWithValue("@Architecture", Architecture);
        cmd.Parameters.AddWithValue("@Sculpture", Sculpture);
        cmd.Parameters.AddWithValue("@Painting", painting);
        cmd.Parameters.AddWithValue("@Inscription", Inscription);
        cmd.Parameters.AddWithValue("@Hymns", Hymns);
        cmd.Parameters.AddWithValue("@Mythology", Mythology);
        cmd.Parameters.AddWithValue("@Events", Events);
        cmd.Parameters.AddWithValue("@Timing", Timing);
        cmd.Parameters.AddWithValue("@Location", Location);
        cmd.Parameters.AddWithValue("@Sketch", Sketch);
        cmd.Parameters.AddWithValue("@SpotCategory", SpotCategory);
        cmd.Parameters.AddWithValue("@SanctifiedBy", SanctifiedBy);
        cmd.Parameters.AddWithValue("@Active", Active);
        con.Open();
        int a = cmd.ExecuteNonQuery();
        con.Close();
        return a;
    }

    public int DeleteSpotDetails(string SpotID)
    {
        SqlCommand cmd = new SqlCommand("sp_DeleteSpotDetails", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@SpotID", SpotID);
        con.Open();
        int a = cmd.ExecuteNonQuery();
        con.Close();
        return a;
    }

    public DataTable EditSpotDetails(string SpotID)
    {
        DataTable editdetails = new DataTable();
        SqlDataAdapter da;
        SqlCommand cmd = new SqlCommand("sp_fetchSpotDetails", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@SpotID", SpotID);
        da = new SqlDataAdapter(cmd);
        da.Fill(editdetails);
        return editdetails;
    }
}
