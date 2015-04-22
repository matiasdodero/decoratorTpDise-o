package ar.edu.frba.anothercat

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Condimento {
	
	String nombre
	
	int cantidad=0
	
	def int dameCantidad(){
		cantidad
	}
	
}