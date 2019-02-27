using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de Class1
/// </summary>
namespace Model.Entities
{
    public class Suscripto
    {
        public Suscripto()
        {
        }
        public int cod_cliente { get; set; }
        public string estado { get; set; }
    }
}