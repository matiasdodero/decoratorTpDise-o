package ar.edu.frba.anothercat

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

//El celíaco está mas solo pobre...