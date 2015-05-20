package ar.edu.frba.anothercat.filtrosDeUsuario

import java.util.HashSet
import ar.edu.frba.anothercat.receta.Receta
import ar.edu.frba.anothercat.usuario.DecoratorOrdenamientoPostCondicionesDeBusqueda
import java.util.List
import ar.edu.frba.anothercat.excepciones.ExceptionFiltro

class PrimerosN extends DecoratorOrdenamientoPostCondicionesDeBusqueda {
	
	new (Ordenamiento decorado){
		super(decorado)
	}
	
	override ordenamientoDeRecetas(List<Receta> recetas) {
		var List<Receta> recetasOrdenadas
		recetasOrdenadas = decorado.ordenamientoDeRecetas(recetas)
		
		if(recetas.isEmpty()){
			throw new ExceptionFiltro("lista vacia")
		}
		else{
			var Iterable<Receta> recetasCriterio = new HashSet<Receta>
      
	
		recetasCriterio = recetas
	

   		return (recetasCriterio.take(10).toList())
		}
		
	}
	
	
	
	

}