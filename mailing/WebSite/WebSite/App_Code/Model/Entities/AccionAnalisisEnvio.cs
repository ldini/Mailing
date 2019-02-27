using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Model.Entities
{

    /// <summary>
    /// Descripción breve de AccionAnalisisEnvio
    /// </summary>
    public class AccionAnalisisEnvio
    {

        public AccionAnalisisEnvio()
        {

        }

        public int id { get;  set; }
        public string nombre { get;  set; }
        public string name_from { get;  set; }
        public long inicio_lanzamiento { get;  set; }
        public long fin_lanzamiento { get;  set; }
        public int mail_enviados { get;  set; }
        public int mail_open_rate { get;  set; }
        public int mail_rebotados { get; set; }
        public int activos { get; set; }
        public int inactivos { get;  set; }
        public int idAccion { get; set; }
    }
}