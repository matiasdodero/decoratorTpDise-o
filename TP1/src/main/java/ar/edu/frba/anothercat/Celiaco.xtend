package ar.edu.frba.anothercat

class Celiaco implements CondicionPreexistente {
	override cumpleValidacion(Usuario unUsuario){
		true
	}

	override subsanasteCondicionesPreEx(Usuario unUsuario){
		true
	}

	override esInadecuadaPara(Receta unaReceta){
		true
	}
}