package ar.edu.frba.anothercat.filtrosDeUsuario

import java.util.ArrayList
import java.util.List
import ar.edu.frba.anothercat.usuario.DecoratorUsuarioCondicionesBusqueda
import ar.edu.frba.anothercat.usuario.UsuarioPosta
import ar.edu.frba.anothercat.receta.Receta
import ar.edu.frba.anothercat.usuario.Usuario

class BusquedaPorCondicionPreexistente extends DecoratorUsuarioCondicionesBusqueda {
	
	
			new (Usuario decorado){
		super(decorado)
	}
	
	
	override filtrarRecetas(List<Receta> recetas, Usuario decorado) {
		
		
		recetas.filter[receta | decorado.condicionesPreexistentes.exists[precond | !(precond.esInadecuadaPara(receta))]].toList()
	}
	
	// muestra las recetas que no sean inadecuadas, las que pueda comer
	

	
	
	
}