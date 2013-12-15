using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

/// <summary>
/// Summary description for GeneralBAL
/// </summary>
public class GeneralBAL
{
	public GeneralBAL()
	{
		//
		// TODO: Add constructor logic here
		//
    }

    #region Fetch Search Category Details.....
    public DataTable FetchSearchCategory()
    {
        DataTable ds = new DataTable();
        GeneralDAL lp = new GeneralDAL();
        ds = lp.FetchSearchCategory();
        return ds;
    }
    #endregion

    #region Fetch Detail By Search Category.....
    public DataTable FetchDetailBySearchCategory(string SearchItem)
    {
        DataTable ds = new DataTable();
        GeneralDAL lp = new GeneralDAL();
        ds = lp.FetchDetailBySearchCategory(SearchItem);
        return ds;
    }
    #endregion

    #region Search By Search Category.....
    public DataTable SearchBySearchCategory(string SearchItem)
    {
        DataTable ds = new DataTable();
        GeneralDAL lp = new GeneralDAL();
        ds = lp.SearchBySearchCategory(SearchItem);
        return ds;
    }
    #endregion

    #region Fetch Details By Search .....
    public DataSet FetchDetailBySearch(string SpotID)
    {
        DataSet ds = new DataSet();
        GeneralDAL lp = new GeneralDAL();
        ds = lp.FetchDetailBySearch(SpotID);
        return ds;
    }
    #endregion

    #region Insert Spot Photo....
    public int InsertSpotPhoto(string SpotID, string FileName, string Description, string Title)
    {
        int a;
        GeneralDAL lp = new GeneralDAL();
        a = lp.InsertSpotPhoto(SpotID, FileName, Description, Title);
        return a;
    }
    #endregion

    #region Delete Spot Photo....
    public int DeleteSpotPhoto(string PhotoID)
    {
        int a;
        GeneralDAL lp = new GeneralDAL();
        a = lp.DeleteSpotPhoto(PhotoID);
        return a;
    }
    #endregion

     #region Delete Spot Mapphoto....
    public int DeleteSpotMapphoto(string MapID)
    {
        int b;
        GeneralDAL lp = new GeneralDAL();
        b = lp.DeleteSpotMapphoto(MapID);
        return b;
    }
    #endregion

    #region Insert LP Photo
    public int InsertLPPhoto(string LPID, string FileName, string Description, string Title)
    {
        int a;
        GeneralDAL lp = new GeneralDAL();
        a = lp.InsertLPPhoto(LPID, FileName, Description, Title);
        return a;
    }
    #endregion

    #region Delete LP Photo
    public int DeleteLPPhoto(string PhotoID)
    {
        int a;
        GeneralDAL lp = new GeneralDAL();
        a = lp.DeleteLPPhoto(PhotoID);
        return a;
    }
    #endregion

    #region Insert Festival Photo
    public int InsertFestivalPhoto(string FestivalID, string FileName, string Description, string Title)
    {
        int a;
        GeneralDAL lp = new GeneralDAL();
        a = lp.InsertFestivalPhoto(FestivalID, FileName, Description, Title);
        return a;
    }
    #endregion


    #region Insert Spot Map
    public int InsertSpotMap(string Spotid, string Mappath)
    {
        int a;
        GeneralDAL Map = new GeneralDAL();
        a = Map.InsertSpotMap(Spotid, Mappath);
        return a;
    }
    #endregion 

    #region Delete Festival Photo
    public int DeleteFestivalPhoto(string PhotoID)
    {
        int a;
        GeneralDAL lp = new GeneralDAL();
        a = lp.DeleteFestivalPhoto(PhotoID);
        return a;
    }
    #endregion

    #region Insert Banner Photo
    public int InsertBanner(string Category, string Description)
    {
        int a;
        GeneralDAL lp = new GeneralDAL();
        a = lp.InsertBanner(Category, Description);
        return a;
    }
    #endregion

    #region Fetch Banner.....
    public DataSet FetchBanner()
    {
        DataSet ds = new DataSet();
        GeneralDAL lp = new GeneralDAL();
        ds = lp.FetchBanner();
        return ds;
    }
    #endregion

     #region Fetch Map.......
    public DataSet FetchMap()
    {
        DataSet ds = new DataSet();
        GeneralBAL lp = new GeneralBAL();
        ds = lp.FetchMap();
        return ds;
    }
     #endregion


    #region User Fetch Lp Grid Details.....
    public DataTable FetchLPGridDetails(string LpCategroyName)
    {
        DataTable ds = new DataTable();
        GeneralDAL lp = new GeneralDAL();
        ds = lp.FetchLPGridDetails(LpCategroyName);
        return ds;
    }
    #endregion

    #region Admin Fetch Lp Grid Details.....
    public DataTable FetchLPGridDetails1(string LpCategroyName)
    {
        DataTable ds = new DataTable();
        GeneralDAL lp = new GeneralDAL();
        ds = lp.FetchLPGridDetails1(LpCategroyName);
        return ds;
    }
    #endregion

    #region User Fetch LP Details By Search .....
    public DataSet FetchLPDetailBySearch(string LPID)
    {
        DataSet ds = new DataSet();
        GeneralDAL lp = new GeneralDAL();
        ds = lp.FetchLPDetailBySearch(LPID);
        return ds;
    }
    #endregion

    #region Fetch Festival Grid Details.....
    public DataTable FetchFestivalGridDetails(string Month)
    {
        DataTable ds = new DataTable();
        GeneralDAL lp = new GeneralDAL();
        ds = lp.FetchFestivalGridDetails(Month);
        return ds;
    }
    #endregion

    #region Fetch Festival Details By Search .....
    public DataSet FetchFestivalBySearch(string FestivalID)
    {
        DataSet ds = new DataSet();
        GeneralDAL lp = new GeneralDAL();
        ds = lp.FetchFestivalBySearch(FestivalID);
        return ds;
    }
    #endregion

    #region Fetch Festival Details By Month.....
    public DataTable FetchFestivalByMonth()
    {
        DataTable ds = new DataTable();
        GeneralDAL lp = new GeneralDAL();
        ds = lp.FetchFestivalByMonth();
        return ds;
    }
    #endregion

    #region Fetch Grid Page Size Details...
    public DataTable FetchGridPageSize()
    {
        DataTable ds = new DataTable();
        GeneralDAL lp = new GeneralDAL();
        ds = lp.FetchGridPageSize();
        return ds;
    }
    #endregion

    //#region Fetch Map Grid Page Size map Details....
    //public DataTable FetchMapGridPageSize()
    //{
    //    DataTable ds = new DataTable();
    //    GeneralDAL lp = new GeneralDAL();
    //    ds = lp.FetchMapGridPageSize();
    //    return ds;
    //}
    //#endregion 

    #region Batch
    public DataTable FetchBatchProcess()
    {
        DataTable ds = new DataTable();
        GeneralDAL lp = new GeneralDAL();
        ds = lp.FetchBatchProcess();
        return ds;
    }
    #endregion

    #region Fetch Active Details...
    public DataSet FetchNoOfActiveList()
    {
        DataSet ds = new DataSet();
        GeneralDAL lp = new GeneralDAL();
        ds = lp.FetchNoOfActiveList();
        return ds;
    }
    #endregion
}
