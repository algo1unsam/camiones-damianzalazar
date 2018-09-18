import almacenes.*
import mercaderias.*
import rutas.*

object camion {
	var property contenido = []
	var property pesoMax = 1400
	var property acum = 0
	
	method cargar(mercaderia) { 
		if(self.puedeCargar(mercaderia)){
		contenido.add(mercaderia)
		acum += 1
		}
		else
		error.throwWithMessage("Limite de peso del camion superado: " + acum + " procesados con exito.")
	}
	method descargar(mercaderia) { contenido.remove(mercaderia) }
	method tieneCargado(mercaderia) = contenido.any(mercaderia)
	method peso() = contenido.sum { mercaderia => mercaderia.peso() }
	method cargaDisponible() = pesoMax - self.peso()
	method puedeCargar(mercaderia) = (pesoMax >= self.peso() + mercaderia.peso())
	method masPeligro() = contenido.max { mercaderia => mercaderia.nivelPeligro() }
	method puedeCircular(ruta) = !(contenido.any { mercaderia => (mercaderia.nivelPeligro() > ruta.limitePeligro()) })
}

object motoneta{
	var property contenido = []
	var property pesoMax = 100
	//var property acum = 0
	
	method cargar(mercaderia) { 
		if(self.puedeCargar(mercaderia)){
		contenido.add(mercaderia)
		//acum += 1
		}
		else
		error.throwWithMessage("No se pudo completar el proceso.")
		//error.throwWithMessage("No se pudo completar el proceso. " + acum + " procesados con exito.")
	}
	method peso() = contenido.sum { mercaderia => mercaderia.peso() }
	method puedeCargar(mercaderia) = self.compruebaPeso(mercaderia) && self.compruebaPeligro(mercaderia)
	method compruebaPeso(mercaderia) = (pesoMax >= self.peso() + mercaderia.peso())
	method compruebaPeligro(mercaderia) = (5 >= mercaderia.nivelPeligro())
}