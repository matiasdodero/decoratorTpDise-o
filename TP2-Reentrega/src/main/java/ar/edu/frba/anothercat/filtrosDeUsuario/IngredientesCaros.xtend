package ar.edu.frba.anothercat.filtrosDeUsuario

import ar.edu.frba.anothercat.receta.Receta
import ar.edu.frba.anothercat.usuario.DecoratorUsuarioCondicionesBusqueda
import ar.edu.frba.anothercat.usuario.Usuario
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class IngredientesCaros extends DecoratorUsuarioCondicionesBusqueda{
	
	new (Usuario decorado){
		super(decorado)
	}
	
	override filtrarRecetas(List<Receta> recetas, Usuario decorado) {
		recetas.filter[receta | receta.getIngredientes.forall(ingrediente|ingrediente.ingredienteCaro())].toList()
		
		// devuelve recetas que contengan ingredientes caros
	}
	
				

	
	
	
	
}