import mercaderias.*
import transportes.*

object deposito {
	var property contenido = [knightRider,bumblebee]	
	
	method recibe(mercaderia) { contenido.add(mercaderia) }
	method recibeMultiple(mercaderias) { contenido.addAll(mercaderias) }
	method cargarCamion() {
		camion.acum(0)
		contenido.forEach { mercaderia => camion.cargar(mercaderia)
						   contenido.remove(mercaderia)
		}
	}
	
}
