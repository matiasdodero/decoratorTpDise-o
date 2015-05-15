package ar.edu.frba.anothercat.tp2

import java.util.ArrayList
import java.util.List
import ar.edu.frba.anothercat.tp1.Receta

class IngredientesCaros extends DecoratorUsuarioCondicionesBusqueda{
	
	override List<Receta> filtrarRecetasSegunCriterio1 (List<Receta> recetas, UsuarioPosta usuario){
		
		var List<Receta> recetasCaras = new ArrayList<Receta>
		return recetasCaras = recetas.filter[ receta | receta.getIngredientes.forall(ingrediente | !ingrediente.ingredienteCaro())].toList()
		
				
	}
	
	override filtrarRecetasSegunCriterio2 (Receta receta, UsuarioPosta usuario){
		return receta.getIngredientes.forall(ingrediente | !ingrediente.ingredienteCaro() )
	}
	
	
	
}