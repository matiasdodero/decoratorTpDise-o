package ar.edu.frba.anothercat.tp2

import java.util.HashSet
import ar.edu.frba.anothercat.tp1.Receta

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