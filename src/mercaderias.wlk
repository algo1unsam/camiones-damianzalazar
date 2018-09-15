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
	var property cantidad = 0
	method peso() = 2 * cantidad
	method nivelPeligro() = 2
}

//********** CARACTERISTICAS BUMBLEBEE **********//

object auto {
	method nivelPeligro() = 15
}

object robot {
	method nivelPeligro() = 30
}