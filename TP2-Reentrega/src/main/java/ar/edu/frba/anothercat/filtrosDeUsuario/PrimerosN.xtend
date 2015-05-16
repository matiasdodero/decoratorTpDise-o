package ar.edu.frba.anothercat.filtrosDeUsuario

import java.util.HashSet
import ar.edu.frba.anothercat.receta.Receta
import ar.edu.frba.anothercat.usuario.DecoratorProcesamientoPosterior

class PrimerosN extends DecoratorProcesamientoPosterior {
	
	override procesar (Iterable<Receta> recetas){
		
		var Iterable<Receta> recetasCriterio = new HashSet<Receta>
       
		
		recetasCriterio = recetas
		

    	return recetasCriterio.take(10)
    	
	}
}