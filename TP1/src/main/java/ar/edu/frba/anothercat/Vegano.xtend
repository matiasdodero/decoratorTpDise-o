package ar.edu.frba.anothercat

import java.util.Collection
import java.util.List

class Vegano extends CondicionPreexistente {
	
	var Collection<String> ingredientesNoPermitidos
	
	def void cargarIngredientes(){
		ingredientesNoPermitidos.add("carne")
		ingredientesNoPermitidos.add("chori")
		ingredientesNoPermitidos.add("pollo")
		ingredientesNoPermitidos.add("chivito")
	}
	
	override dameCondicion(Usuario unUsuario){
	if ( unUsuario.getPreferencias.exists[unaPre | unaPre.dameNombre() == "pollo" ||
         														 unaPre.dameNombre() == "carne" ||
         														 unaPre.dameNombre() == "chivito" ||
         														 unaPre.dameNombre() == "chori" ])
        {return false}	
		else
		{return true}
	}
	
	override subsanasteCondicionesPreEx(Usuario usuario){
		if(usuario.preferencias.exists[unaPre | unaPre.dameTipo() != "fruta"] ){
			return false
		}
	}
}