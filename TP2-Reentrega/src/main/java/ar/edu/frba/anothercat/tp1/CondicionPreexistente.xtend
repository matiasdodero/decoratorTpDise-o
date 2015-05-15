package ar.edu.frba.anothercat.tp1

import ar.edu.frba.anothercat.tp2.UsuarioPosta

public interface CondicionPreexistente {

	def boolean cumpleValidacion(UsuarioPosta unUsuario)

	def boolean subsanasteCondicionesPreEx(UsuarioPosta usuario)

	def boolean esInadecuadaPara(Receta unaReceta)

}