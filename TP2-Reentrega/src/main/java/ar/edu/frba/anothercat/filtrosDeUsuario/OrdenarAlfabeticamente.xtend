package ar.edu.frba.anothercat.filtrosDeUsuario

import java.util.HashSet
import ar.edu.frba.anothercat.usuario.DecoratorProcesamientoPosterior
import ar.edu.frba.anothercat.receta.Receta

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