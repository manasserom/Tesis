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
    public class InversionController : Controller
    {
        private Tesis_Inv2Entities1 db = new Tesis_Inv2Entities1();

        // GET: Inversion
        public async Task<ActionResult> Index()
        {
            var inversion = db.Inversion.Include(i => i.Criptomoneda1).Include(i => i.Instrumento1).Include(i => i.NuevaTenencia);
            return View(await inversion.ToListAsync());
        }

        // GET: Inversion/Details/5
        public async Task<ActionResult> Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Inversion inversion = await db.Inversion.FindAsync(id);
            if (inversion == null)
            {
                return HttpNotFound();
            }
            return View(inversion);
        }

        // GET: Inversion/Create
        public ActionResult Create()
        {
            ViewBag.Criptomoneda = new SelectList(db.vwCriptosDWB, "Nombre", "Ticker");
            ViewBag.CriptomonedaGanada = new SelectList(db.Criptomoneda, "Nombre", "Ticker");
            ViewBag.Instrumento = new SelectList(db.Instrumento, "Nombre", "Nombre");
            ViewBag.Lugar = new SelectList(db.vwTenencia, "idTenencia", "Lugar");
            return View();
        }

        // POST: Inversion/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "IdInversion,Lugar,Instrumento,Criptomoneda,CriptomonedaGanada,TasaEstimada,TasaReal,FechaInicio,FechaFin,CantidadInvertida")] Inversion inversion)
        {
            if (ModelState.IsValid)
            {
                db.Inversion.Add(inversion);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            ViewBag.Criptomoneda = new SelectList(db.Criptomoneda, "Nombre", "Ticker", inversion.Criptomoneda);
            ViewBag.CriptomonedaGanada = new SelectList(db.Criptomoneda, "Nombre", "Ticker", inversion.CriptomonedaGanada);
            ViewBag.Instrumento = new SelectList(db.Instrumento, "Nombre", "Nombre", inversion.Instrumento);
            ViewBag.Lugar = new SelectList(db.vwTenencia, "Lugar", "Lugar", inversion.Lugar);
            return View(inversion);
        }

        // GET: Inversion/Edit/5
        public async Task<ActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Inversion inversion = await db.Inversion.FindAsync(id);
            if (inversion == null)
            {
                return HttpNotFound();
            }
            ViewBag.Criptomoneda = new SelectList(db.Criptomoneda, "Nombre", "Ticker", inversion.Criptomoneda);
            ViewBag.Instrumento = new SelectList(db.Instrumento, "Nombre", "Nombre", inversion.Instrumento);
            ViewBag.Lugar = new SelectList(db.vwTenencia, "IdTenencia", "Lugar", inversion.Lugar);
            ViewBag.CriptomonedaGanada = new SelectList(db.Criptomoneda, "Nombre", "Ticker", inversion.CriptomonedaGanada);
            ViewBag.IdTenencia = new SelectList(db.vwTenencia, "IdTenencia", "Lugar", inversion.Lugar);
            return View(inversion);
        }

        // POST: Inversion/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "IdInversion,Lugar,Instrumento,Criptomoneda,CriptomonedaGanada,TasaEstimada,TasaReal,FechaInicio,FechaFin,CantidadInvertida")] Inversion inversion)
        {
            if (ModelState.IsValid)
            {
                db.Entry(inversion).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            ViewBag.Criptomoneda = new SelectList(db.Criptomoneda, "Nombre", "Ticker", inversion.Criptomoneda);
            ViewBag.Instrumento = new SelectList(db.Instrumento, "Nombre", "Nombre", inversion.Instrumento);
            ViewBag.Lugar = new SelectList(db.vwTenencia, "Lugar", "Lugar", inversion.Lugar);
            ViewBag.CriptomonedaGanada = new SelectList(db.Criptomoneda, "Nombre", "Ticker", inversion.CriptomonedaGanada);
            ViewBag.IdTenencia = new SelectList(db.vwTenencia, "IdTenencia", "Lugar", inversion.Lugar);

            return View(inversion);
        }
        // GET: Inversion/Edit/5
        public async Task<ActionResult> Finalizar(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Inversion inversion = await db.Inversion.FindAsync(id);
            if (inversion == null)
            {
                return HttpNotFound();
            }
            ViewBag.Criptomoneda = new SelectList(db.Criptomoneda, "Nombre", "Ticker", inversion.Criptomoneda);
            ViewBag.CriptomonedaGanada = new SelectList(db.Criptomoneda, "Nombre", "Ticker", inversion.CriptomonedaGanada);
            ViewBag.Instrumento = new SelectList(db.Instrumento, "Nombre", "Nombre", inversion.Instrumento);
            ViewBag.Lugar = new SelectList(db.vwTenencia, "Lugar", "Lugar", inversion.Lugar);
            ViewBag.IdTenencia = new SelectList(db.vwTenencia, "IdTenencia", "Lugar", inversion.Lugar);

            return View(inversion);
        }

        // POST: Inversion/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Finalizar([Bind(Include = "IdInversion,Lugar,Instrumento,Criptomoneda,CriptomonedaGanada,TasaEstimada,TasaReal,FechaInicio,FechaFin,CantidadInvertida,CantidadGanada")] Inversion inversion)
        {
            if (ModelState.IsValid)
            {
                db.Entry(inversion).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            ViewBag.Criptomoneda = new SelectList(db.Criptomoneda, "Nombre", "Ticker", inversion.Criptomoneda);
            ViewBag.Instrumento = new SelectList(db.Instrumento, "Nombre", "Nombre", inversion.Instrumento);
            ViewBag.Lugar = new SelectList(db.vwTenencia, "Lugar", "Lugar", inversion.Lugar);
            return View(inversion);
        }

        // GET: Inversion/Delete/5
        public async Task<ActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Inversion inversion = await db.Inversion.FindAsync(id);
            if (inversion == null)
            {
                return HttpNotFound();
            }
            return View(inversion);
        }

        // POST: Inversion/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            Inversion inversion = await db.Inversion.FindAsync(id);
            db.Inversion.Remove(inversion);
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
