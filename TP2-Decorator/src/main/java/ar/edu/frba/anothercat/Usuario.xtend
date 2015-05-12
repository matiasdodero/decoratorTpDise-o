package ar.edu.frba.anothercat

import java.util.List

public abstract class Usuario {
	
	def List<Receta> filtro1 (List<Receta> recetas, UsuarioPosta usuario)
	
	def boolean filtro2 (Receta recetas, UsuarioPosta usuario)
}