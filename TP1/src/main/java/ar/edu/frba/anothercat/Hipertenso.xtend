package ar.edu.frba.anothercat

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Hipertenso implements CondicionPreexistente {

	override cumpleValidacion(Usuario unUsuario) {
		return (unUsuario.getPreferencias.size >= 1 )
	}

	override subsanasteCondicionesPreEx(Usuario usuario) {
		return (usuario.rutinaE.equals(tipoRutina.INTENSIVO) )

	}

	override esInadecuadaPara(Receta unaReceta) {

		if (unaReceta.ingredientes.contains("sal") || unaReceta.ingredientes.contains("caldo")) {
			return true
		} else {
			false
		}

	}
}
