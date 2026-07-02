namespace SitemaVentas.BLL.Servicios.Contrato
{
    using SistemaVentas.DTO;

    public interface IDashBoardService
    {
        Task<DashBoardDTO> Resumen();
    }
}
