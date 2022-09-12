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
    public class HomeController : Controller
    {
        private Tesis_Inv2Entities1 db = new Tesis_Inv2Entities1();

        public ActionResult Index()
        {
            return RedirectToAction("DashBoard");
        }

        public ActionResult DashBoard()
        {
            //Capital segun el tipo
            string ListaCapData = "";
            string ListaCapCate = "";
            IEnumerable<capital_tipocripto_Resumen> CapTip = db.capital_tipocripto_Resumen.ToList();
            foreach(capital_tipocripto_Resumen capital in CapTip)
            {
                ListaCapCate = ListaCapCate + capital.Tipo + ",";
                ListaCapData = ListaCapData + (int)capital.CapitalTotal + ",";
            }
            ListaCapCate = ListaCapCate.Substring(0, ListaCapCate.Length - 1);
            ListaCapData = ListaCapData.Substring(0, ListaCapData.Length - 1);
            ViewBag.CapTipData = ListaCapData;
            ViewBag.CapTipCate = ListaCapCate;

            //Capital segun la cripto
            string ListaCripData = "";
            string ListaCripCate = "";
            IEnumerable<Capital_Cripto_Resumen> CapCrip = db.Capital_Cripto_Resumen.OrderBy(t => t.CapitalTotal).ToList();
            foreach(Capital_Cripto_Resumen capital in CapCrip)
            {
                ListaCripData = ListaCripData + capital.Ticker.ToUpper() + ",";
                ListaCripCate = ListaCripCate +  (int)(capital.CapitalTotal.Value) + ",";
            }
            ListaCripData = ListaCripData.Substring(0, ListaCripData.Length - 1);
            ListaCripCate = ListaCripCate.Substring(0, ListaCripCate.Length - 1);
            ViewBag.ListaCripData = ListaCripData;
            ViewBag.ListaCripCate = ListaCripCate;
            //Capital segun el Lugar
            string ListaLugarData = "";
            string ListaLugarCate = "";
            IEnumerable<vwCapital_LugarSeparado> CapLugar = db.vwCapital_LugarSeparado.OrderBy(t => t.Capital).ToList();            
            foreach(vwCapital_LugarSeparado capital in CapLugar)
            {
                ListaLugarData = ListaLugarData + capital.Lugar + ",";
                ListaLugarCate = ListaLugarCate +  (int)(capital.Capital) + ",";
            }
            ListaLugarData = ListaLugarData.Substring(0, ListaLugarData.Length - 1);
            ListaLugarCate = ListaLugarCate.Substring(0, ListaLugarCate.Length - 1);
            ViewBag.ListaLugarData = ListaLugarData;
            ViewBag.ListaLugarCate = ListaLugarCate;

            //Capital Dísponible
            double Bloqueado = 0;
            double Disponible = 0; 
            string ListaBloq = "";
            string ListaDisp = "";

            IEnumerable<Inversion_Cripto_Instru> Disponibilidad = db.Inversion_Cripto_Instru.ToList();
            foreach (Inversion_Cripto_Instru disp in Disponibilidad)
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
            IEnumerable<vwInversion_tenencia> Centralizacion = db.vwInversion_tenencia.ToList();
            foreach (vwInversion_tenencia cent in Centralizacion)
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
            Bloqueado = Bloqueado*100/Total;
            Centralizado = Centralizado* 100/(Centralizado+DesCentralizado);
            //ListaBloq = Bloqueado + "," + Disponibilidad;
            ViewBag.ListaBloq = Bloqueado;  //Bloqueado actualizado a porcentaje
            ViewBag.ListaDisp = Centralizado; //Cambiar por Centralizacion, la disponibilidad ya esta en la parte de Bloqueado

            //Fechas Vencimientos e Inicio
            string ListaVencimientosdDia = "";
            string ListaVencimientosdMes = "";
            string ListaVencimientosdAnio = "";
            IEnumerable<vwInversionesEsteAnio> Vencimientos = db.vwInversionesEsteAnio.ToList();
            foreach (vwInversionesEsteAnio inv in Vencimientos)
            {
                string aux = inv.FechaFin.HasValue ? inv.FechaFin.Value.Day.ToString(): "";
                string aux2 = inv.FechaFin.HasValue ? inv.FechaFin.Value.Month.ToString(): "";
                string aux3 = inv.FechaFin.HasValue ? inv.FechaFin.Value.Year.ToString(): "";
                if(aux != "")
                {
                    ListaVencimientosdDia = ListaVencimientosdDia + aux + ",";
                    ListaVencimientosdMes = ListaVencimientosdMes + aux2 + ",";
                    ListaVencimientosdAnio = ListaVencimientosdAnio + aux3 + ",";
                }
            }
            ListaVencimientosdDia = ListaVencimientosdDia.Substring(0, ListaVencimientosdDia.Length - 1);
            ListaVencimientosdMes = ListaVencimientosdMes.Substring(0, ListaVencimientosdMes.Length - 1);
            ListaVencimientosdAnio = ListaVencimientosdAnio.Substring(0, ListaVencimientosdAnio.Length - 1);
            ViewBag.ListaVencimientosdDia = ListaVencimientosdDia;
            ViewBag.ListaVencimientosdMes = ListaVencimientosdMes;
            ViewBag.ListaVencimientosdAnio = ListaVencimientosdAnio;

            //Tabla - Top de criptomonedas
            string ListaTCripto = "";
            string ListaTCapital = "";
            string ListaTTipo= "";
            IEnumerable<vwInversionesTop> InversionesT = db.vwInversionesTop.ToList();
            foreach (vwInversionesTop invT in InversionesT)
            {
                ListaTCripto = ListaTCripto + invT.Criptomoneda + ",";
                ListaTCapital = ListaTCapital + invT.Capital + ",";
                ListaTTipo = ListaTTipo + invT.Tipo + ",";
            }
            ListaTCripto = ListaTCripto.Substring(0, ListaTCripto.Length - 1);
            ListaTCapital = ListaTCapital.Substring(0, ListaTCapital.Length - 1);
            ListaTTipo = ListaTTipo.Substring(0, ListaTTipo.Length - 1);
            ViewBag.ListaTCripto = ListaTCripto;
            ViewBag.ListaTCapital = ListaTCapital;
            ViewBag.ListaTTipo = ListaTTipo;
            ////Evolucion del capital invertido
            //string ListaAnios = "";
            //string ListaCapital = "";
            //string ListaCategorias= "";
            ////ListaCapCate capital_tipocripto_Resumen
            //IEnumerable<EvolucionInversionesTipoCripto> InversionesEv = db.EvolucionInversionesTipoCripto.ToList();
            //foreach (EvolucionInversionesTipoCripto invT in InversionesEv)
            //{
            //    foreach(capital_tipocripto_Resumen cat in db.capital_tipocripto_Resumen.ToList())
            //    {
            //        if(cat.Tipo == invT.Tipo)
            //        {
                        
            //        }
            //    }   
            //    //ListaTCripto = ListaTCripto + invT.Criptomoneda + ",";
            //    //ListaTCapital = ListaTCapital + invT.Capital + ",";
            //    //ListaTTipo = ListaTTipo + invT.Tipo + ",";
            //}
            //ListaTCripto = ListaTCripto.Substring(0, ListaTCripto.Length - 1);
            //ListaTCapital = ListaTCapital.Substring(0, ListaTCapital.Length - 1);
            //ListaTTipo = ListaTTipo.Substring(0, ListaTTipo.Length - 1);
            //ViewBag.ListaTCripto = ListaTCripto;
            //ViewBag.ListaTCapital = ListaTCapital;
            //ViewBag.ListaTTipo = ListaTTipo;
            ////Evolucion del capital invertido
            

            return View();
        }
        public ActionResult DashboardDetalle()
        {
            //Capital segun el tipo
            IEnumerable<capital_tipocripto_Resumen> CapTip = db.capital_tipocripto_Resumen.ToList();
            ViewBag.capital_tipocripto_Resumen = CapTip;

            //Capital segun la cripto
            IEnumerable<Capital_Cripto_Resumen> CapCrip = db.Capital_Cripto_Resumen.OrderBy(t => t.CapitalTotal).ToList();
            ViewBag.Capital_Cripto_Resumen = CapCrip;
            //Capital segun el Lugar
            IEnumerable<vwCapital_LugarSeparado> CapLugar = db.vwCapital_LugarSeparado.OrderBy(t => t.Capital).ToList();
            //var CapLugar2 = from p in CapLugar group p by p.Lugar into g select new {Lugar}
            var CapLugar2 = CapLugar.GroupBy(row => row.Lugar).Select(row => new
            {
                Capital = row.Sum(x => x.Capital),
                Lugar = row.Key
            });
            List<vwCapital_LugarSeparado> auxList = new List<vwCapital_LugarSeparado>();
            vwCapital_LugarSeparado auxI = new vwCapital_LugarSeparado();
            List<vwCapital_LugarSeparado> auxList2 = new List<vwCapital_LugarSeparado>();
            foreach (var capital in CapLugar2)
            {
                auxI.Lugar = capital.Lugar;
                auxI.Capital = capital.Capital;
                auxI.IdInversion= (int)capital.Capital;
                auxList.Add(auxI);
                auxList2.Add(auxI);
            }
            //auxList2 = auxList;
            ViewBag.vwCapital_LugarSeparado = CapLugar2.ToList();

            //Capital Dísponible
            double Bloqueado = 0;
            double Disponible = 0; 
            string ListaBloq = "";
            string ListaDisp = "";

            IEnumerable<Inversion_Cripto_Instru> Disponibilidad = db.Inversion_Cripto_Instru.ToList();
            foreach (Inversion_Cripto_Instru disp in Disponibilidad)
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
            IEnumerable<vwInversion_tenencia> Centralizacion = db.vwInversion_tenencia.ToList();
            foreach (vwInversion_tenencia cent in Centralizacion)
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
            Bloqueado = Bloqueado*100/Total;
            Centralizado = Centralizado* 100/(Centralizado+DesCentralizado);
            //ListaBloq = Bloqueado + "," + Disponibilidad;
            ViewBag.ListaBloq = Bloqueado;  //Bloqueado actualizado a porcentaje
            ViewBag.ListaDisp = Centralizado; //Cambiar por Centralizacion, la disponibilidad ya esta en la parte de Bloqueado

            //Fechas Vencimientos e Inicio
            string ListaVencimientosdDia = "";
            string ListaVencimientosdMes = "";
            string ListaVencimientosdAnio = "";
            IEnumerable<vwInversionesEsteAnio> Vencimientos = db.vwInversionesEsteAnio.ToList();
            foreach (vwInversionesEsteAnio inv in Vencimientos)
            {
                string aux = inv.FechaFin.HasValue ? inv.FechaFin.Value.Day.ToString(): "";
                string aux2 = inv.FechaFin.HasValue ? inv.FechaFin.Value.Month.ToString(): "";
                string aux3 = inv.FechaFin.HasValue ? inv.FechaFin.Value.Year.ToString(): "";
                if(aux != "")
                {
                    ListaVencimientosdDia = ListaVencimientosdDia + aux + ",";
                    ListaVencimientosdMes = ListaVencimientosdMes + aux2 + ",";
                    ListaVencimientosdAnio = ListaVencimientosdAnio + aux3 + ",";
                }
            }
            ListaVencimientosdDia = ListaVencimientosdDia.Substring(0, ListaVencimientosdDia.Length - 1);
            ListaVencimientosdMes = ListaVencimientosdMes.Substring(0, ListaVencimientosdMes.Length - 1);
            ListaVencimientosdAnio = ListaVencimientosdAnio.Substring(0, ListaVencimientosdAnio.Length - 1);
            ViewBag.ListaVencimientosdDia = ListaVencimientosdDia;
            ViewBag.ListaVencimientosdMes = ListaVencimientosdMes;
            ViewBag.ListaVencimientosdAnio = ListaVencimientosdAnio;

            //Tabla - Top de criptomonedas
            string ListaTCripto = "";
            string ListaTCapital = "";
            string ListaTTipo= "";
            IEnumerable<vwInversionesTop> InversionesT = db.vwInversionesTop.ToList();
            foreach (vwInversionesTop invT in InversionesT)
            {
                ListaTCripto = ListaTCripto + invT.Criptomoneda + ",";
                ListaTCapital = ListaTCapital + invT.Capital + ",";
                ListaTTipo = ListaTTipo + invT.Tipo + ",";
            }
            ListaTCripto = ListaTCripto.Substring(0, ListaTCripto.Length - 1);
            ListaTCapital = ListaTCapital.Substring(0, ListaTCapital.Length - 1);
            ListaTTipo = ListaTTipo.Substring(0, ListaTTipo.Length - 1);
            ViewBag.ListaTCripto = ListaTCripto;
            ViewBag.ListaTCapital = ListaTCapital;
            ViewBag.ListaTTipo = ListaTTipo;
            ////Evolucion del capital invertido
            //string ListaAnios = "";
            //string ListaCapital = "";
            //string ListaCategorias= "";
            ////ListaCapCate capital_tipocripto_Resumen
            //IEnumerable<EvolucionInversionesTipoCripto> InversionesEv = db.EvolucionInversionesTipoCripto.ToList();
            //foreach (EvolucionInversionesTipoCripto invT in InversionesEv)
            //{
            //    foreach(capital_tipocripto_Resumen cat in db.capital_tipocripto_Resumen.ToList())
            //    {
            //        if(cat.Tipo == invT.Tipo)
            //        {
                        
            //        }
            //    }   
            //    //ListaTCripto = ListaTCripto + invT.Criptomoneda + ",";
            //    //ListaTCapital = ListaTCapital + invT.Capital + ",";
            //    //ListaTTipo = ListaTTipo + invT.Tipo + ",";
            //}
            //ListaTCripto = ListaTCripto.Substring(0, ListaTCripto.Length - 1);
            //ListaTCapital = ListaTCapital.Substring(0, ListaTCapital.Length - 1);
            //ListaTTipo = ListaTTipo.Substring(0, ListaTTipo.Length - 1);
            //ViewBag.ListaTCripto = ListaTCripto;
            //ViewBag.ListaTCapital = ListaTCapital;
            //ViewBag.ListaTTipo = ListaTTipo;
            ////Evolucion del capital invertido
            

            return View();
        }
        public ActionResult DashBoard_Treemap()
        {
            IEnumerable<vwCapital_TipoCriptoAgrupadas> Total = db.vwCapital_TipoCriptoAgrupadas.ToList();
            IEnumerable<Capital_Cripto_Resumen> CapCrip = db.Capital_Cripto_Resumen.ToList();
            string ListaTicker = "";
            string ListaTipo = "";
            string ListaParent = "";
            string ListaColor = "";
            Random rnd = new Random();
            int color = 0;
            foreach (vwCapital_TipoCriptoAgrupadas capital in Total)
            {
                ListaTicker = ListaTicker + capital.Ticker + ",";
                ListaTipo = ListaTipo + capital.Tipo + ",";
                ListaParent = ListaParent + Convert.ToInt64(capital.Capital) + ",";
                color = rnd.Next(1, 100);
                ListaColor = ListaColor + color + ",";
            }
            //foreach(TipoCriptomoneda tipo in db.TipoCriptomoneda.ToList()){
            //    ListaTipo = ListaTipo + tipo.Nombre + ",";
            //}
            //ListaColor = "1,5,10,30";
            ListaTicker = ListaTicker.Substring(0, ListaTicker.Length - 1);
            ListaTipo = ListaTipo.Substring(0, ListaTipo.Length - 1);
            ListaParent = ListaParent.Substring(0, ListaParent.Length - 1);
            ListaColor = ListaColor.Substring(0, ListaColor.Length - 1);
            ViewBag.ListaTicker = ListaTicker;
            ViewBag.ListaTipo = ListaTipo;
            ViewBag.ListaParent = ListaParent;
            ViewBag.ListaColor = ListaColor;


            //double total = db.vwCapital_TipoCriptoSeparadas..Where(t => t.Ticker == "");

            return View(Total);
        }
        public ActionResult WhatIf()
        {
            ViewBag.Message = "Your contact page.";
            //Capital segun el tipo
            string ListaCapData = "";
            string ListaCapCate = "";
            IEnumerable<capital_tipocripto_Resumen> CapTip = db.capital_tipocripto_Resumen.ToList();
            foreach (capital_tipocripto_Resumen capital in CapTip)
            {
                ListaCapCate = ListaCapCate + capital.Tipo + ",";
                ListaCapData = ListaCapData + (int) capital.CapitalTotal + ",";
            }
            ListaCapCate = ListaCapCate.Substring(0, ListaCapCate.Length - 1);
            ListaCapData = ListaCapData.Substring(0, ListaCapData.Length - 1);
            ViewBag.CapTipData = ListaCapData;
            ViewBag.CapTipCate = ListaCapCate;

            //Capital segun la cripto
            string ListaCripData = "";
            string ListaCripCate = "";
            IEnumerable<Capital_Cripto_Resumen> CapCrip = db.Capital_Cripto_Resumen.OrderBy(t => t.CapitalTotal).ToList();
            foreach (Capital_Cripto_Resumen capital in CapCrip)
            {
                ListaCripData = ListaCripData + capital.Ticker + ",";
                ListaCripCate = ListaCripCate + (int)(capital.CapitalTotal.Value) + ",";
            }
            ListaCripData = ListaCripData.Substring(0, ListaCripData.Length - 1);
            ListaCripCate = ListaCripCate.Substring(0, ListaCripCate.Length - 1);
            ViewBag.ListaCripData = ListaCripData;
            ViewBag.ListaCripCate = ListaCripCate;

            return View();
        }
    }
}