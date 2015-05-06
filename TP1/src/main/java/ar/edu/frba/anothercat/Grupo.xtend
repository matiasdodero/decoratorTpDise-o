package ar.edu.frba.anothercat

import java.util.List
import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Grupo {
	String nombre
	List<Receta> misRecetas = new ArrayList<Receta>
	List<Ingrediente> preferencias = new ArrayList<Ingrediente>
	List<Usuario> misUsuarios = new ArrayList<Usuario>
	
	def agregarUsuario(Usuario unUsuario){
		var boolean apto = true
		for (item: preferencias){
			if (unUsuario.disgustos.exists[unD | unD == item])
			{apto = false}
		}
		for (item: misRecetas){
			if ( unUsuario.precondiciones.exists[unaPre | unaPre.esInadecuadaPara(item)])
			{apto = false}
		}
		if (apto == true) {misUsuarios.add(unUsuario)}
		else 
    	{
    		throw new NoCumpleRequisitosException("No puede agregar el usuario por alguna receta o preferencia")
    	} 
		
	}
	
	def agregarReceta(Receta unaReceta){
		var boolean apto = true
		for (item: misUsuarios){
			if ( item.precondiciones.exists[unaPre | unaPre.esInadecuadaPara(unaReceta)])
			{apto = false}
		}
		if (apto == true) {misRecetas.add(unaReceta)}
		else 
    	{
    		throw new NoCumpleRequisitosException("No puede agregar la receta por algun usuario ")
    	} 
		
		
	}
	
	def public void agregarPreferencias(Ingrediente unaP) {

		preferencias.add(unaP)

	}
	
}