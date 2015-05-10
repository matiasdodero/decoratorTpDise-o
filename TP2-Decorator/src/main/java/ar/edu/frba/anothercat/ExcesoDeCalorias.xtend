package ar.edu.frba.anothercat

import java.util.ArrayList
import java.util.List

class ExcesoDeCalorias extends DecoratorUsuarioCondicionesBusqueda {

		override filtro1 (List<Receta> recetas, UsuarioPosta usuario){
		var List<Receta> recetaCalorias = new ArrayList<Receta>
		return recetaCalorias = (recetas.filter[  receta | ( receta.caloriasFinales < 500 && usuario.calcularImc() < 25)  ]).toList()	
		
	}
	
	
	override boolean filtro2 (Receta receta, UsuarioPosta usuario){
		
		return (receta.caloriasFinales > 500 && usuario.calcularImc() > 25)
		
	 	
	}

}
