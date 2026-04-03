namespace SistemaVentas.IOC
{
    using Microsoft.EntityFrameworkCore;
    using Microsoft.Extensions.Configuration;
    using Microsoft.Extensions.DependencyInjection;
    using SistemaVentas.DAL.DBContext;
    using SistemaVentas.DAL.Repositorios.Contrato;
    using SistemaVentas.DAL.Repositorios;

    public static class Dependencia
    {
        public static void InyectarDependencias(this IServiceCollection services, IConfiguration configuration)
        {
            services.AddDbContext<DbventaContext>(options =>
            {
                options.UseSqlServer(configuration.GetConnectionString("CadenaSQL"));
            });

            services.AddTransient(typeof(IGenericRepository<>),typeof(GenericRepository<>));
            services.AddScoped<IVentaRepository,VentaRepository>();
        }
    }
}