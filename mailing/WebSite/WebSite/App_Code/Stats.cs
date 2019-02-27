using DataHelpers;
using Model.Entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;

/// <summary>
/// Descripción breve de Stats
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
[System.Web.Script.Services.ScriptService]
public class Stats : WebService
{
    private SQLHelper sql;

    public Stats()
    {
        this.sql = new SQLHelper();
    }
    
    [WebMethod]
    [ScriptMethod(UseHttpGet = true)]
    public List<Monthly> getMonthly(string name_from)
    {
        SqlParameter[] sqlParams = new SqlParameter[]{
            new SqlParameter("name_from", name_from),
        };

        DataTable dt = this.sql.exec(@"
            SELECT TOP 3 
              MONTH(inicio_lanzamiento) AS mes
            , YEAR(inicio_lanzamiento) as año
            , COUNT(idAccion) AS acciones
            , SUM(mail_enviados) AS enviados
            FROM MAI_AccioneAnalisisEnviosECS 
            WHERE DATEDIFF(MONTH,inicio_lanzamiento,GETDATE()) < 4
            AND (@name_from is null or name_from = @name_from)
            GROUP BY YEAR(inicio_lanzamiento), MONTH(inicio_lanzamiento)
            ORDER BY año desc ,mes desc
        ", sqlParams);

        List<Monthly> dtList = dt.AsEnumerable()
        .Select(row => new Monthly
        {
            mes      = (int)row["mes"],
            enviados = (int)row["enviados"],
            acciones = (int)row["acciones"],
        }).ToList();

        return dtList;
    }

    [WebMethod]
    [ScriptMethod(UseHttpGet = true)]
    public List<Calendar> getCalendar(string name_from)
    {
        SqlParameter[] sqlParams = new SqlParameter[]{
            new SqlParameter("name_from", name_from),
        };

        DataTable dt = this.sql.exec(@"
            SELECT  
            DATEPART(HOUR, inicio_lanzamiento) as hora
            , DATEPART(WEEKDAY,inicio_lanzamiento) as dia
            , SUM(mail_enviados) as envios 
            FROM MAI_AccioneAnalisisEnviosECS 
            WHERE DATEDIFF(MONTH,inicio_lanzamiento,GETDATE()) < 4
            AND (@name_from is null or name_from = @name_from)
            GROUP BY 
              DATEPART(HOUR, inicio_lanzamiento)
            , DATEPART(WEEKDAY,inicio_lanzamiento)
        ", sqlParams);

        List<Calendar> dtList = dt.AsEnumerable()
        .Select(row => new Calendar
        {
            hora = (int)row["hora"],
            dia = (int)row["dia"],
            envios = (int)row["envios"],
        }).ToList();

        return dtList;
    }

    [WebMethod]
    [ScriptMethod(UseHttpGet = true)]
    public List<Conversion> getConversion(string name_from)
    {
        SqlParameter[] sqlParams = new SqlParameter[]{
            new SqlParameter("name_from", name_from),
        };

        DataTable dt = this.sql.exec(@"
            SELECT 
              mail_enviados
            , mail_open_rate
            FROM MAI_AccioneAnalisisEnviosECS 
            WHERE DATEDIFF(MONTH,inicio_lanzamiento,GETDATE()) < 4
            AND (@name_from is null or name_from = @name_from)
            AND mail_enviados > 0
        ", sqlParams);

        List<Conversion> dtList = dt.AsEnumerable()
        .Select(row => new Conversion
        {
            enviados = (int)row["mail_enviados"],
            open_rate = (int)row["mail_open_rate"]
        }).ToList();

        return dtList;
    }
    
    [WebMethod]
    [ScriptMethod(UseHttpGet = true)]
    public List<AccionAnalisisEnvio> getSuscriptos(string name_from)
    {
        SqlParameter[] sqlParams = new SqlParameter[]{
            new SqlParameter("name_from", name_from),
        };

        DataTable dt = this.sql.exec(@"
            Select a.*,b.Activos,b.Inactivos FROM
		    (SELECT CAST(a.inicio_lanzamiento as DATE) as inicio_lanzamiento
            ,sum( a.mail_enviados) as mail_enviados
            ,sum( a.mail_rebotados) as mail_rebotados
            ,sum( a.mail_open_rate )as mail_open_rate
            ,count(a.idAccion) as idAccion
            FROM MAI_AccioneAnalisisEnviosECS a
            WHERE a.inicio_lanzamiento >= DATEADD([DAY], DATEDIFF([DAY], '19000101', GETDATE()) - 180, '19000101')
            AND (@name_from is null or name_from = @name_from)
			GROUP BY CAST(a.inicio_lanzamiento as DATE) ) as a
            INNER JOIN   
            (SELECT CAST(MAI_AccioneAnalisisEnviosECS.inicio_lanzamiento as DATE) as inicio_lanzamiento,
             SUM(CASE WHEN AS_Suscliente.SclEstado = 'A' THEN 1 ELSE 0 END) as activos
            , SUM(CASE WHEN AS_Suscliente.SclEstado = 'B' THEN 1 ELSE 0 END) as inactivos
            FROM MAI_AccioneAnalisisEnviosECS, MAI_AnalisisEnviosECS, AS_Suscliente, AS_EreportsOtherSystem 
            WHERE MAI_AccioneAnalisisEnviosECS.inicio_lanzamiento >= DATEADD([DAY], DATEDIFF([DAY], '19000101', GETDATE()) - 180, '19000101')
            AND (@name_from is null or name_from = @name_from)
            AND MAI_AccioneAnalisisEnviosECS.idAccioneAnalisisEnviosECS = MAI_AnalisisEnviosECS.idAnalisisEnvioECS 
            AND AS_EreportsOtherSystem.CliCod = AS_Suscliente.CliCod 
            AND MAI_AnalisisEnviosECS.email = AS_EreportsOtherSystem.EMailReports
            GROUP BY CAST(MAI_AccioneAnalisisEnviosECS.inicio_lanzamiento as DATE)	
           ) as b
			ON a.inicio_lanzamiento = b.inicio_lanzamiento;
            ", sqlParams);

        List<AccionAnalisisEnvio> dtList = dt.AsEnumerable()
        .Select(row => new AccionAnalisisEnvio
        {
            inicio_lanzamiento = row["inicio_lanzamiento"] != DBNull.Value ? ((DateTime)row["inicio_lanzamiento"]).Ticks : 0,
            idAccion = (int)row["idAccion"],
            mail_enviados = (int)row["mail_enviados"],
            mail_rebotados = (int)row["mail_rebotados"],
            mail_open_rate = (int)row["mail_open_rate"],
            activos = (int)row["activos"],
            inactivos = (int)row["inactivos"],
        }).ToList();

        return dtList;
    }

}
