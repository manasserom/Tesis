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
    
    public partial class Criptomoneda
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Criptomoneda()
        {
            this.Inversion = new HashSet<Inversion>();
            this.InversionTemporal = new HashSet<InversionTemporal>();
        }
    
        public string Nombre { get; set; }
        public string Ticker { get; set; }
        public double Precio { get; set; }
        public string Tipo { get; set; }
        public byte[] Logo { get; set; }
        public Nullable<double> Capitalizacion { get; set; }
    
        public virtual TipoCriptomoneda TipoCriptomoneda { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Inversion> Inversion { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<InversionTemporal> InversionTemporal { get; set; }
    }
}
