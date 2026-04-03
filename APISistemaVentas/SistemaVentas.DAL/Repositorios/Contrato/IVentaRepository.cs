namespace SistemaVentas.DAL.Repositorios.Contrato
{
    using SistemaVentas.Model;

    public interface IVentaRepository : IGenericRepository<Venta>
    {
        Task<Venta> Registrar(Venta modelo);
    }
}
