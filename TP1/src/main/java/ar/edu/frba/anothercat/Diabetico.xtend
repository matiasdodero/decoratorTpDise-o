package ar.edu.frba.anothercat

import java.util.Collection

class Diabetico extends CondicionPreexistente {
	
	int maximoDeAzucarPermitido = 100
	
	var Collection<String> ingredientesNoPermitidos
	
	def void cargarIngredientes(){
		ingredientesNoPermitidos.add("azucar")
	}
	
}