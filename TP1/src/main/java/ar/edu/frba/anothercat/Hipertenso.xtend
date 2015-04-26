package ar.edu.frba.anothercat

import java.util.Collection
import java.util.List

class Hipertenso extends CondicionPreexistente {
	
	var Collection<String> ingredientesNoPermitidos
	
	def void cargarIngredientes(){	
	ingredientesNoPermitidos.add("sal")
	ingredientesNoPermitidos.add("caldo")
		}
	
	override dameCondicion(Usuario unUsuario){
		return (unUsuario.getPreferencias.size >= 1 ) 
		}		

	override subsanasteCondicionesPreEx(Usuario usuario){
		return (usuario.rutina == "INTENSIVO" )
		
	}
}
