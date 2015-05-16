package ar.edu.frba.anothercat.receta

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Ingrediente {
	String nombreIngrediente
	String tipoIngrediente	
	int calorias
	boolean ingredienteCaro
	
	def String dameNombre() {
		return nombreIngrediente
	}
	def String dameTipo() {
		return tipoIngrediente
	}
	
	public def boolean  ingredienteCaro(){
		
		ingredienteCaro
	}
}