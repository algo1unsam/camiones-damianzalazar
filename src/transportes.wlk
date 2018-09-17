import almacenes.*
import mercaderias.*
import rutas.*

object camion {
	var property contenido = [bumblebee,knightRider]
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
	method puedeCargar(mercaderia) = (pesoMax > self.peso() + mercaderia.peso())
	method masPeligro() = contenido.max { mercaderia => mercaderia.nivelPeligro() }
	method puedeCircular(ruta) = !(contenido.any { mercaderia => (mercaderia.nivelPeligro() > ruta.limitePeligro()) })
}
