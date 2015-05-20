package ar.edu.frba.anothercat.filtrosDeUsuario

import ar.edu.frba.anothercat.receta.Receta
import ar.edu.frba.anothercat.usuario.DecoratorOrdenamientoPostCondicionesDeBusqueda
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.frba.anothercat.excepciones.ExceptionFiltro

@Accessors
class OrdenarAlfabeticamente extends DecoratorOrdenamientoPostCondicionesDeBusqueda {
	
	new (Ordenamiento decorado){
		super(decorado)
	}
	
	override ordenamientoDeRecetas(List<Receta>  recetas) {
		var List<Receta>  recetasFiltradas 
		
		recetasFiltradas = decorado.ordenamientoDeRecetas(recetas)
		
		if(recetas.isEmpty()){
			throw new ExceptionFiltro("lista vacia")
		}
		
		else
		{
			var List<Receta> recetasFiltroFinal
			
			return recetasFiltroFinal = recetasFiltradas.sortBy[nombrePlato]
		}
		
	}
	
	
	

	
}