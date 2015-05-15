package ar.edu.frba.anothercat.tp2

import java.util.HashSet
import ar.edu.frba.anothercat.tp1.Receta

class PrimerosN extends DecoratorProcesamientoPosterior {
	
	override procesar (Iterable<Receta> recetas){
		
		var Iterable<Receta> recetasCriterio = new HashSet<Receta>
       
		
		recetasCriterio = recetas
		

    	return recetasCriterio.take(10)
    	
	}
}