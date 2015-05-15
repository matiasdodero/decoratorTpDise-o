package ar.edu.frba.anothercat.tp1

import ar.edu.frba.anothercat.tp2.UsuarioPosta

class Vegano implements CondicionPreexistente {

	override cumpleValidacion(UsuarioPosta unUsuario) {
		if (unUsuario.getPreferencias.exists[unaPre|
			unaPre.dameNombre() == "pollo" || unaPre.dameNombre() == "carne" ||
				unaPre.dameNombre() == "chivito" || unaPre.dameNombre() == "chori"]) {
			return false
		} else {
			return true
		}
	}

	override subsanasteCondicionesPreEx(UsuarioPosta usuario) {
		return (usuario.preferencias.exists[unaPre|unaPre.dameTipo() == "fruta"] )
	}

	/*override esInadecuadaPara(Receta unaReceta) {
		return (unaReceta.ingredientes.exists[unI | unI.dameNombre() == "carne"] || 
			unaReceta.ingredientes.exists[unI | unI.dameNombre() == "pollo"] ||
			unaReceta.ingredientes.exists[unI | unI.dameNombre() == "chori"]|| 
			unaReceta.ingredientes.exists[unI | unI.dameNombre() == "chivito"]) 
	}*/
	
	override esInadecuadaPara(Receta unaReceta) {
		return (unaReceta.tenesPolloCarneChivitoChori()) 
	}

}