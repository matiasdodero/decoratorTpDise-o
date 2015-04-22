package ar.edu.frba.anothercat

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Ingrediente {
	String nombreIngrediente
	String tipoIngrediente	
	
	def String dameNombre() {
		return nombreIngrediente
	}
	def String dameTipo() {
		return tipoIngrediente
	}
}
