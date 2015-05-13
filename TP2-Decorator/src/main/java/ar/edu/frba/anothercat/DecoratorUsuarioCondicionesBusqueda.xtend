package ar.edu.frba.anothercat

import java.util.List

public abstract class DecoratorUsuarioCondicionesBusqueda extends Usuario{
	
	override List<Receta> filtrarRecetasSegunCriterio1 (List<Receta> recetas, UsuarioPosta usuario)
	
	override boolean filtrarRecetasSegunCriterio2 (Receta recetas, UsuarioPosta usuario)
}