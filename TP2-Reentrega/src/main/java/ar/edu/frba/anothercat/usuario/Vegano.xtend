package ar.edu.frba.anothercat.usuario

import ar.edu.frba.anothercat.receta.Receta

class Vegano implements CondicionPreexistente {

	override cumpleValidacion(UsuarioPosta unUsuario) {
		if (unUsuario.ingredientesPreferidos.exists[unIngrediente|
			unIngrediente.dameNombre() == "pollo" || unIngrediente.dameNombre() == "carne" ||
			unIngrediente.dameNombre() == "chivito" || unIngrediente.dameNombre() == "chori"]) {
			return false
		} else {
			return true
		}
	}

	override subsanasteCondicionesPreEx(UsuarioPosta usuario) {
		return (usuario.ingredientesPreferidos.exists[unIngrediente|unIngrediente.dameTipo() == "fruta"] )
	}

	override esInadecuadaPara(Receta unaReceta) {
		return (unaReceta.tenesPolloCarneChivitoChori()) 
	}

}