import almacenes.*
import mercaderias.*
import rutas.*

object camion {
	var property contenido = []
	var property pesoMax = 1400	

	method cargar(mercaderia) { 
		if (self.superaPeso(mercaderia))
		//error.throwWithMessage("Limite de peso del camion superado: " + contenido.size() + " procesados con exito.")
		error.throwWithMessage("Limite de peso del camion superado")
		contenido.add(mercaderia)	
	}
	method descargar(mercaderia) = contenido.remove(mercaderia)
	method tieneCargado(mercaderia) = contenido.any { x => x == mercaderia}
	method peso() = contenido.sum { mercaderia => mercaderia.peso() }
	method cargaDisponible() = pesoMax - self.peso()
	method superaPeso(mercaderia) = (self.peso() + mercaderia.peso() > pesoMax)
	method maxPeligro() = (contenido.max { mercaderia => mercaderia.nivelPeligro() }).nivelPeligro()
	method puedeCircular(ruta) = (self.maxPeligro() < ruta.limitePeligro())
}

object motoneta{
	var property contenido = []
	var property pesoMax = 100
	
	method cargar(mercaderia) { 
		if (self.superaPeso(mercaderia) && (self.superaPeligro(mercaderia))
			error.throwWithMessage("No se pudo completar el proceso. Limite de peso y peligrosidad superado")
		if (self.superaPeso(mercaderia))
			error.throwWithMessage("No se pudo completar el proceso. Limite de peso superado")
		if (self.superaPeligro(mercaderia))
			error.throwWithMessage("No se pudo completar el proceso. Limite de peligro superada")
		contenido.add(mercaderia)
	}
	method peso() = contenido.sum { mercaderia => mercaderia.peso() }
	method superaPeso(mercaderia) = (self.peso() + mercaderia.peso() > pesoMax )
	method superaPeligro(mercaderia) = (mercaderia.nivelPeligro() > 5)
}