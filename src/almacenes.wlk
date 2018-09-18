import mercaderias.*
import transportes.*
import rutas.*

object deposito {
	var property contenido = [bumblebee, knightRider]	
	
	method recibe(mercaderia) { contenido.add(mercaderia) }
	method recibeMultiple(mercaderias) { contenido.addAll(mercaderias) }
	method cargarCamion() {
		camion.acum(0)
		contenido.forEach { mercaderia => camion.cargar(mercaderia)
						    contenido.remove(mercaderia)
		}
	}
	method cargarMotoneta() {
		contenido.forEach { mercaderia => motoneta.cargar(mercaderia)
						    contenido.remove(mercaderia)
		}
	}
// COMO HAGO PARA QUE FUNCIONE???
//	method cargarTransporte(transporte) {
//		transporte.acum(0)
//		contenido.forEach { mercaderia => transporte.cargar(mercaderia)
//						    contenido.remove(mercaderia)
//		}
//	}
	method cantidad() = contenido.size()
}
