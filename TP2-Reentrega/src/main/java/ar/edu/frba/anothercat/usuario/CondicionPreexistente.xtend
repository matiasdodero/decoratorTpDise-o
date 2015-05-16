package ar.edu.frba.anothercat.usuario

import ar.edu.frba.anothercat.receta.Receta

public interface CondicionPreexistente {

	def boolean cumpleValidacion(UsuarioPosta unUsuario)

	def boolean subsanasteCondicionesPreEx(UsuarioPosta usuario)

	def boolean esInadecuadaPara(Receta unaReceta)

}