package ar.edu.frba.anothercat.filtrosDeUsuario

import ar.edu.frba.anothercat.receta.Receta
import ar.edu.frba.anothercat.usuario.DecoratorUsuarioCondicionesBusqueda
import ar.edu.frba.anothercat.usuario.Usuario
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.frba.anothercat.excepciones.ExceptionFiltro

@Accessors
class BusquedaPorCondicionPreexistente extends DecoratorUsuarioCondicionesBusqueda {
	
	
			new (Usuario decorado){
		super(decorado)
	}
	
	
	override filtrarRecetasSegunCondicionesDeBusquedaDelUsuario(List<Receta> recetas) {
		
		var List<Receta> recetasFiltradas
		
		recetasFiltradas = decorado.filtrarRecetasSegunCondicionesDeBusquedaDelUsuario(recetas)
		
		if(recetasFiltradas.isEmpty()){
			throw new ExceptionFiltro("Lista Vacia") 
		}
		else
		{
		
			var List<Receta> recetasFiltroFinal
			
		return recetasFiltroFinal = (recetasFiltradas.filter[receta | decorado.condicionesPreexistentes.exists[precond | !(precond.esInadecuadaPara(receta))]].toList())
	}
	
	}
	
	// muestra las recetas que no sean inadecuadas, las que pueda comer
	

	
	
	
}