package ar.edu.frba.anothercat.filtrosDeUsuario


import java.util.List
import ar.edu.frba.anothercat.usuario.DecoratorUsuarioCondicionesBusqueda
import ar.edu.frba.anothercat.usuario.UsuarioPosta
import ar.edu.frba.anothercat.receta.Receta

class GustoDelUsuario extends DecoratorUsuarioCondicionesBusqueda {
	
	override filtrarRecetas(List<Receta> recetas, UsuarioPosta usuario) {
		(recetas.filter[ receta | receta.getIngredientes.forall(ingrediente | usuario.getIngredientesPreferidos.contains(ingrediente))]).toList()
	}
	
	// devuelve recetas que contengan solamente ingredientes que le gusten al usuario
	



	
}