package ar.edu.frba.anothercat.filtrosDeUsuario

import ar.edu.frba.anothercat.receta.Receta

interface Ordenamiento {
	
	def Iterable<Receta> ordenamientoDeRecetas (Iterable<Receta> recetas)
	
}