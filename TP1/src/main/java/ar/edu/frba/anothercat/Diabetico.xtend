package ar.edu.frba.anothercat

import java.util.Collection
import java.util.List

class Diabetico implements CondicionPreexistente {
	
	int maximoDeAzucarPermitido = 100
	
	var Collection<String> ingredientesNoPermitidos
	
	def void cargarIngredientes(){
		ingredientesNoPermitidos.add("azucar")
	}
	override dameCondicion(Usuario unUsuario){
		return (unUsuario.getSexo() != null && unUsuario.getPreferencias.size >= 1 ) 
		}	
		
	
	override subsanasteCondicionesPreEx(Usuario usuario){
		return ((usuario.rutina == "INTENSIVO" || usuario.rutina == "NO TAN INTENSIVO") || usuario.peso < 70)
	
	
	}
	
	override esInadecuadoPara(Receta unaReceta){}
}