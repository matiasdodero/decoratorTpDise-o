package ar.edu.frba.anothercat

import java.util.HashSet

abstract class OrdenarAlfabeticamente extends DecoratorProcesamientoPosterior {
	
	override procesar (Iterable<Receta> recetas){
		
		var Iterable<Receta> recetasFiltradas = new HashSet<Receta>
        var HashSet<Receta> setRecetas = new HashSet<Receta>
        
        for (item: recetas) {
			setRecetas.add(item)
		  }
		
		recetasFiltradas = setRecetas

    	return recetasFiltradas.sortBy[ nombrePlato]
		
	}
	
	
	
}