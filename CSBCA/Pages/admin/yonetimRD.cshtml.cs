using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace CSBCA.Pages.admin
{
    public class yonetimRD : PageModel
    {
        public IActionResult OnGet()
        {
            ISession session = HttpContext.Session;

            session.SetString("ses_plang", "tr");

            return RedirectToPage("/admin/yonetim");
        }
    }
}
