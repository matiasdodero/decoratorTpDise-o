package ar.edu.frba.anothercat.usuario

import ar.edu.frba.anothercat.receta.Receta

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