import transportes.*
import almacenes.*
import rutas.*

object knightRider {
	method peso() = 500
	method nivelPeligro() = 10	
}

object bumblebee {
	var property estado = auto
	method peso() = 800
	method nivelPeligro() = estado.nivelPeligro()
}

object ladrillos {
	var property cantidad = 1
	method peso() = 2 * cantidad
	method nivelPeligro() = 2
}

object contenedor {
	var property contenido = [knightRider]
	
	method recibe(mercaderia) { contenido.add(mercaderia) }
	method peso() = if (contenido.isEmpty()) 100 else 100 + contenido.sum { mercaderia => mercaderia.peso() }
	
	method nivelPeligro() {
		if(contenido.isEmpty()) 
			return 0 
		else 
			return (contenido.max { mercaderia => mercaderia.nivelPeligro() }).nivelPeligro()
	}

	
}
object embalaje {
	var property contenido
	
	method embalo(mercaderia) { contenido = mercaderia }
	method peso() =  contenido.peso()
	method nivelPeligro() = contenido.nivelPeligro() / 2
}

//********** CARACTERISTICAS BUMBLEBEE **********//

object auto {
	method nivelPeligro() = 15
}

object robot {
	method nivelPeligro() = 30
}