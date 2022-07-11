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
    public class ExchangeController : Controller
    {
        private Tesis_Inv2Entities1 db = new Tesis_Inv2Entities1();

        // GET: Exchange
        public async Task<ActionResult> Index()
        {
            return View(await db.Exchange.ToListAsync());
        }

        // GET: Exchange/Details/5
        public async Task<ActionResult> Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Exchange exchange = await db.Exchange.FindAsync(id);
            if (exchange == null)
            {
                return HttpNotFound();
            }
            return View(exchange);
        }

        // GET: Exchange/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Exchange/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "Nombre,Nacional,Centralizado,Url")] Exchange exchange)
        {
            if (ModelState.IsValid)
            {
                //Agregar a la tenencia
                int TenenciaId = db.NuevaTenencia.Count() + 1;
                NuevaTenencia nuevaTenencia = new NuevaTenencia
                {
                    idTenencia = TenenciaId,
                    Exchange = exchange.Nombre
                };
                db.NuevaTenencia.Add(nuevaTenencia);
                //exchange.Centralizado = exchange.Centralizado == null?
                db.Exchange.Add(exchange);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            return View(exchange);
        }

        // GET: Exchange/Edit/5
        public async Task<ActionResult> Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Exchange exchange = await db.Exchange.FindAsync(id);
            if (exchange == null)
            {
                return HttpNotFound();
            }
            return View(exchange);
        }

        // POST: Exchange/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "Nombre,Nacional,Centralizado,Url")] Exchange exchange)
        {
            if (ModelState.IsValid)
            {
                db.Entry(exchange).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            return View(exchange);
        }

        // GET: Exchange/Delete/5
        public async Task<ActionResult> Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Exchange exchange = await db.Exchange.FindAsync(id);
            if (exchange == null)
            {
                return HttpNotFound();
            }
            return View(exchange);
        }

        // POST: Exchange/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(string id)
        {
            Exchange exchange = await db.Exchange.FindAsync(id);
            db.Exchange.Remove(exchange);
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
    }
}
