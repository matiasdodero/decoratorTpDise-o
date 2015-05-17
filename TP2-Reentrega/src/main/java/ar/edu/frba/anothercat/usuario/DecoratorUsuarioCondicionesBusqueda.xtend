package ar.edu.frba.anothercat.usuario

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
public abstract class DecoratorUsuarioCondicionesBusqueda implements Usuario{
	


	Usuario decorado
	
	new (Usuario usuario){
		decorado=usuario
	}
	
//	override filtrarRecetas(List<Receta> recetas,Usuario usuario){
//		usuario.filtrarRecetas(recetas)
//	}
	
	override getImc(){
		decorado.imc
	}
	
	override getAltura(){
		decorado.altura
	}
	
	override getPeso(){
		decorado.peso
	}
	
	override getIngredientesPreferidos(){
		decorado.ingredientesPreferidos
	}
	
	override getCondicionesPreexistentes(){
		decorado.condicionesPreexistentes
	}
	
	

}