using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de FromSended
/// </summary>
namespace Model.Entities
{
    public class FromSended
    {
        public string fecha { get; set; }
        public long timestamp { get; set; }
        public int envio { get; set; }
        public int rebotados { get; set; }
        public int abiertos { get; set; }
        public int activos { get; set; }
        public int inactivos{ get; set; }
    }
}
