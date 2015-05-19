package ar.edu.frba.anothercat.usuario

import ar.edu.frba.anothercat.receta.Receta
import ar.edu.frba.anothercat.filtrosDeUsuario.Ordenamiento

public abstract class DecoratorOrdenamientoPostCondicionesDeBusqueda implements Ordenamiento {
	
	override Iterable<Receta> ordenamientoDeRecetas (Iterable<Receta> recetas)
	
}