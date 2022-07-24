using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace CSBCA.Pages.admin
{
    public class adminRD : PageModel
    {
        public IActionResult OnGet()
        {
            ISession session = HttpContext.Session;

            session.SetString("ses_plang", "en");

            return RedirectToPage("/admin/admin"); 
        }
    }
}
