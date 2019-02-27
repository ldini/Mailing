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
/// Descripción breve de api
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
[System.Web.Script.Services.ScriptService]
public class api : System.Web.Services.WebService
{
    private SQLHelper sql;

    public api()
    {
        this.sql = new SQLHelper();
    }
    
    [WebMethod]
    [ScriptMethod(UseHttpGet = true)]
    public List<AccionAnalisisEnvio> AccionAnalisisEnvio(string name_from)
    {
        SqlParameter[] sqlParams = new SqlParameter[]{
            new SqlParameter("name_from", name_from),
        };

        DataTable dt = this.sql.exec(@"
            SELECT TOP 50
              idAccioneAnalisisEnviosECS
            , nombre
            , name_from
            , inicio_lanzamiento
            , fin_lanzamiento
            , mail_enviados
            , mail_open_rate
            ,idAccion
            
            FROM MAI_AccioneAnalisisEnviosECS
            
            WHERE (@name_from is null or name_from = @name_from)

            ORDER BY idAccioneAnalisisEnviosECS desc
            ", sqlParams);

        List<AccionAnalisisEnvio> dtList = dt.AsEnumerable()
        .Select(row => new AccionAnalisisEnvio
        {
            id = (int)row["idAccioneAnalisisEnviosECS"],
            nombre = (string)row["nombre"],
            name_from = (string)row["name_from"],
            inicio_lanzamiento = row["inicio_lanzamiento"] != DBNull.Value ? ((DateTime)row["inicio_lanzamiento"]).Ticks : 0,
            fin_lanzamiento = row["fin_lanzamiento"] != DBNull.Value ? ((DateTime)row["fin_lanzamiento"]).Ticks : 0,
            mail_enviados = (int)row["mail_enviados"],
            mail_open_rate = (int)row["mail_open_rate"],
            idAccion = (int)row["idAccion"]
        }).ToList();

        return dtList;
    }



    [WebMethod]
    [ScriptMethod(UseHttpGet = true)]
    public List<Suscripto> Suscriptos(string id)
    {
        SqlParameter[] sqlParams = new SqlParameter[]{
            new SqlParameter("id", id),
        };

        DataTable dt = this.sql.exec(@"
        select TOP (1000)todos.cod_cliente ,estado =  
							        CASE   
								        WHEN count(ap.estado) > 0 THEN 'Activo'  
								        ELSE 'Inactivo'
							        END   
        FROM (SELECT	a.clicod AS cod_cliente,
					        SclEstado AS estado
			        FROM AS_EreportsOtherSystem a, 
				         AS_Suscliente b
			        WHERE a.CliCod = b.CliCod 
				        AND EMailReports 
				        IN (SELECT DISTINCT email
					        FROM MAI_AnalisisEnviosECS
					        WHERE accion = @id)
				        AND sclestado <> 'R'
			        GROUP BY a.clicod,sclestado) AS todos
			        left join 
			        (SELECT cod_cliente as estado
		        FROM (SELECT	a.clicod AS cod_cliente,
					        SclEstado AS estado
			        FROM AS_EreportsOtherSystem a, 
				         AS_Suscliente b
			        WHERE a.CliCod = b.CliCod 
				        AND EMailReports 
				        IN (SELECT DISTINCT email
					        FROM MAI_AnalisisEnviosECS
					        WHERE accion = @id)
				        AND sclestado <> 'R'
			        GROUP BY a.clicod,sclestado) AS a
		        where estado like 'A'
		        group by cod_cliente) as ap on (todos.cod_cliente=ap.estado)
        group by  todos.cod_cliente
        order by todos.cod_cliente
            ", sqlParams);

        List<Suscripto> dtList = dt.AsEnumerable()
        .Select(row => new Suscripto
        {
            cod_cliente = (int)row["cod_cliente"],
            estado = (string)row["estado"],
        }).ToList();

        return dtList;
    }

}
