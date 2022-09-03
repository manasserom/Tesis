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
    }
}
