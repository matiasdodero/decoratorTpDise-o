package ar.edu.frba.anothercat.filtrosDeUsuario


import java.util.List
import ar.edu.frba.anothercat.receta.Receta
import ar.edu.frba.anothercat.usuario.DecoratorOrdenamientoPostCondicionesDeBusqueda
import ar.edu.frba.anothercat.excepciones.ExceptionFiltro

class OrdenarPorPares extends DecoratorOrdenamientoPostCondicionesDeBusqueda {
	
	new (Ordenamiento decorado){
		super(decorado)
	}
	
	override ordenamientoDeRecetas(List<Receta> recetas) {
		
		var List<Receta> recetasFiltradas
		recetasFiltradas = decorado.ordenamientoDeRecetas(recetas)
		var List<Receta> setRecetas
		var List<Receta> recetasAux
		var List<Receta> recetasFiltroFinal
		
		if(recetas.isEmpty()){
			throw new ExceptionFiltro("lista vacia")
		}
		
		else{
			
			
			for (var int i = 0; i < recetasFiltradas.size; i++) {
			if (i % 2 == 0) {
				recetasAux.add(recetas.get(i))
			}
		}

		for (item : recetasAux) {
			setRecetas.add(item)
		}
		recetasFiltroFinal = recetasAux

		return recetasFiltroFinal
			
			
		}
		
		
		
	}





}