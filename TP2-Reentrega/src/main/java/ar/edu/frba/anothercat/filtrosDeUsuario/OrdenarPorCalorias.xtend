package ar.edu.frba.anothercat.filtrosDeUsuario

import ar.edu.frba.anothercat.excepciones.ExceptionFiltro
import ar.edu.frba.anothercat.receta.Receta
import ar.edu.frba.anothercat.usuario.DecoratorOrdenamientoPostCondicionesDeBusqueda
import java.util.List

class OrdenarPorCalorias extends DecoratorOrdenamientoPostCondicionesDeBusqueda {
	
	new (Ordenamiento decorado){
		super(decorado)
	}
	
	override ordenamientoDeRecetas(List<Receta>  recetas) {
		var List<Receta>  recetasOrdenadas
		
		recetasOrdenadas = decorado.ordenamientoDeRecetas(recetas)
		
		if(recetas.isEmpty()){
			throw new ExceptionFiltro("lista vacia")
		}
		
		else
		{
			var List<Receta> recetasOrdenFinal
			
							
			
			recetasOrdenFinal = recetasOrdenadas
			
			return (recetasOrdenFinal.sortBy[caloriasFinales])
		}
		
	}
	
	


	
	
	
	

}