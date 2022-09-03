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
using System.Web.Script.Serialization;
using System.IO;

namespace WebApplication3.Controllers
{
    public class vwTenenciasController : Controller
    {
        private Tesis_Inv2Entities1 db = new Tesis_Inv2Entities1();

        // GET: vwTenencias
        public async Task<ActionResult> Index()
        {
            return View(await db.vwInformeTenencia.ToListAsync());
        }

        // GET: vwTenencias/Details/5
        public async Task<ActionResult> Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            vwTenencia vwTenencia = await db.vwTenencia.FindAsync(id);
            if (vwTenencia == null)
            {
                return HttpNotFound();
            }
            return View(vwTenencia);
        }

        // GET: vwTenencias/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: vwTenencias/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "idTenencia,Wallet,Tipo,Semilla,Exchange,Nacional,Centralizado,Url")] vwTenencia vwTenencia)
        {
            if (ModelState.IsValid)
            {
                db.vwTenencia.Add(vwTenencia);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            return View(vwTenencia);
        }

        // GET: vwTenencias/Edit/5
        public async Task<ActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            vwTenencia vwTenencia = await db.vwTenencia.FindAsync(id);
            if (vwTenencia == null)
            {
                return HttpNotFound();
            }
            return View(vwTenencia);
        }

        // POST: vwTenencias/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "idTenencia,Wallet,Tipo,Semilla,Exchange,Nacional,Centralizado,Url")] vwTenencia vwTenencia)
        {
            if (ModelState.IsValid)
            {
                db.Entry(vwTenencia).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            return View(vwTenencia);
        }

        // GET: vwTenencias/Delete/5
        public async Task<ActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            vwTenencia vwTenencia = await db.vwTenencia.FindAsync(id);
            if (vwTenencia == null)
            {
                return HttpNotFound();
            }
            return View(vwTenencia);
        }

        // POST: vwTenencias/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            vwTenencia vwTenencia = await db.vwTenencia.FindAsync(id);
            db.vwTenencia.Remove(vwTenencia);
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
        //public async Task<ActionResult> ActualizarCriptos()
        //{
        //    string ApiUrl = $"https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page="+100+"&page=1&sparkline=false";
        //    var url = ApiUrl;// $"http://localhost:8080/items";
        //    var request = (HttpWebRequest)WebRequest.Create(url);
        //    request.Method = "GET";
        //    request.ContentType = "application/json";
        //    request.Accept = "application/json";
        //    try
        //    {
        //        using (WebResponse response = request.GetResponse())
        //        {
        //            using (Stream strReader = response.GetResponseStream())
        //            {
        //                if (strReader == null) return View();
        //                using (StreamReader objReader = new StreamReader(strReader))
        //                {
        //                    string responseBody = objReader.ReadToEnd();
        //                    // Do something with responseBody
        //                    Console.WriteLine(responseBody);
        //                    JavaScriptSerializer js = new JavaScriptSerializer();
        //                    CriptoJSON[] persons = js.Deserialize<CriptoJSON[]>(responseBody);
        //                    foreach (CriptoJSON d in persons)
        //                    {
        //                        Console.WriteLine(d.symbol);
        //                        ActualizarCriptoDatos(d.symbol, d.name, d.current_price, d.market_cap);
        //                    }
        //                }
        //            }
        //        }
        //    }
        //    catch (WebException ex)
        //    {
        //        // Handle error
        //    }
        //    //JavaScriptSerializer JsonConvert = new JavaScriptSerializer();

        //    //CriptoJSON myDeserializedClass = JsonConvert.DeserializeObject<List<CriptoJSON>>(CriptoJSON);
        //    return View();
        //}
        //public void ActualizarCriptoDatos(string Ticker, string Nombre, double Precio, double Capitalizacion)
        //{
        //    string auxT = Ticker;
        //    string auxN = Nombre;
        //    double auxP = Precio;
        //    double auxC = Capitalizacion;
        //    try
        //    {
        //        //Criptomoneda criptomoneda = await db.Criptomoneda.FindAsync(id);
        //        Criptomoneda criptomoneda = db.Criptomoneda.Find(auxN);
        //        if (criptomoneda != null)
        //        {
        //            criptomoneda.Capitalizacion = auxC;
        //            criptomoneda.Precio = auxP;
        //            db.Entry(criptomoneda).State = EntityState.Modified;
        //            db.SaveChanges();
        //        }

        //    }
        //    catch { }
        //}
        //// Root myDeserializedClass = JsonConvert.DeserializeObject<List<Root>>(myJsonResponse);
        //public class Roi
        //{
        //    public double times { get; set; }
        //    public string currency { get; set; }
        //    public double percentage { get; set; }
        //}

        //public class CriptoJSON
        //{
        //    public string id { get; set; }
        //    public string symbol { get; set; }
        //    public string name { get; set; }
        //    public string image { get; set; }
        //    public double current_price { get; set; }
        //    public double market_cap { get; set; }
        //    public int market_cap_rank { get; set; }
        //    public long? fully_diluted_valuation { get; set; }
        //    public object total_volume { get; set; }
        //    public double high_24h { get; set; }
        //    public double low_24h { get; set; }
        //    public double price_change_24h { get; set; }
        //    public double price_change_percentage_24h { get; set; }
        //    public double market_cap_change_24h { get; set; }
        //    public double market_cap_change_percentage_24h { get; set; }
        //    public double circulating_supply { get; set; }
        //    public double? total_supply { get; set; }
        //    public double? max_supply { get; set; }
        //    public double ath { get; set; }
        //    public double ath_change_percentage { get; set; }
        //    public DateTime ath_date { get; set; }
        //    public double atl { get; set; }
        //    public double atl_change_percentage { get; set; }
        //    public DateTime atl_date { get; set; }
        //    public Roi roi { get; set; }
        //    public DateTime last_updated { get; set; }
        //}

    }
}
