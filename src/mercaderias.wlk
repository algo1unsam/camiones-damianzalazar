import transportes.*
import almacenes.*

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
	var property contenido = []
	
	method recibe(mercaderia) { contenido.add(mercaderia) }
	method peso() = 100 + contenido.sum { mercaderia => mercaderia.peso() }
	method nivelPeligro() = contenido.max { mercaderia => mercaderia.nivelPeligro() }
}

object embalaje {
	var property contenido = []
	
	method recibe(mercaderia) { contenido.add(mercaderia) }
	method peso() = contenido.sum { mercaderia => mercaderia.peso() }
	method nivelPeligro() = (contenido.max { mercaderia => mercaderia.nivelPeligro() }) / 2
}

//********** CARACTERISTICAS BUMBLEBEE **********//

object auto {
	method nivelPeligro() = 15
}

object robot {
	method nivelPeligro() = 30
}