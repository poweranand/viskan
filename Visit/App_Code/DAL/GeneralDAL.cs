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
/// Summary description for GeneralDAL
/// </summary>
public class GeneralDAL
{
    SqlConnection con = new SqlConnection();

	public GeneralDAL()
	{
        con.ConnectionString = ConfigurationManager.ConnectionStrings["constr"].ToString();
		//
		// TODO: Add constructor logic here
		//
    }

    #region Fetch Search Category Details.....
    public DataTable FetchSearchCategory()
    {
        DataTable ds = new DataTable();
        SqlDataAdapter da;
        da = new SqlDataAdapter("sp_FetchHSSearchCategory", con);
        da.Fill(ds);
        return ds;
    }
    #endregion

    #region Fetch Detail By Search Category.....
    public DataTable FetchDetailBySearchCategory(string SearchItem)
    {
        DataTable ds = new DataTable();
        SqlDataAdapter da;
        SqlCommand cmd = new SqlCommand("sp_FetchBySearchCategory", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@searchitem", SearchItem);
        da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        return ds;
    }
    #endregion

    #region Search By Search Category.....
    public DataTable SearchBySearchCategory(string SearchItem)
    {
        DataTable ds = new DataTable();
        SqlDataAdapter da;
        SqlCommand cmd = new SqlCommand("sp_SearchBySearchCategory", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@searchitem", SearchItem);
        da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        return ds;
    }
    #endregion

    #region Fetch Details By Search .....
    public DataSet FetchDetailBySearch(string SpotID)
    {
        DataSet ds = new DataSet();
        SqlDataAdapter da;
        SqlCommand cmd = new SqlCommand("sp_FetchDetailsBySearch", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@spotid", SpotID);
        da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        return ds;
    }
    #endregion

    #region Insert Spot Photo....
    public int InsertSpotPhoto(string SpotID, string FileName, string Description, string Title)
    {
        SqlCommand cmd = new SqlCommand("sp_insertSpotPhoto", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@spotID", SpotID);
        cmd.Parameters.AddWithValue("@ImageName", FileName);
        cmd.Parameters.AddWithValue("@Description", Description);
        cmd.Parameters.AddWithValue("@titlename", Title);
        con.Open();
        int a = cmd.ExecuteNonQuery();
        con.Close();
        return a;
    }
    #endregion

    #region Delete Spot Photo....
    public int DeleteSpotPhoto(string PhotoID)
    {
        SqlCommand cmd = new SqlCommand("sp_DeleteSpotPhoto", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Photoid", PhotoID);
        con.Open();
        int a = cmd.ExecuteNonQuery();
        con.Close();
        return a;
    }
    #endregion

    #region Delete Spot Mapphoto....
    public int DeleteSpotMapphoto(string MapID)
    {
        SqlCommand cmd = new SqlCommand("sp_Deletemapphoto", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@MapID", MapID);
        con.Open();
        int b = cmd.ExecuteNonQuery();
        con.Close();
        return b;
    }
    #endregion 

    #region Insert LP Photo
    public int InsertLPPhoto(string LPID, string FileName, string Description, string Title)
    {
        SqlCommand cmd = new SqlCommand("sp_insertLPPhoto", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@LPID", LPID);
        cmd.Parameters.AddWithValue("@ImageName", FileName);
        cmd.Parameters.AddWithValue("@Description", Description);
        cmd.Parameters.AddWithValue("@titlename", Title);
        con.Open();
        int a = cmd.ExecuteNonQuery();
        con.Close();
        return a;
    }
    #endregion

    #region Delete LP Photo
    public int DeleteLPPhoto(string PhotoID)
    {
        SqlCommand cmd = new SqlCommand("sp_DeleteLPPhoto", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Photoid ", PhotoID);
        con.Open();
        int a = cmd.ExecuteNonQuery();
        con.Close();
        return a;
    }
    #endregion

    #region Insert Festival Photo
    public int InsertFestivalPhoto(string FestivalID, string FileName, string Description, string Title)
    {
        SqlCommand cmd = new SqlCommand("sp_insertFestivalPhoto", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@FesID", FestivalID);
        cmd.Parameters.AddWithValue("@ImageName", FileName);
        cmd.Parameters.AddWithValue("@Description", Description);
        cmd.Parameters.AddWithValue("@titlename", Title);
        con.Open();
        int a = cmd.ExecuteNonQuery();
        con.Close();
        return a;
    }
    #endregion

    #region Delete Festival Photo

    #region Insert Spot Map 
    public int InsertSpotMap (string Spotid, string Mappath)
    {
        SqlCommand cmd = new SqlCommand("sp_insertmapphoto", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@spotid",Spotid);
        cmd.Parameters.AddWithValue("@mappath", Mappath);
        con.Open();
        int a = cmd.ExecuteNonQuery();
        con.Close();
        return a;
    }
    #endregion 


    public int DeleteFestivalPhoto(string PhotoID)
    {
        SqlCommand cmd = new SqlCommand("sp_DeleteFestPhoto", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Photoid ", PhotoID);
        con.Open();
        int a = cmd.ExecuteNonQuery();
        con.Close();
        return a;
    }
    #endregion

    #region Insert Banner Photo
    public int InsertBanner(string Category, string Description)
    {
        SqlCommand cmd = new SqlCommand("sp_InsertBannerPhoto", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@category", Category);
        cmd.Parameters.AddWithValue("@Description", Description);
        con.Open();
        int a = cmd.ExecuteNonQuery();
        con.Close();
        return a;
    }
    #endregion

    #region Fetch Banner.....
    public DataSet FetchBanner()
    {
        DataSet ds = new DataSet();
        SqlDataAdapter da;
        SqlCommand cmd = new SqlCommand("sp_FetchBanner", con);
        cmd.CommandType = CommandType.StoredProcedure;
        da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        return ds;
    }
    #endregion

    //#region Fetch Map.......
    //public DataSet FetchMap()
    //{
    //    DataSet ds = new DataSet();
    //    SqlDataAdapter da;
    //    SqlCommand cmd = new SqlCommand("sp_FetchMap", con);
    //    cmd.CommandType = CommandType.StoredProcedure;
    //    da = new SqlDataAdapter(cmd);
    //    da.Fill(ds);
    //    return ds;
    //}
    //#endregion 

    #region User Fetch Lp Grid Details...
    public DataTable FetchLPGridDetails(string LpCategroyName)
    {
        DataTable ds = new DataTable();
        SqlDataAdapter da;
        SqlCommand cmd = new SqlCommand("sp_SearchByLPSearchCategory", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@searchitem", LpCategroyName);
        da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        return ds;
    }
    #endregion

    #region Admin Fetch Lp Grid Details...
    public DataTable FetchLPGridDetails1(string LpCategroyName)
    {
        DataTable ds = new DataTable();
        SqlDataAdapter da;
        SqlCommand cmd = new SqlCommand("sp_SearchByLPSearchCategory1", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@searchitem", LpCategroyName);
        da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        return ds;
    }
    #endregion

    #region User Fetch LP Details By Search .....
    public DataSet FetchLPDetailBySearch(string LPID)
    {
        DataSet ds = new DataSet();
        SqlDataAdapter da;
        SqlCommand cmd = new SqlCommand("sp_FetchLPDetailsBySearch", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@lpid", LPID);
        da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        return ds;
    }
    #endregion

    #region Fetch Festival Grid Details...
    public DataTable FetchFestivalGridDetails(string Month)
    {
        DataTable ds = new DataTable();
        SqlDataAdapter da;
        SqlCommand cmd = new SqlCommand("sp_SearchByFestSearchCategory", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@searchitem", Month);
        da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        return ds;
    }
    #endregion

    #region Fetch Festival Details By Search .....
    public DataSet FetchFestivalBySearch(string FestivalID)
    {
        DataSet ds = new DataSet();
        SqlDataAdapter da;
        SqlCommand cmd = new SqlCommand("sp_FetchFestDetailsBySearch", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Fesid", FestivalID);
        da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        return ds;
    }
    #endregion

    #region Fetch Festival Details By Month.....
    public DataTable FetchFestivalByMonth()
    {
        DataTable ds = new DataTable();
        SqlDataAdapter da;
        da = new SqlDataAdapter("sp_FetchFestDetailsByMonth", con);
        da.Fill(ds);
        return ds;
    }
    #endregion

    #region Fetch Grid Page Size Details...
    public DataTable FetchGridPageSize()
    {
        DataTable ds = new DataTable();
        SqlDataAdapter da;
        SqlCommand cmd = new SqlCommand("sp_fetchGridPageSize", con);
        cmd.CommandType = CommandType.StoredProcedure;
        da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        return ds;
    }
    #endregion

    //#region Fetch Map Grid Page Size1 Details....
    //public DataTable FetchMapGridPageSize()
    //{
    //    DataTable ds = new DataTable();
    //    SqlDataAdapter d;
    //    SqlCommand cm = new SqlCommand("sp_fetchgridpagesizemap", con);
    //    cm.CommandType = CommandType.StoredProcedure;
    //    d = new SqlDataAdapter(cm);
    //    d.Fill(ds);
    //    return ds;
    //}
    //#endregion 

    #region Batch
    public DataTable FetchBatchProcess()
    {
        DataTable ds = new DataTable();
        SqlDataAdapter da;
        da = new SqlDataAdapter("select * from tb_batch", con);
        da.Fill(ds);
        return ds;
    }
    #endregion

    #region Fetch Active Details...
    public DataSet FetchNoOfActiveList()
    {
        DataSet ds = new DataSet();
        SqlDataAdapter da;
        SqlCommand cmd = new SqlCommand("sp_NoofActiveList", con);
        cmd.CommandType = CommandType.StoredProcedure;
        da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        return ds;
    }
    #endregion

}
