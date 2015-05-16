package ar.edu.frba.anothercat.usuario

import ar.edu.frba.anothercat.receta.Receta

class Diabetico implements CondicionPreexistente {

	override cumpleValidacion(UsuarioPosta unUsuario) {
		return (unUsuario.getSexo() != null && unUsuario.getPreferencias.size >= 1 )
	}

	override subsanasteCondicionesPreEx(UsuarioPosta usuario) {
//		return ((usuario.rutina == "INTENSIVO" || usuario.rutina == "NO TAN INTENSIVO") || usuario.peso < 70)
		return ((usuario.rutinaE.equals(tipoRutina.INTENSIVO)  || usuario.rutinaE.equals(tipoRutina.PREINTENSIVO)) || usuario.peso < 70)
	}

	override esInadecuadaPara(Receta unaReceta) {
		return (unaReceta.tenesAzucar() &&
			(unaReceta.azucarTotal() > 100)) 
	}
}