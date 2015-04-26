package ar.edu.frba.anothercat



public interface CondicionPreexistente {
//	String condicion_preexistente	
	
	
	
	def boolean dameCondicion(Usuario unUsuario)
	
	def boolean subsanasteCondicionesPreEx(Usuario usuario)
	
	def boolean esInadecuadaPara(Receta unaReceta)
	
	
}