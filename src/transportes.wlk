import almacenes.*
import mercaderias.*

object camion {
	var property contenido = [bumblebee]
	var property pesoMax = 1200
	
	method cargar(mercaderia) { contenido.add(mercaderia) }
	method descargar(mercaderia) { contenido.remove(mercaderia) }
	method tieneCargado(mercaderia) = contenido.any(mercaderia)
	method peso() = contenido.sum { mercaderia => mercaderia.peso() }
	method cargaDisponible() = pesoMax - self.peso() //MEJORAR y poner alerta para el caso en que peso del camion > pesoMax
	method puedeCargar(mercaderia) = (pesoMax > (self.peso() + mercaderia.peso()))
}
