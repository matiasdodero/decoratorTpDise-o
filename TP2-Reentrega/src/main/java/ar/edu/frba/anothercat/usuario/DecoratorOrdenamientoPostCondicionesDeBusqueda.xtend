package ar.edu.frba.anothercat.usuario

import ar.edu.frba.anothercat.filtrosDeUsuario.Ordenamiento
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
public	abstract  class DecoratorOrdenamientoPostCondicionesDeBusqueda implements Ordenamiento {
	
	Ordenamiento decorado
	
	new (Ordenamiento ordenado){
		decorado=ordenado
	}
	

	
	
	
	
	
}