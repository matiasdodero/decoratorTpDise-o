package ar.edu.frba.anothercat.usuario

import ar.edu.frba.anothercat.receta.Receta

public abstract class DecoratorProcesamientoPosterior implements Usuario {
	
	def Iterable<Receta> procesar (Iterable<Receta> recetas)
	
}