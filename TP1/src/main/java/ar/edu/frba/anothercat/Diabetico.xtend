package ar.edu.frba.anothercat

import java.util.Collection

class Diabetico extends CondicionPreexistente {
	
	int maximoDeAzucarPermitido = 100
	
	var Collection<String> ingredientesNoPermitidos
	
	def void cargarIngredientes(){
		ingredientesNoPermitidos.add("azucar")
	}
	override dameCondicion(Usuario unUsuario){
		return (unUsuario.getSexo() != null && unUsuario.getPreferencias.size >= 1 ) 
		}	
		
	
	override subsanasteCondicionesPreEx(Usuario usuario){
		if(usuario.rutina != "INTENSIVO" && usuario.peso >= 70){
			return false
		}
		
	}
}