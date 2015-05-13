package ar.edu.frba.anothercat

import java.util.HashSet

class OrdenarPorCalorias extends DecoratorProcesamientoPosterior {
	
	
	override procesar (Iterable<Receta> recetas){
		
		var Iterable<Receta> recetasFiltro = new HashSet<Receta>
        var HashSet<Receta> setRecetas = new HashSet<Receta>
        
        for (item: recetas) {
			setRecetas.add(item)
		  }
		
		recetasFiltro = setRecetas

    	return recetasFiltro.sortBy[ -totalCalorias]
		
	}
	
}