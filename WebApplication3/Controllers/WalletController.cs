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
    public class WalletController : Controller
    {
        private Tesis_Inv2Entities1 db = new Tesis_Inv2Entities1();

        // GET: Wallet
        public async Task<ActionResult> Index()
        {
            var wallet = db.Wallet.Include(w => w.TipoDeWallet);
            return View(await wallet.ToListAsync());
        }

        // GET: Wallet/Details/5
        public async Task<ActionResult> Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Wallet wallet = await db.Wallet.FindAsync(id);
            if (wallet == null)
            {
                return HttpNotFound();
            }
            return View(wallet);
        }

        // GET: Wallet/Create
        public ActionResult Create()
        {
            ViewBag.Tipo = new SelectList(db.TipoDeWallet, "TipoWallet", "TipoWallet");
            return View();
        }

        // POST: Wallet/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "Nombre,Tipo,Semilla")] Wallet wallet)
        {
            if (ModelState.IsValid)
            {
                //Agregar a la tenencia
                int TenenciaId = db.NuevaTenencia.Count() + 1;
                NuevaTenencia nuevaTenencia = new NuevaTenencia
                {
                    idTenencia = TenenciaId,
                    Wallet = wallet.Nombre
                };
                db.NuevaTenencia.Add(nuevaTenencia);
                db.Wallet.Add(wallet);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            ViewBag.Tipo = new SelectList(db.TipoDeWallet, "TipoWallet", "TipoWallet", wallet.Tipo);
            return View(wallet);
        }

        // GET: Wallet/Edit/5
        public async Task<ActionResult> Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Wallet wallet = await db.Wallet.FindAsync(id);
            if (wallet == null)
            {
                return HttpNotFound();
            }
            ViewBag.Tipo = new SelectList(db.TipoDeWallet, "TipoWallet", "TipoWallet", wallet.Tipo);
            return View(wallet);
        }

        // POST: Wallet/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "Nombre,Tipo,Semilla")] Wallet wallet)
        {
            if (ModelState.IsValid)
            {
                db.Entry(wallet).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            ViewBag.Tipo = new SelectList(db.TipoDeWallet, "TipoWallet", "TipoWallet", wallet.Tipo);
            return View(wallet);
        }

        // GET: Wallet/Delete/5
        public async Task<ActionResult> Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Wallet wallet = await db.Wallet.FindAsync(id);
            if (wallet == null)
            {
                return HttpNotFound();
            }
            return View(wallet);
        }

        // POST: Wallet/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(string id)
        {
            Wallet wallet = await db.Wallet.FindAsync(id);
            db.Wallet.Remove(wallet);
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
