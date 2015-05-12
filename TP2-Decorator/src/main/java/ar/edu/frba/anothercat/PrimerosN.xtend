package ar.edu.frba.anothercat

import java.util.HashSet

class PrimerosN extends DecoratorProcesamientoPosterior {
	
	override procesar (Iterable<Receta> recetas){
		
		var Iterable<Receta> recetasCriterio = new HashSet<Receta>
       
		
		recetasCriterio = recetas
		

    	return recetasCriterio.take(10)
    	
	}
}