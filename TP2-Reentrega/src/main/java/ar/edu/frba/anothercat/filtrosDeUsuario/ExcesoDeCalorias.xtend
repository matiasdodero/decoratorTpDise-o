package ar.edu.frba.anothercat.filtrosDeUsuario

import ar.edu.frba.anothercat.receta.Receta
import ar.edu.frba.anothercat.usuario.DecoratorUsuarioCondicionesBusqueda
import ar.edu.frba.anothercat.usuario.Usuario
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class ExcesoDeCalorias extends DecoratorUsuarioCondicionesBusqueda {
	
	new (Usuario decorado){
		super(decorado)
	}
	
	
	override filtrarRecetas(List<Receta> recetas,Usuario decorado) {
		recetas.filter[receta | receta.caloriasFinales<500 && decorado.imc>25].toList()
	}
	
	override getIngredientesPreferidos() {
		
	}
	
	//si el usuario tiene sobrepeso(imc > 25) deberia ver recetas con calorias < 500	
	
			
	


}