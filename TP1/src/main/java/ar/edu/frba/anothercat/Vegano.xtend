package ar.edu.frba.anothercat

class Vegano implements CondicionPreexistente {

	override cumpleValidacion(Usuario unUsuario) {
		if (unUsuario.getPreferencias.exists[unaPre|
			unaPre.dameNombre() == "pollo" || unaPre.dameNombre() == "carne" ||
				unaPre.dameNombre() == "chivito" || unaPre.dameNombre() == "chori"]) {
			return false
		} else {
			return true
		}
	}

	override subsanasteCondicionesPreEx(Usuario usuario) {
		return (usuario.preferencias.exists[unaPre|unaPre.dameTipo() == "fruta"] )
	}

	override esInadecuadaPara(Receta unaReceta) {
		if (unaReceta.ingredientes.contains("carne") || unaReceta.ingredientes.contains("pollo") ||
			unaReceta.ingredientes.contains("chori") || unaReceta.ingredientes.contains("chivito")) {
			true
		} else {
			false
		}

	}

}
