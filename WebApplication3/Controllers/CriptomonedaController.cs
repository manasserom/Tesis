using System;
using System.Collections.Generic;
using System.Collections;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WebApplication3.Models;
using System.Net.Http;
using System.Net.Http.Headers;
using System.IO;
using System.Web.Script.Serialization;
using Newtonsoft.Json.Linq;

namespace WebApplication3.Controllers
{
    public class AuxCriptomoneda
    {
        public int DeptId { get; set; }
        public string id { get; set; }
        public string symbol { get; set; }
        public string name { get; set; }
        public string image { get; set; }
        public double current_price { get; set; }
        public double market_cap { get; set; }
        public int market_cap_rank { get; set; }
        public double fully_diluted_valuation { get; set; }
        public double total_volume { get; set; }
        public double total_volumehigh_24h { get; set; }
        public double low_24h { get; set; }
        public double low_24hprice_change_24h { get; set; }
        public double price_change_percentage_24h { get; set; }
        public double market_cap_change_24h { get; set; }
        public double market_cap_change_percentage_24h { get; set; }
        public double circulating_supply { get; set; }
        public double total_supply { get; set; }
        public double max_supply { get; set; }
        public double ath { get; set; }
        public double ath_change_percentage { get; set; }
        public string ath_date { get; set; }
        public double atl { get; set; }
        public double atl_change_percentage { get; set; }
        public string atl_date { get; set; }
        public string roi { get; set; }
        public string last_updated { get; set; }
    }
    public class CriptomonedaController : Controller
    {
        private int CantidadCriptomonedas = 200;//Variable utilizada para la actualización de precios
        private Tesis_Inv2Entities1 db = new Tesis_Inv2Entities1();

        // GET: Criptomoneda
        public async Task<ActionResult> Index()
        {
            var criptomoneda = db.Criptomoneda.Include(c => c.TipoCriptomoneda);
            return View(await criptomoneda.ToListAsync());
        }

        // GET: Criptomoneda/Details/5
        public async Task<ActionResult> Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Criptomoneda criptomoneda = await db.Criptomoneda.FindAsync(id);
            if (criptomoneda == null)
            {
                return HttpNotFound();
            }
            return View(criptomoneda);
        }

        // GET: Criptomoneda/Create
        public ActionResult Create()
        {
            ViewBag.Tipo = new SelectList(db.TipoCriptomoneda, "Nombre", "Nombre");
            return View();
        }

        // POST: Criptomoneda/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "Nombre,Ticker,Precio,Tipo,Logo,Capitalizacion")] Criptomoneda criptomoneda)
        {
            if (ModelState.IsValid)
            {
                db.Criptomoneda.Add(criptomoneda);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            ViewBag.Tipo = new SelectList(db.TipoCriptomoneda, "Nombre", "Nombre", criptomoneda.Tipo);
            return View(criptomoneda);
        }

        // GET: Criptomoneda/Edit/5
        public async Task<ActionResult> Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Criptomoneda criptomoneda = await db.Criptomoneda.FindAsync(id);
            if (criptomoneda == null)
            {
                return HttpNotFound();
            }
            ViewBag.Tipo = new SelectList(db.TipoCriptomoneda, "Nombre", "Nombre", criptomoneda.Tipo);
            return View(criptomoneda);
        }

        // POST: Criptomoneda/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "Nombre,Ticker,Precio,Tipo,Logo,Capitalizacion")] Criptomoneda criptomoneda)
        {
            double aux = criptomoneda.Precio / 3;
            if (ModelState.IsValid)
            {
                db.Entry(criptomoneda).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            ViewBag.Tipo = new SelectList(db.TipoCriptomoneda, "Nombre", "Nombre", criptomoneda.Tipo);
            return View(criptomoneda);
        }

        // GET: Criptomoneda/Delete/5
        public async Task<ActionResult> Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Criptomoneda criptomoneda = await db.Criptomoneda.FindAsync(id);
            if (criptomoneda == null)
            {
                return HttpNotFound();
            }
            return View(criptomoneda);
        }

        // POST: Criptomoneda/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(string id)
        {
            Criptomoneda criptomoneda = await db.Criptomoneda.FindAsync(id);
            db.Criptomoneda.Remove(criptomoneda);
            await db.SaveChangesAsync();
            return RedirectToAction("Index");
        }
        public async Task<ActionResult> ActualizarCriptos()
        {
            string ApiUrl = $"https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page="+CantidadCriptomonedas+"&page=1&sparkline=false";
            var url = ApiUrl;// $"http://localhost:8080/items";
            var request = (HttpWebRequest)WebRequest.Create(url);
            request.Method = "GET";
            request.ContentType = "application/json";
            request.Accept = "application/json";
            try
            {
                using (WebResponse response = request.GetResponse())
                {
                    using (Stream strReader = response.GetResponseStream())
                    {
                        if (strReader == null) return View();
                        using (StreamReader objReader = new StreamReader(strReader))
                        {
                            string responseBody = objReader.ReadToEnd();
                            Console.WriteLine(responseBody);
                            JavaScriptSerializer js = new JavaScriptSerializer();
                            CriptoJSON[] persons = js.Deserialize<CriptoJSON[]>(responseBody);
                            foreach (CriptoJSON d in persons)
                            {
                                Console.WriteLine(d.symbol);
                                ActualizarCriptoDatos(d.symbol, d.name, d.current_price, d.market_cap);
                            }
                        }
                    }
                }
            }
            catch (WebException ex)
            {
                // Handle error
            }
            return View();
        }
        public void ActualizarCriptoDatos(string Ticker, string Nombre, double Precio, double Capitalizacion)
        {
            string auxT = Ticker;
            string auxN = Nombre;
            double auxP = Precio;
            double auxC = Capitalizacion;
            try
            {
                Criptomoneda criptomoneda = db.Criptomoneda.Find(auxN);
                if (criptomoneda != null)
                {
                    criptomoneda.Capitalizacion = auxC;
                    criptomoneda.Precio = auxP;
                    db.Entry(criptomoneda).State = EntityState.Modified;
                    db.SaveChanges();
                }
                else
                {
                    Criptomoneda nuevaCriptomoneda = new Criptomoneda
                    {
                        Nombre = auxN,
                        Ticker = auxT,
                        Precio = auxP,
                        Capitalizacion = auxC,
                        Tipo = "Volátil"
                    };
                    db.Criptomoneda.Add(nuevaCriptomoneda);
                    db.SaveChanges();
                }

            }
            catch { }
        }
        // Root myDeserializedClass = JsonConvert.DeserializeObject<List<Root>>(myJsonResponse);
        public class Roi
        {
            public double times { get; set; }
            public string currency { get; set; }
            public double percentage { get; set; }
        }

        public class CriptoJSON
        {
            public string id { get; set; }
            public string symbol { get; set; }
            public string name { get; set; }
            public string image { get; set; }
            public double current_price { get; set; }
            public double market_cap { get; set; }
            public int market_cap_rank { get; set; }
            public long? fully_diluted_valuation { get; set; }
            public object total_volume { get; set; }
            public double high_24h { get; set; }
            public double low_24h { get; set; }
            public double price_change_24h { get; set; }
            public double price_change_percentage_24h { get; set; }
            public double market_cap_change_24h { get; set; }
            public double market_cap_change_percentage_24h { get; set; }
            public double circulating_supply { get; set; }
            public double? total_supply { get; set; }
            public double? max_supply { get; set; }
            public double ath { get; set; }
            public double ath_change_percentage { get; set; }
            public DateTime ath_date { get; set; }
            public double atl { get; set; }
            public double atl_change_percentage { get; set; }
            public DateTime atl_date { get; set; }
            public Roi roi { get; set; }
            public DateTime last_updated { get; set; }
        }

        ////https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false
        ////https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=10&page=1&sparkline=false
        //static readonly HttpClient client = new HttpClient();
        ////Criptomoneda/Actualizar
        //public void Actualizar(string Ticker, string Nombre, double Precio, double Capitalizacion)
        //{
        //    string auxT = Ticker;
        //    string auxN = Nombre;
        //    double auxP = Precio;
        //    double auxC = Capitalizacion;
        //    try
        //    {
        //        //Criptomoneda criptomoneda = await db.Criptomoneda.FindAsync(id);
        //        Criptomoneda criptomoneda = db.Criptomoneda.Find(auxN);
        //        if(criptomoneda != null)
        //        {
        //            criptomoneda.Capitalizacion = auxC;
        //            criptomoneda.Precio = auxP;
        //            db.Entry(criptomoneda).State = EntityState.Modified;
        //            db.SaveChanges();
        //        }
                
        //    }
        //    catch { }
        //}
        //public async Task<ActionResult> GetProductAsync()
        //{
        //    string ApiUrl = $"https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=" + CantidadCriptomonedas + "&page=1&sparkline=false";
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
        //                    AuxCriptomoneda[] persons = js.Deserialize<AuxCriptomoneda[]>(responseBody);
        //                    foreach(AuxCriptomoneda d in persons)
        //                    {
        //                        Actualizar(d.symbol, d.name, d.current_price, d.market_cap);
        //                    }
        //                }
        //            }
        //        }
        //    }
        //    catch (WebException ex)
        //    {
        //        // Handle error
        //    }
        


        //    //var response = await client.GetAsync(ApiUrl);

        //    //var content = await response.Content.ReadAsStringAsync();
        //    //var result = JArray.Parse(content);
        //    //var serializer = new JavaScriptSerializer();
        //    //string jsonArray = Convert.ToString(result);

        //    //IList<AuxCriptomoneda> deptList = Newtonsoft.Json.JsonConvert.DeserializeObject<IList<AuxCriptomoneda>>(content);
        //    //foreach(AuxCriptomoneda d in deptList)
        //    //{
        //    //    Actualizar(d.symbol,d.name,d.current_price,d.market_cap);
        //    //}

        //    ////string jsonArray = @"{'DeptId': '101', 'DepartmentName': 'IT'}";
        //    //string jsonArray = @"https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=10&page=1&sparkline=false";
        //    //var serializer = new JavaScriptSerializer();
        //    ////IList<AuxCriptomoneda> deptList = serializer.Deserialize<IList<AuxCriptomoneda>>(jsonArray);

        //    //foreach (var dept in deptList)
        //    //{
        //    //    Console.WriteLine("Department Id is: {0}", dept.symbol);
        //    //    Console.WriteLine("Department Name is: {0}", dept.current_price);
        //    //}

        //    //var url = $"https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false";
        //    //var request = (HttpWebRequest)WebRequest.Create(url);
        //    //request.Method = "GET";
        //    //request.ContentType = "application/json";
        //    //request.Accept = "application/json";
        //    //try
        //    //{
        //    //    using (WebResponse response = request.GetResponse())
        //    //    {
        //    //        using (Stream strReader = response.GetResponseStream())
        //    //        {
        //    //            //if (strReader == null) return;
        //    //            using (StreamReader objReader = new StreamReader(strReader))
        //    //            {
        //    //                string responseBody = objReader.ReadToEnd();
        //    //                // Do something with responseBody
        //    //                Console.WriteLine(responseBody);
        //    //                string aux = responseBody;
        //    //                string jsonArray = aux;
        //    //                var serializer = new JavaScriptSerializer();
        //    //                IList<AuxCriptomoneda> deptList = serializer.Deserialize<IList<AuxCriptomoneda>>(jsonArray);

        //    //                foreach (AuxCriptomoneda d in deptList)
        //    //                {
        //    //                    Actualizar(d.symbol, d.name, d.current_price, d.market_cap);
        //    //                    //Console.WriteLine("Department Id is: {0}", dept.symbol);
        //    //                    //Console.WriteLine("Department Name is: {0}", dept.current_price);
        //    //                }
        //    //            }
        //    //        }
        //    //    }
        //    //}
        //    //catch (WebException ex)
        //    //{
        //    //    // Handle error
        //    //}


        //    return View();
        //}

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
