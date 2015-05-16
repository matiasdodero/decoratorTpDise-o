package ar.edu.frba.anothercat.usuario

import java.util.List
import ar.edu.frba.anothercat.receta.Receta

public abstract class DecoratorUsuarioCondicionesBusqueda implements Usuario{
	
	def List<Receta> filtrarRecetasSegunCriterio1 (List<Receta> recetas, UsuarioPosta usuario)
	
	def boolean filtrarRecetasSegunCriterio2 (Receta recetas, UsuarioPosta usuario)
}