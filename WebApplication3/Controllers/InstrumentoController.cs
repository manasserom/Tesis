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
    public class InstrumentoController : Controller
    {
        private Tesis_Inv2Entities1 db = new Tesis_Inv2Entities1();

        // GET: Instrumento
        public async Task<ActionResult> Index()
        {
            return View(await db.Instrumento.ToListAsync());
        }

        // GET: Instrumento/Details/5
        public async Task<ActionResult> Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Instrumento instrumento = await db.Instrumento.FindAsync(id);
            if (instrumento == null)
            {
                return HttpNotFound();
            }
            return View(instrumento);
        }

        // GET: Instrumento/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Instrumento/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "Nombre,Bloqueado,InteresFijo,PagoDeInteres")] Instrumento instrumento)
        {
            if (ModelState.IsValid)
            {
                db.Instrumento.Add(instrumento);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            return View(instrumento);
        }

        // GET: Instrumento/Edit/5
        public async Task<ActionResult> Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Instrumento instrumento = await db.Instrumento.FindAsync(id);
            if (instrumento == null)
            {
                return HttpNotFound();
            }
            return View(instrumento);
        }

        // POST: Instrumento/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "Nombre,Bloqueado,InteresFijo,PagoDeInteres")] Instrumento instrumento)
        {
            if (ModelState.IsValid)
            {
                db.Entry(instrumento).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            return View(instrumento);
        }

        // GET: Instrumento/Delete/5
        public async Task<ActionResult> Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Instrumento instrumento = await db.Instrumento.FindAsync(id);
            if (instrumento == null)
            {
                return HttpNotFound();
            }
            return View(instrumento);
        }

        // POST: Instrumento/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(string id)
        {
            Instrumento instrumento = await db.Instrumento.FindAsync(id);
            db.Instrumento.Remove(instrumento);
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
