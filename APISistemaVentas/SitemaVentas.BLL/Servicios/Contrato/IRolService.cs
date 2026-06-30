namespace SitemaVentas.BLL.Servicios.Contrato
{
    using SistemaVentas.DTO;

    public interface IRolService
    {
        Task<List<RolDTO>> Lista();
    }
}
