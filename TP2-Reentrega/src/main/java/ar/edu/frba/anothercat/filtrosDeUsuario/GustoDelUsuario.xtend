package ar.edu.frba.anothercat.filtrosDeUsuario

import ar.edu.frba.anothercat.receta.Receta
import ar.edu.frba.anothercat.usuario.DecoratorUsuarioCondicionesBusqueda
import ar.edu.frba.anothercat.usuario.Usuario
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class GustoDelUsuario extends DecoratorUsuarioCondicionesBusqueda {
	
	
	new (Usuario decorado){
		super(decorado)
	}
	
	
	
	override filtrarRecetas(List<Receta> recetas) {
		
		var List<Receta> recetasFiltradas
		
		recetasFiltradas = decorado.filtrarRecetas(recetas)
		
		if(recetasFiltradas.isEmpty()){
			throw new ExceptionFiltro("Lista vacia")
		}
		else{
			
		var List<Receta> recetasFiltroFinal
		return recetasFiltroFinal = (recetasFiltradas.filter[ receta | receta.getIngredientes.exists(ingrediente | decorado.getIngredientesPreferidos.exists[pref | ingrediente == pref])]).toList()
	}
	
	}
	
	// devuelve recetas que contengan solamente ingredientes que le gusten al usuario
	



	
}