package ar.edu.frba.anothercat

class Diabetico implements CondicionPreexistente {

	override cumpleValidacion(Usuario unUsuario) {
		return (unUsuario.getSexo() != null && unUsuario.getPreferencias.size >= 1 )
	}

	override subsanasteCondicionesPreEx(Usuario usuario) {
//		return ((usuario.rutina == "INTENSIVO" || usuario.rutina == "NO TAN INTENSIVO") || usuario.peso < 70)
		return ((usuario.rutinaE.equals(tipoRutina.INTENSIVO)  || usuario.rutinaE.equals(tipoRutina.PREINTENSIVO)) || usuario.peso < 70)
	}

	override esInadecuadaPara(Receta unaReceta) {
		return (unaReceta.condimentos.exists[unC | unC.getNombre == "azucar"] &&
			(unaReceta.condimentos.fold(0, [acum, condimento|acum + condimento.getCantidad]) > 100)) 
	}
}
