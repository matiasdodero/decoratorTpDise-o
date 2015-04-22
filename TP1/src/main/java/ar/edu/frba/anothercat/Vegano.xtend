package ar.edu.frba.anothercat

import java.util.Collection

class Vegano extends CondicionPreexistente {
	
	var Collection<String> ingredientesNoPermitidos
	
	def void cargarIngredientes(){
		ingredientesNoPermitidos.add("carne")
		ingredientesNoPermitidos.add("chori")
		ingredientesNoPermitidos.add("pollo")
		ingredientesNoPermitidos.add("chivito")
	}
	
	
	
}