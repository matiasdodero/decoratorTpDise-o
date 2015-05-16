package ar.edu.frba.anothercat.filtrosDeUsuario


import java.util.List
import ar.edu.frba.anothercat.usuario.DecoratorUsuarioCondicionesBusqueda
import ar.edu.frba.anothercat.receta.Receta
import ar.edu.frba.anothercat.usuario.UsuarioPosta


class ExcesoDeCalorias extends DecoratorUsuarioCondicionesBusqueda {
	
	
	
	
	override filtrarRecetas(List<Receta> recetas,UsuarioPosta usuario) {
		recetas.filter[receta | receta.caloriasFinales<500 && usuario.calcularImc>25].toList()
	}
	
	//si el usuario tiene sobrepeso(imc > 25) deberia ver recetas con calorias < 500	
	
			
	


}