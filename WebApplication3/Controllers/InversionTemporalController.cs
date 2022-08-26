using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WebApplication3.Models;

namespace WebApplication3.Controllers
{
    public class InversionTemporalController : Controller
    {
        private Tesis_Inv2Entities1 db = new Tesis_Inv2Entities1();

        // GET: InversionTemporal
        public ActionResult Index(string[] TipoCripto, string[] TickerCripto, string[] Lugar)
        {
            IEnumerable<vwInversionesReales_Simuladas> inversionTemporal = db.vwInversionesReales_Simuladas;
            IEnumerable<capital_tipocripto_ResumenWI> CapTip = db.capital_tipocripto_ResumenWI.ToList();
            IEnumerable<Capital_Cripto_ResumenWI> CapCrip = db.Capital_Cripto_ResumenWI.OrderBy(t => t.CapitalTotal).ToList();
            IEnumerable<Inversion_Cripto_InstruWI> Disponibilidad = db.Inversion_Cripto_InstruWI.ToList();
            IEnumerable<vwInversion_tenenciaWI> Centralizacion = db.vwInversion_tenenciaWI.ToList();
            IEnumerable<vwCapital_LugarSeparadoWI> CapLugar = db.vwCapital_LugarSeparadoWI.OrderBy(t => t.Capital).ToList();
            IEnumerable<int> AuxLugar = new List<int>();
            
            //Filtro
            if (TipoCripto != null)
                for (int i = 0; i < TipoCripto.Length-1; i++)
                {
                    if (TipoCripto[i] != "false")
                        {
                            inversionTemporal = inversionTemporal.Where(t => t.Tipo != TipoCripto[i]).ToList();
                            CapTip = CapTip.Where(t => t.Tipo != TipoCripto[i]).ToList();
                            CapCrip = CapCrip.Where(t => t.Tipo != TipoCripto[i]).ToList();
                            Disponibilidad = Disponibilidad.Where(t => t.Tipo != TipoCripto[i]).ToList();
                            Centralizacion = Centralizacion.Where(t => t.Tipo != TipoCripto[i]).ToList();
                            CapLugar = CapLugar.Where(t => t.Tipo != TipoCripto[i]).ToList();

                    }
                }
            foreach (vwCapital_LugarSeparadoWI CapLugarAux in CapLugar.ToArray())
            {
                if (AuxLugar.Count() > 0)
                {
                    if (!AuxLugar.Contains(CapLugarAux.idTenencia) && Lugar != null)
                    {
                        if (Lugar.Contains(CapLugarAux.Lugar))
                            AuxLugar = AuxLugar.Append(CapLugarAux.idTenencia);
                    }
                }
                else { AuxLugar = AuxLugar.Append(CapLugarAux.idTenencia); }
            }
            int j = 0;
            if (Lugar != null)
                for (int i = 0; i < Lugar.Count()-1; i++)
                {
                    if (Lugar[i] != "false")
                    {   if (AuxLugar.Count() != 0 && AuxLugar.Count()>j)
                        {
                            Disponibilidad = Disponibilidad.Where(t => t.Lugar != AuxLugar.ElementAt(j)).ToList();
                            Centralizacion = Centralizacion.Where(t => t.Lugar != AuxLugar.ElementAt(j)).ToList();
                            inversionTemporal = inversionTemporal.Where(t => t.Lugar != AuxLugar.ElementAt(j)).ToList();
                            j++;
                        }
                        CapTip = CapTip.Where(t => t.Lugar != Lugar[i]).ToList();
                        CapCrip = CapCrip.Where(t => t.Lugar!= Lugar[i]).ToList();
                        CapLugar = CapLugar.Where(t=> t.Lugar != Lugar[i]).ToList();
                    }
                }
            j= 0;
            if (TickerCripto != null)
                for (int i = 0; i < TickerCripto.Length-1; i++)
                {
                    if (TickerCripto[i] != "false")
                        {
                            inversionTemporal = inversionTemporal.Where(t => t.Ticker != TickerCripto[i]).ToList();
                            CapTip = CapTip.Where(t => t.Ticker != TickerCripto[i]).ToList();
                            CapCrip = CapCrip.Where(t => t.Ticker != TickerCripto[i]).ToList();
                            Disponibilidad = Disponibilidad.Where(t => t.Ticker != TickerCripto[i]).ToList();
                            Centralizacion = Centralizacion.Where(t => t.Ticker != TickerCripto[i]).ToList();
                            CapLugar = CapLugar.Where(t => t.Ticker != TickerCripto[i]).ToList();

                    }
                }
            //Carga de listados para los filtros
            //Se agrega un alemento auxiliar para parchar el bug "el primer elemento del filtro falla"
            IEnumerable<TipoCriptomoneda> tipoCriptomoneda = db.TipoCriptomoneda.ToList();
            TipoCriptomoneda auxTipo = new TipoCriptomoneda { Nombre = "Aaux" };
            tipoCriptomoneda = tipoCriptomoneda.ToList().Append(auxTipo);           
            ViewBag.FiltroTipo = tipoCriptomoneda.OrderBy(t => t.Nombre).ToList();
            ViewBag.FiltroTipoB = TipoCripto;

            IEnumerable<Capital_Cripto_ResumenWI> Capital_Cripto_ResumenWI = db.Capital_Cripto_ResumenWI.ToList();
            Capital_Cripto_ResumenWI auxCripto = new Capital_Cripto_ResumenWI { Ticker = "Aaux", CapitalTotal= 0, Tipo= "Estable" };
            Capital_Cripto_ResumenWI = Capital_Cripto_ResumenWI.ToList().Append(auxCripto);
            ViewBag.FiltroTicker = Capital_Cripto_ResumenWI.OrderBy(t => t.Ticker).ToList();
            ViewBag.FiltroTickerB = TickerCripto;
            
            IEnumerable<vwTenenciaWI> vwTenenciaWI = db.vwTenenciaWI.OrderBy(t => t.Lugar).ToList();
            vwTenenciaWI auxLugar = new vwTenenciaWI { Lugar = "Aaux" };
            IEnumerable<vwTenenciaWI> vwTenenciasAux = new List<vwTenenciaWI>();
            IEnumerable<string> vwTenAux = new List<string>();
            vwTenAux = vwTenAux.Append(vwTenenciaWI.First().Lugar);
            foreach (vwTenenciaWI a in vwTenenciaWI)
            {
                if (vwTenAux.Count() > 0)
                    if (!vwTenAux.Contains(a.Lugar))
                        vwTenAux = vwTenAux.Append(a.Lugar);

            }
            foreach(string a in vwTenAux)
            {
                vwTenenciasAux = vwTenenciasAux.Append(vwTenenciaWI.Where(t=>t.Lugar == a).First());
            }
                //foreach(vwTenenciaWI a in vwTenenciaWI)
                //{
                //    if (vwTenenciasAux.Count() > 0)
                //    {
                //        foreach (vwTenenciaWI b in vwTenenciasAux)
                //            if (b.Lugar != a.Lugar)
                //                vwTenenciasAux = vwTenenciasAux.Append(a);
                //    }
                //    else
                //        vwTenenciasAux = vwTenenciasAux.Append(a);
                //}
                vwTenenciasAux = vwTenenciasAux.ToList().Append(auxLugar);
            ViewBag.FiltroLugar = vwTenenciasAux;
            ViewBag.FiltroLugarB = Lugar;

            //Capital segun el tipo
            string ListaCapData = "";
            string ListaCapCate = "";
            //IEnumerable<capital_tipocripto_ResumenWI> CapTip = db.capital_tipocripto_ResumenWI.ToList();
            IEnumerable<TipoCriptomoneda> TiposCriptomonedas = db.TipoCriptomoneda.ToList();
            IEnumerable<capital_tipocripto_ResumenWI> CapTipAux = new capital_tipocripto_ResumenWI[4]{
                new capital_tipocripto_ResumenWI()
                    {
                        Tipo = "" + TiposCriptomonedas.ElementAt(0).Nombre,
                        CapitalTotal = 0
                    },
                new capital_tipocripto_ResumenWI()
                    {
                        Tipo = "" + TiposCriptomonedas.ElementAt(1).Nombre,
                        CapitalTotal = 0
                    },
                new capital_tipocripto_ResumenWI()
                    {
                        Tipo = "" + TiposCriptomonedas.ElementAt(2).Nombre,
                        CapitalTotal = 0
                    },
                new capital_tipocripto_ResumenWI()
                    {
                        Tipo = "" + TiposCriptomonedas.ElementAt(3).Nombre,
                        CapitalTotal = 0
                    }
            };
            foreach (capital_tipocripto_ResumenWI capital in CapTip)
                foreach (capital_tipocripto_ResumenWI capitalAux in CapTipAux)
                    if (capital.Tipo == capitalAux.Tipo)
                        capitalAux.CapitalTotal += capital.CapitalTotal;
            foreach (capital_tipocripto_ResumenWI capital in CapTipAux)
            {
                ListaCapCate = ListaCapCate + capital.Tipo + ",";
                ListaCapData = ListaCapData + (int)capital.CapitalTotal + ",";
            }
            ListaCapCate = ListaCapCate.Substring(0, ListaCapCate.Length - 1);
            ListaCapData = ListaCapData.Substring(0, ListaCapData.Length - 1);
            ViewBag.CapTipDataWI = ListaCapData;
            ViewBag.CapTipCateWI = ListaCapCate;

            //Capital segun la cripto
            string ListaCripData = "";
            string ListaCripCate = "";
            //IEnumerable<Capital_Cripto_ResumenWI> CapCrip = db.Capital_Cripto_ResumenWI.OrderBy(t => t.CapitalTotal).ToList();
            foreach (Capital_Cripto_ResumenWI capital in CapCrip)
            {
                ListaCripData = ListaCripData + capital.Ticker.ToUpper() + ",";
                ListaCripCate = ListaCripCate + (int)(capital.CapitalTotal.Value) + ",";
            }
            ListaCripData = ListaCripData.Substring(0, ListaCripData.Length - 1);
            ListaCripCate = ListaCripCate.Substring(0, ListaCripCate.Length - 1);
            ViewBag.ListaCripDataWI = ListaCripData;
            ViewBag.ListaCripCateWI = ListaCripCate;

            //Capital Dísponible
            double Bloqueado = 0;
            double Disponible = 0;
            string ListaBloq = "";
            string ListaDisp = "";

            //IEnumerable<Inversion_Cripto_InstruWI> Disponibilidad = db.Inversion_Cripto_InstruWI.ToList();
            foreach (Inversion_Cripto_InstruWI disp in Disponibilidad)
            {
                if (disp.Bloqueado.Value)
                {
                    Bloqueado += disp.Capital.Value;
                }
                else
                {
                    Disponible += disp.Capital.Value;
                }
            }
            //Capital Disponible o liquido
            double Centralizado = 0;
            double DesCentralizado = 0;
            //IEnumerable<vwInversion_tenenciaWI> Centralizacion = db.vwInversion_tenenciaWI.ToList();
            foreach (vwInversion_tenenciaWI cent in Centralizacion)
            {
                //bool AuxCent = cent.Centralizado.HasValue ? cent.Centralizado.Value : false;
                if ((cent.Wallet is null) || (cent.Centralizado.HasValue ? cent.Centralizado.Value : false))
                {
                    Centralizado += cent.Capital.Value;
                }
                else
                {
                    DesCentralizado += cent.Capital.Value;
                }
            }

            double Total = Bloqueado + Disponible;
            Bloqueado = Bloqueado * 100 / Total;
            Centralizado = Centralizado * 100 / (Centralizado + DesCentralizado);
            //ListaBloq = Bloqueado + "," + Disponibilidad;
            ViewBag.ListaBloq = Bloqueado;  //Bloqueado actualizado a porcentaje
            //ViewBag.ListaDisp = Centralizado; //Cambiar por Centralizacion, la disponibilidad ya esta en la parte de Bloqueado
            //Capital Segun el Lugar
            double Centralizado2 = 0;
            double DesCentralizado2 = 0;
            //IEnumerable<vwInversion_tenenciaWI> Centralizacion = db.vwInversion_tenenciaWI.ToList();
            foreach (vwInversion_tenenciaWI cent in Centralizacion)
            {
                //bool AuxCent = cent.Centralizado.HasValue ? cent.Centralizado.Value : false;
                if ((cent.Wallet is null) || (cent.Centralizado.HasValue ? cent.Centralizado.Value : false))
                {
                    Centralizado += cent.Capital.Value;
                }
                else
                {
                    DesCentralizado += cent.Capital.Value;
                }
            }

            double Total2 = Bloqueado + Disponible;
            Bloqueado = Bloqueado * 100 / Total;
            Centralizado = Centralizado * 100 / (Centralizado + DesCentralizado);
            //ListaBloq = Bloqueado + "," + Disponibilidad;
            //ViewBag.ListaBloq = Bloqueado;  //Bloqueado actualizado a porcentaje
            ViewBag.ListaDisp = Centralizado; //Cambiar por Centralizacion, la disponibilidad ya esta en la parte de Bloqueado
                                              
            //Capital segun el Lugar
            string ListaLugarData = "";
            string ListaLugarCate = "";
            foreach (vwCapital_LugarSeparadoWI capital in CapLugar)
            {
                ListaLugarData = ListaLugarData + capital.Lugar + ",";
                ListaLugarCate = ListaLugarCate + (int)(capital.Capital) + ",";
            }
            ListaLugarData = ListaLugarData.Substring(0, ListaLugarData.Length - 1);
            ListaLugarCate = ListaLugarCate.Substring(0, ListaLugarCate.Length - 1);
            ViewBag.ListaLugarData = ListaLugarData;
            ViewBag.ListaLugarCate = ListaLugarCate;




            return View( db.vwInversionesReales_Simuladas.ToList());
        }

        // GET: InversionTemporal/Details/5
        public async Task<ActionResult> Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            InversionTemporal inversionTemporal = await db.InversionTemporal.FindAsync(id);
            if (inversionTemporal == null)
            {
                return HttpNotFound();
            }
            return View(inversionTemporal);
        }

        // GET: InversionTemporal/Create
        public ActionResult Create()
        {
            ViewBag.Criptomoneda = new SelectList(db.vwCriptosDWB, "Nombre", "Ticker");
            ViewBag.CriptomonedaGanada = new SelectList(db.Criptomoneda, "Nombre", "Ticker");
            ViewBag.Instrumento = new SelectList(db.Instrumento, "Nombre", "Nombre");
            ViewBag.Lugar = new SelectList(db.vwTenencia, "idTenencia", "Lugar");
            return View();
        }

        // POST: InversionTemporal/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "IdInversion,Lugar1,Instrumento,Criptomoneda,CriptomonedaGanada,TasaEstimada,TasaReal,FechaInicio,FechaFin,CantidadInvertida,CantidadGanada,Lugar")] InversionTemporal inversionTemporal)
        {
            if (ModelState.IsValid)
            {
                db.InversionTemporal.Add(inversionTemporal);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            ViewBag.Criptomoneda = new SelectList(db.Criptomoneda, "Nombre", "Ticker", inversionTemporal.Criptomoneda);
            ViewBag.Instrumento = new SelectList(db.Instrumento, "Nombre", "Nombre", inversionTemporal.Instrumento);
            ViewBag.Lugar = new SelectList(db.NuevaTenencia, "idTenencia", "Exchange", inversionTemporal.Lugar);
            return View(inversionTemporal);
        }

        // GET: InversionTemporal/Edit/5
        public async Task<ActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            InversionTemporal inversionTemporal = await db.InversionTemporal.FindAsync(id);
            if (inversionTemporal == null)
            {
                return HttpNotFound();
            }
            ViewBag.Criptomoneda = new SelectList(db.Criptomoneda, "Nombre", "Ticker", inversionTemporal.Criptomoneda);
            ViewBag.Instrumento = new SelectList(db.Instrumento, "Nombre", "Nombre", inversionTemporal.Instrumento);
            ViewBag.Lugar = new SelectList(db.NuevaTenencia, "idTenencia", "Exchange", inversionTemporal.Lugar);
            return View(inversionTemporal);
        }

        // POST: InversionTemporal/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "IdInversion,Lugar1,Instrumento,Criptomoneda,CriptomonedaGanada,TasaEstimada,TasaReal,FechaInicio,FechaFin,CantidadInvertida,CantidadGanada,Lugar")] InversionTemporal inversionTemporal)
        {
            if (ModelState.IsValid)
            {
                db.Entry(inversionTemporal).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            ViewBag.Criptomoneda = new SelectList(db.Criptomoneda, "Nombre", "Ticker", inversionTemporal.Criptomoneda);
            ViewBag.Instrumento = new SelectList(db.Instrumento, "Nombre", "Nombre", inversionTemporal.Instrumento);
            ViewBag.Lugar = new SelectList(db.NuevaTenencia, "idTenencia", "Exchange", inversionTemporal.Lugar);
            return View(inversionTemporal);
        }

        // GET: InversionTemporal/Delete/5
        public async Task<ActionResult> Delete(int? id)
        {
            InversionTemporal inversionTemporal = db.InversionTemporal.Find(id);
            db.InversionTemporal.Remove(inversionTemporal);
            db.SaveChanges();
            return RedirectToAction("Index");

            //if (id == null)
            //{
            //    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            //}
            //InversionTemporal inversionTemporal = await db.InversionTemporal.FindAsync(id);
            //if (inversionTemporal == null)
            //{
            //    return HttpNotFound();
            //}
            //return View(inversionTemporal);
        }

        // POST: InversionTemporal/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            InversionTemporal inversionTemporal = await db.InversionTemporal.FindAsync(id);
            db.InversionTemporal.Remove(inversionTemporal);
            await db.SaveChangesAsync();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
        public ActionResult ResetFiltros()
        {
            string []Aux = { "false"};
            //return RedirectToAction("Index", new { TipoCripto = Aux,  TickerCripto = Aux });
            return RedirectToAction("Index");
        }
        public ActionResult DeleteSimulacion()
        {
            IEnumerable<InversionTemporal> Temporal = db.InversionTemporal.ToList();
            List<int> ids = new List<int>();
            foreach (InversionTemporal inv in Temporal)
                ids.Add(inv.IdInversion);
            foreach(int id in ids)
            {
                InversionTemporal inversionTemporal = db.InversionTemporal.Find(id);
                db.InversionTemporal.Remove(inversionTemporal);
            }
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult DeleteInvSimulada(int id)
        {
            InversionTemporal inversionTemporal =  db.InversionTemporal.Find(id);
            db.InversionTemporal.Remove(inversionTemporal);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult UseShippingAddress(int id)
        {
            return Content("It worked!");
        }
    }
}
