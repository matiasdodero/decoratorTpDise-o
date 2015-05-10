package ar.edu.frba.anothercat

import java.util.List

abstract class DecoratorUsuarioCondicionesBusqueda implements Usuario{
	
	override List<Receta> filtro1 (List<Receta> recetas, UsuarioPosta usuario)
	
	override boolean filtro2 (Receta recetas, UsuarioPosta usuario)
}