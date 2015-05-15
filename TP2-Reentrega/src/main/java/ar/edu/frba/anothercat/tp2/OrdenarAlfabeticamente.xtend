package ar.edu.frba.anothercat.tp2

import java.util.HashSet
import ar.edu.frba.anothercat.tp1.Receta

class OrdenarAlfabeticamente extends DecoratorProcesamientoPosterior {
	
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