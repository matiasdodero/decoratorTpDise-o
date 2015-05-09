package ar.edu.frba.anothercat

public interface CondicionPreexistente {

	def boolean cumpleValidacion(UsuarioPosta unUsuario)

	def boolean subsanasteCondicionesPreEx(UsuarioPosta usuario)

	def boolean esInadecuadaPara(Receta unaReceta)

}