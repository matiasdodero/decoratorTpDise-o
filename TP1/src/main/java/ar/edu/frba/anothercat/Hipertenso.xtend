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

	/*override esInadecuadaPara(Receta unaReceta) {

		return (unaReceta.condimentos.exists[unC | unC.getNombreCondimento == "sal"] || 
			unaReceta.condimentos.exists[unC | unC.getNombreCondimento == "caldo"]
		) 

	}*/
	
	override esInadecuadaPara(Receta unaReceta) {

		return (unaReceta.tenesSal() || 
			unaReceta.tenesCaldo()) 

	}
}
