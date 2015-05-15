package ar.edu.frba.anothercat.tp2

import ar.edu.frba.anothercat.tp1.Receta

public abstract class DecoratorProcesamientoPosterior implements Usuario {
	
	def Iterable<Receta> procesar (Iterable<Receta> recetas)
	
}