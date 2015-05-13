package ar.edu.frba.anothercat

import java.util.ArrayList
import java.util.List

class IngredientesCaros extends DecoratorUsuarioCondicionesBusqueda{
	
	override List<Receta> filtrarRecetasSegunCriterio1 (List<Receta> recetas, UsuarioPosta usuario){
		
		var List<Receta> recetasCaras = new ArrayList<Receta>
		return recetasCaras = recetas.filter[ receta | receta.getIngredientes.forall(ingrediente | !ingrediente.ingredienteCaro())].toList()
		
				
	}
	
	override filtrarRecetasSegunCriterio2 (Receta receta, UsuarioPosta usuario){
		return receta.getIngredientes.forall(ingrediente | !ingrediente.ingredienteCaro() )
	}
	
	
	
}