package ar.edu.frba.anothercat

import java.util.List

public interface Usuario {
	
	def List<Receta> filtro1 (List<Receta> recetas, UsuarioPosta usuario)
	
	def boolean filtro2 (Receta recetas, UsuarioPosta usuario)
}