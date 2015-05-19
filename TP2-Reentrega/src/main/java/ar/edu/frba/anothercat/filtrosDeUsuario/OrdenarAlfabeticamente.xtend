package ar.edu.frba.anothercat.filtrosDeUsuario

import java.util.HashSet
import ar.edu.frba.anothercat.receta.Receta
import ar.edu.frba.anothercat.usuario.DecoratorOrdenamientoPostCondicionesDeBusqueda

class OrdenarAlfabeticamente extends DecoratorOrdenamientoPostCondicionesDeBusqueda {
	
	override ordenamientoDeRecetas (Iterable<Receta> recetas){
		
		var Iterable<Receta> recetasFiltradas = new HashSet<Receta>
        var HashSet<Receta> setRecetas = new HashSet<Receta>
        
        for (item: recetas) {
			setRecetas.add(item)
		  }
		
		recetasFiltradas = setRecetas

    	return recetasFiltradas.sortBy[ nombrePlato]
		
	}
	
}