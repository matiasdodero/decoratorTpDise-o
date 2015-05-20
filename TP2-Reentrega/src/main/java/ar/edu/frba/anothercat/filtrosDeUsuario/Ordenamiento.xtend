package ar.edu.frba.anothercat.filtrosDeUsuario

import ar.edu.frba.anothercat.receta.Receta
import java.util.List

public interface Ordenamiento {
	
	def List<Receta> ordenamientoDeRecetas (List<Receta> recetas)
	
}