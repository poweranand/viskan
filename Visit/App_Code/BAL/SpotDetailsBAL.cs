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
/// Summary description for SpotDetailsBAL
/// </summary>
public class SpotDetailsBAL
{
	public SpotDetailsBAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public DataSet FetchSpotDetails()
    {
        DataSet ds = new DataSet();
        SpotDetailsDAL sp = new SpotDetailsDAL();
        ds = sp.FetchSpotDetails();
        return ds;
    }

  //public DataSet FetchMap()
  //  {
  //      DataSet ds = new DataSet();
  //      SpotDetailsDAL sp = new SpotDetailsDAL();
  //      ds = sp.FetchMap();
  //      return ds;
  //  }

    public DataSet FetchSpotDetails1()
    {
        DataSet ds = new DataSet();
        SpotDetailsDAL sp = new SpotDetailsDAL();
        ds = sp.FetchSpotDetails1();
        return ds;
    }

    public int SaveSpotDetails(string SpotName, string Description, string Religion, string Deity, string Period, string BuiltBy,
        string Architecture, string Sculpture, string painting, string Inscription, string Hymns, string Mythology, string Events,
        string Timing, string Location, string Sketch, string SpotCategory, string SanctifiedBy, int Active)
    {
        int a;
        SpotDetailsDAL sp = new SpotDetailsDAL();
        a = sp.SaveSpotDetails(SpotName, Description, Religion, Deity, Period, BuiltBy,
        Architecture, Sculpture, painting, Inscription, Hymns, Mythology, Events,
        Timing, Location, Sketch, SpotCategory, SanctifiedBy, Active);
        return a;
    }

    public int UpdateSpotDetails(string SpotID, string SpotName, string Description, string Religion, string Deity, string Period, string BuiltBy,
        string Architecture, string Sculpture, string painting, string Inscription, string Hymns, string Mythology, string Events,
        string Timing, string Location, string Sketch, string SpotCategory, string SanctifiedBy, int Active)
    {
        int a;
        SpotDetailsDAL sp = new SpotDetailsDAL();
        a = sp.UpdateSpotDetails(SpotID,SpotName, Description, Religion, Deity, Period, BuiltBy,
        Architecture, Sculpture, painting, Inscription, Hymns, Mythology, Events,
        Timing, Location, Sketch, SpotCategory, SanctifiedBy, Active);
        return a;
    }

    public int DeleteSpotDetails(string SpotID)
    {
        int a;
        SpotDetailsDAL sp = new SpotDetailsDAL();
        a = sp.DeleteSpotDetails(SpotID);
        return a;
    }

    public DataTable EditSpotDetails(string SpotID)
    {
        DataTable ds = new DataTable();
        SpotDetailsDAL sp = new SpotDetailsDAL();
        ds = sp.EditSpotDetails(SpotID);
        return ds;
    }
}
