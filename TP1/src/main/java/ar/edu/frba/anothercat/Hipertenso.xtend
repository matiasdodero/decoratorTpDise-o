package ar.edu.frba.anothercat

import java.util.Collection

class Hipertenso extends CondicionPreexistente {
	
	var Collection<String> ingredientesNoPermitidos
	
	def void cargarIngredientes(){	
	ingredientesNoPermitidos.add("sal")
	ingredientesNoPermitidos.add("caldo")
		}
	
	override dameCondicion(Usuario unUsuario){
		if ( unUsuario.preferencias.size < 1) {
			return false
		}	
	}
	override subsanasteCondicionesPreEx(Usuario usuario){
		if(usuario.rutina != "INTENSIVO" ){
			return false
		}
		
	}
}
