package ar.edu.frba.anothercat

class Celiaco implements CondicionPreexistente {
	override cumpleValidacion(Usuario unUsuario){
		return true
	}

	override subsanasteCondicionesPreEx(Usuario unUsuario){
		return true
	}

	override esInadecuadaPara(Receta unaReceta){
		return false
	}
}