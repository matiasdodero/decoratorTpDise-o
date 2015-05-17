package ar.edu.frba.anothercat.filtrosDeUsuario


import java.util.List
import ar.edu.frba.anothercat.usuario.DecoratorUsuarioCondicionesBusqueda
import ar.edu.frba.anothercat.usuario.UsuarioPosta
import ar.edu.frba.anothercat.receta.Receta
import ar.edu.frba.anothercat.usuario.Usuario

class GustoDelUsuario extends DecoratorUsuarioCondicionesBusqueda {
	
	
	new (Usuario decorado){
		super(decorado)
	}
	
	override filtrarRecetas(List<Receta> recetas, Usuario decorado) {
		(recetas.filter[ receta | receta.getIngredientes.forall(ingrediente | decorado.getIngredientesPreferidos.contains(ingrediente))]).toList()
	}
	
	// devuelve recetas que contengan solamente ingredientes que le gusten al usuario
	



	
}