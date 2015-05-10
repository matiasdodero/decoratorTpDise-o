package ar.edu.frba.anothercat

import java.util.ArrayList
import java.util.List

class BusquedaPorCondicionPreexistente extends DecoratorUsuarioCondicionesBusqueda {
	
		override filtro1 (List<Receta> recetas, UsuarioPosta usuario){
		
		var List<Receta> recetaCondiciones = new ArrayList<Receta>
		
		return recetaCondiciones =  (recetas.filter[ receta| !( usuario.precondiciones.exists[ precond | precond.esInadecuadaPara(receta) ] ) ]  ).toList()
		
		
	}
	
	override filtro2 (Receta recetas, UsuarioPosta usuario){
		return !( usuario.precondiciones.exists[ precond | precond.esInadecuadaPara(recetas) ] )
	}
	
}