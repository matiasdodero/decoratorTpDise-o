package ar.edu.frba.anothercat.filtrosDeUsuario

import ar.edu.frba.anothercat.receta.Receta
import ar.edu.frba.anothercat.usuario.DecoratorOrdenamientoPostCondicionesDeBusqueda
import java.util.ArrayList
import java.util.HashSet
import java.util.List

class OrdenarPorPares extends DecoratorOrdenamientoPostCondicionesDeBusqueda {
	
	new (Ordenamiento decorado){
		super(decorado)
	}
	
	override ordenamientoDeRecetas(List<Receta> recetas) {
		
		var Iterable<Receta> recetasOrdenadas
		
		recetasOrdenadas = decorado.ordenamientoDeRecetas(recetas)	
			
        var Iterable<Receta> recetasOrden = new HashSet<Receta>
        var HashSet<Receta> ReceSet = new HashSet<Receta>
        var List<Receta> Rece2Set = new ArrayList<Receta>
        
		for(var int i = 0; i < recetasOrdenadas.size ; i++)
		{
			if (i % 2 == 0) {
				Rece2Set.add(recetasOrdenadas.get(i))
			}
		}
		
        for (item: Rece2Set) {
			ReceSet.add(item)
		  }
		

		recetasOrden = Rece2Set

    	return (recetasOrden.toList())
		
		
	}
		
		
	}
	



	




