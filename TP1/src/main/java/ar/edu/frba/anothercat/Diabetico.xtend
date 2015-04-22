package ar.edu.frba.anothercat

import java.util.Collection

class Diabetico extends CondicionPreexistente {
	
	int maximoDeAzucarPermitido = 100
	
	var Collection<String> ingredientesNoPermitidos
	
	def void cargarIngredientes(){
		ingredientesNoPermitidos.add("azucar")
	}
	override dameCondicion(Usuario unUsuario){
		if (unUsuario.sexo == null || unUsuario.preferencias.size < 1) {
			return false
		}
		
	}
}