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
    public class TipoCriptomonedaController : Controller
    {
        private Tesis_Inv2Entities1 db = new Tesis_Inv2Entities1();

        // GET: TipoCriptomoneda
        public async Task<ActionResult> Index()
        {
            return View(await db.TipoCriptomoneda.ToListAsync());
        }

        // GET: TipoCriptomoneda/Details/5
        public async Task<ActionResult> Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TipoCriptomoneda tipoCriptomoneda = await db.TipoCriptomoneda.FindAsync(id);
            if (tipoCriptomoneda == null)
            {
                return HttpNotFound();
            }
            return View(tipoCriptomoneda);
        }

        // GET: TipoCriptomoneda/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: TipoCriptomoneda/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "Nombre")] TipoCriptomoneda tipoCriptomoneda)
        {
            if (ModelState.IsValid)
            {
                db.TipoCriptomoneda.Add(tipoCriptomoneda);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            return View(tipoCriptomoneda);
        }

        // GET: TipoCriptomoneda/Edit/5
        public async Task<ActionResult> Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TipoCriptomoneda tipoCriptomoneda = await db.TipoCriptomoneda.FindAsync(id);
            if (tipoCriptomoneda == null)
            {
                return HttpNotFound();
            }
            return View(tipoCriptomoneda);
        }

        // POST: TipoCriptomoneda/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "Nombre")] TipoCriptomoneda tipoCriptomoneda)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tipoCriptomoneda).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            return View(tipoCriptomoneda);
        }

        // GET: TipoCriptomoneda/Delete/5
        public async Task<ActionResult> Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TipoCriptomoneda tipoCriptomoneda = await db.TipoCriptomoneda.FindAsync(id);
            if (tipoCriptomoneda == null)
            {
                return HttpNotFound();
            }
            return View(tipoCriptomoneda);
        }

        // POST: TipoCriptomoneda/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(string id)
        {
            TipoCriptomoneda tipoCriptomoneda = await db.TipoCriptomoneda.FindAsync(id);
            db.TipoCriptomoneda.Remove(tipoCriptomoneda);
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
