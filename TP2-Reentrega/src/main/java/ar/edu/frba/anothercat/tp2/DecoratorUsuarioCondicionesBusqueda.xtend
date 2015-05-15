package ar.edu.frba.anothercat.tp2

import java.util.List
import ar.edu.frba.anothercat.tp1.Receta

public abstract class DecoratorUsuarioCondicionesBusqueda implements Usuario{
	
	def List<Receta> filtrarRecetasSegunCriterio1 (List<Receta> recetas, UsuarioPosta usuario)
	
	def boolean filtrarRecetasSegunCriterio2 (Receta recetas, UsuarioPosta usuario)
}