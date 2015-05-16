package ar.edu.frba.anothercat.usuario

import ar.edu.frba.anothercat.receta.Receta
import java.util.List


public interface Usuario {
	
		
	def List<Receta> filtrarRecetas(List<Receta> recetas,UsuarioPosta usuario)
	
	
	
}