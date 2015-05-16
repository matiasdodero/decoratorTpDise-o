package ar.edu.frba.anothercat.filtrosDeUsuario

import java.util.ArrayList
import java.util.List
import ar.edu.frba.anothercat.usuario.DecoratorUsuarioCondicionesBusqueda
import ar.edu.frba.anothercat.usuario.UsuarioPosta
import ar.edu.frba.anothercat.receta.Receta

class BusquedaPorCondicionPreexistente extends DecoratorUsuarioCondicionesBusqueda {
	
	override filtrarRecetas(List<Receta> recetas, UsuarioPosta usuario) {
		recetas.filter[receta | usuario.precondiciones.exists[precond | !(precond.esInadecuadaPara(receta))]].toList()
	}
	
	// muestra las recetas que no sean inadecuadas, las que pueda comer
	

	
	
	
}