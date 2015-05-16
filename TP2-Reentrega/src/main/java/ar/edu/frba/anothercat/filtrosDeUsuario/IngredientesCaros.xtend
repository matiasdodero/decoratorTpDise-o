package ar.edu.frba.anothercat.filtrosDeUsuario


import java.util.List
import ar.edu.frba.anothercat.usuario.DecoratorUsuarioCondicionesBusqueda
import ar.edu.frba.anothercat.receta.Receta
import ar.edu.frba.anothercat.usuario.UsuarioPosta

class IngredientesCaros extends DecoratorUsuarioCondicionesBusqueda{
	
	override filtrarRecetas(List<Receta> recetas, UsuarioPosta usuario) {
		recetas.filter[receta | receta.getIngredientes.forall(ingrediente|ingrediente.ingredienteCaro())].toList()
		
		// devuelve recetas que contengan ingredientes caros
	}
	
				

	
	
	
	
}