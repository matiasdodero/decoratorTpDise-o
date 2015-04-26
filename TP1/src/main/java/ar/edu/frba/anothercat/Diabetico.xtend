package ar.edu.frba.anothercat

class Diabetico implements CondicionPreexistente {

	override dameCondicion(Usuario unUsuario) {
		return (unUsuario.getSexo() != null && unUsuario.getPreferencias.size >= 1 )
	}

	override subsanasteCondicionesPreEx(Usuario usuario) {
		return ((usuario.rutina == "INTENSIVO" || usuario.rutina == "NO TAN INTENSIVO") || usuario.peso < 70)

	}

	override esInadecuadaPara(Receta unaReceta) {
		if (unaReceta.condimentos.contains("azucar") &&
			(unaReceta.condimentos.fold(0, [acum, condimento|acum + condimento.getCantidad]) > 100)) {
			true
		} else {
			false
		}
	}
}
