package ar.edu.frba.anothercat

import java.util.Collection
import java.util.List

class Vegano implements CondicionPreexistente {
	
	
	
	
	
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
		return (usuario.preferencias.exists[unaPre | unaPre.dameTipo() == "fruta"] )
	}
	
	
	
	override esInadecuadaPara(Receta unaReceta) {
		
	}
	
}