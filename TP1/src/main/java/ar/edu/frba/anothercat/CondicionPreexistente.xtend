package ar.edu.frba.anothercat

public interface CondicionPreexistente {

	def boolean cumpleValidacion(Usuario unUsuario)

	def boolean subsanasteCondicionesPreEx(Usuario usuario)

	def boolean esInadecuadaPara(Receta unaReceta)

}
