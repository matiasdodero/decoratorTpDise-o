package ar.edu.frba.anothercat.filtrosDeUsuario

import java.util.ArrayList
import java.util.List
import ar.edu.frba.anothercat.usuario.DecoratorUsuarioCondicionesBusqueda
import ar.edu.frba.anothercat.receta.Receta
import ar.edu.frba.anothercat.usuario.UsuarioPosta

class ExcesoDeCalorias extends DecoratorUsuarioCondicionesBusqueda {

		override filtrarRecetasSegunCriterio1 (List<Receta> recetas, UsuarioPosta usuario){
		var List<Receta> recetaCalorias = new ArrayList<Receta>
		return recetaCalorias = (recetas.filter[  receta | ( receta.totalCalorias < 500 && usuario.calcularImc() < 25)  ]).toList()	
		
	}
	
	
	override boolean filtrarRecetasSegunCriterio2 (Receta receta, UsuarioPosta usuario){
		
		return (receta.totalCalorias > 500 && usuario.calcularImc() > 25)
		
	 	
	}

}