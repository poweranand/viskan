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
/// Summary description for FestivalDAL
/// </summary>
public class FestivalDAL
{

    SqlConnection con = new SqlConnection();
	public FestivalDAL()
	{

        con.ConnectionString = ConfigurationManager.ConnectionStrings["constr"].ToString();

		//
		// TODO: Add constructor logic here
		//
	}

    #region user Fetch Festival.....
    public DataSet FetchFestival()
    {
        DataSet ds = new DataSet();
        SqlDataAdapter da;
        da = new SqlDataAdapter("sp_FetchFestival", con);
        da.Fill(ds);
        return ds;
    }
    #endregion

    #region admin Fetch Festival.....
    public DataSet FetchFestival1()
    {
        DataSet ds = new DataSet();
        SqlDataAdapter da;
        da = new SqlDataAdapter("sp_FetchFestival1", con);
        da.Fill(ds);
        return ds;
    }
    #endregion

    #region Save Festival Details...
    public int SaveFestival(string FestivalName, string SpotName, string Description, string Month, string Duration, string SpotID, int Active)
    {
        SqlCommand cmd = new SqlCommand("sp_insertFestival", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@FestivalName", FestivalName);
        cmd.Parameters.AddWithValue("@Description", Description);
        cmd.Parameters.AddWithValue("@SpotName", SpotName);
        cmd.Parameters.AddWithValue("@Month", Month);
        cmd.Parameters.AddWithValue("@Duration", Duration);
        cmd.Parameters.AddWithValue("@Spotid", SpotID);
        cmd.Parameters.AddWithValue("@Active", Active);
        con.Open();
        int a = cmd.ExecuteNonQuery();
        con.Close();
        return a;
    }
    #endregion

    #region Update Festival Details...
    public int UpdateFestival(string FestivalID, string FestivalName, string SpotName, string Description, string Month, string Duration, string SpotID, int Active)
    {
        SqlCommand cmd = new SqlCommand("sp_updateFestival", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@FestivalID", FestivalID);
        cmd.Parameters.AddWithValue("@Name", FestivalName);
        cmd.Parameters.AddWithValue("@Description", Description);
        cmd.Parameters.AddWithValue("@SpotName", SpotName);
        cmd.Parameters.AddWithValue("@Month", Month);
        cmd.Parameters.AddWithValue("@Duration", Duration);
        cmd.Parameters.AddWithValue("@Spotid", SpotID);
        cmd.Parameters.AddWithValue("@Active", Active);
        con.Open();
        int a = cmd.ExecuteNonQuery();
        con.Close();
        return a;
    }
    #endregion

    #region Fetch Festival Details.....
    public DataTable FetchFestivalDetails(string FestivalID)
    {
        DataTable ds = new DataTable();
        SqlDataAdapter da;
        SqlCommand cmd = new SqlCommand("sp_fetchFestivalDetails", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@FestivalID", FestivalID);
        da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        return ds;
    }
    #endregion

    #region Delete Festival Details....
    public int DeleteFestivalDetails(string FestivalID)
    {
        SqlCommand cmd = new SqlCommand("sp_DeleteFestivalDetails", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@FestivalID", FestivalID);
        con.Open();
        int a = cmd.ExecuteNonQuery();
        con.Close();
        return a;
    }
    #endregion
}
