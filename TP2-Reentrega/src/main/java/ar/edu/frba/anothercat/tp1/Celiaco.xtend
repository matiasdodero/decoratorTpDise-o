package ar.edu.frba.anothercat.tp1

import ar.edu.frba.anothercat.tp2.UsuarioPosta

class Celiaco implements CondicionPreexistente {
	override cumpleValidacion(UsuarioPosta unUsuario){
		return true
	}

	override subsanasteCondicionesPreEx(UsuarioPosta unUsuario){
		return true
	}

	override esInadecuadaPara(Receta unaReceta){
		return false
	}
}