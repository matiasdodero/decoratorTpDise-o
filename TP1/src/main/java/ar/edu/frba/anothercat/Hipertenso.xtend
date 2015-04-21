package ar.edu.frba.anothercat

import java.util.Collection

class Hipertenso extends Condicion_Preexistente {
	
	var Collection<String> ingredientesNoPermitidos
	
	def void cargarIngredientes(){

	
	ingredientesNoPermitidos.add("sal")
	ingredientesNoPermitidos.add("caldo")
	
	}
	
}