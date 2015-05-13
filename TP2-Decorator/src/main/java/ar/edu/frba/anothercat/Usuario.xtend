package ar.edu.frba.anothercat

import java.util.List

public abstract class Usuario {
	
	def List<Receta> filtrarRecetasSegunCriterio1 (List<Receta> recetas, UsuarioPosta usuario)
	
	def boolean filtrarRecetasSegunCriterio2 (Receta recetas, UsuarioPosta usuario)
}