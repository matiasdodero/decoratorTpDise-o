package ar.edu.frba.anothercat.filtrosDeUsuario

import java.util.ArrayList
import java.util.List
import ar.edu.frba.anothercat.usuario.DecoratorUsuarioCondicionesBusqueda
import ar.edu.frba.anothercat.receta.Receta
import ar.edu.frba.anothercat.usuario.UsuarioPosta

class IngredientesCaros extends DecoratorUsuarioCondicionesBusqueda{
	
	override List<Receta> filtrarRecetasSegunCriterio1 (List<Receta> recetas, UsuarioPosta usuario){
		
		var List<Receta> recetasCaras = new ArrayList<Receta>
		return recetasCaras = recetas.filter[ receta | receta.getIngredientes.forall(ingrediente | !ingrediente.ingredienteCaro())].toList()
		
				
	}
	
	override filtrarRecetasSegunCriterio2 (Receta receta, UsuarioPosta usuario){
		return receta.getIngredientes.forall(ingrediente | !ingrediente.ingredienteCaro() )
	}
	
	
	
}