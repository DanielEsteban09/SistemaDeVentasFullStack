namespace SitemaVentas.BLL.Servicios.Contrato
{
    using SistemaVentas.DTO;

    public interface IMenuService
    {
        Task<List<MenuDTO>> Lista(int idUsuario);
    }
}
