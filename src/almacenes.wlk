import mercaderias.*
import transportes.*
import rutas.*

object deposito {
	var property contenido = []	
	
	method recibe(mercaderia) { contenido.add(mercaderia) }
	method recibeMultiple(mercaderias) { contenido.addAll(mercaderias) }
	method cargarTransporte(transporte) {
		contenido.forEach { mercaderia => transporte.cargar(mercaderia)
							contenido.remove(mercaderia)
		}
	}
}
