//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WebApplication3.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class vwInversionesEsteAnio
    {
        public int IdInversion { get; set; }
        public string Lugar1 { get; set; }
        public string Instrumento { get; set; }
        public string Criptomoneda { get; set; }
        public string CriptomonedaGanada { get; set; }
        public double TasaEstimada { get; set; }
        public double TasaReal { get; set; }
        public System.DateTime FechaInicio { get; set; }
        public Nullable<System.DateTime> FechaFin { get; set; }
        public double CantidadInvertida { get; set; }
        public Nullable<double> CantidadGanada { get; set; }
        public Nullable<int> Lugar { get; set; }
    }
}
