import mercaderias.*
import transportes.*

object deposito {
	var property contenido = []
//	method recibeMercaderia_s(mercaderia_s){}
	
	method recibe(mercaderia) { contenido.add(mercaderia) }
	method recibeMultiple(mercaderias) { contenido.addAll(mercaderias) }
	method llenarCamion() {
		contenido.forEach{ mercaderia => camion.cargar(mercaderia) }
		contenido.removeAll(contenido)
	}
	
}
