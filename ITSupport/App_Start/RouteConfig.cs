using System.Web.Mvc;
using System.Web.Routing;

namespace ITSupport
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional },
                //Thêm hàng sau để tránh xung đột giữa các controller Home
                namespaces: new[] { "ITSupport.Controllers" }
            );
            routes.MapRoute(
                name: "Course",
                url: "khoa_hoc",
                defaults: new { controller = "Course", action = "Index", id = UrlParameter.Optional },
                namespaces: new[] { "ITSupport.Controllers" }
                );
            routes.MapRoute(
                name: "Admin",
                url: "admin_page",
                defaults: new { controller = "Admin", action = "Index", id = UrlParameter.Optional },
                namespaces: new[] { "ITSupport.Controllers" }
                );
            routes.MapRoute(
                name: "Excel",
                url: "Course/Excel",
                defaults: new { controller = "Course", action = "Excel" },
                namespaces: new[] { "ITSupport.Controllers" }
                );


        }
    }
}
