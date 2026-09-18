namespace SistemaVentas.API.Utilidad
{
    //Con '<T>' volvemos la clase generecia ya que eso indica q podremos recibir cualquier objeto
    public class Response<T>
    {
        public bool status { get; set; }
        public T value { get; set; } //Aqui devolvemos el objeto q estamos recibiendo
        public string msg { get; set; }
    }
}
