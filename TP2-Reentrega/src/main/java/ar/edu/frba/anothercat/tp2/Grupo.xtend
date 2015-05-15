package ar.edu.frba.anothercat.tp2

import java.util.List
import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.frba.anothercat.tp1.Receta
import ar.edu.frba.anothercat.tp1.Ingrediente
import ar.edu.frba.anothercat.tp1.NoCumpleRequisitosException

@Accessors
class Grupo {
	String nombre
	List<Receta> misRecetas = new ArrayList<Receta>
	List<Ingrediente> preferencias = new ArrayList<Ingrediente>
	List<UsuarioPosta> misUsuarios = new ArrayList<UsuarioPosta>
	
	def agregarUsuario(UsuarioPosta unUsuario){
		var boolean apto = true
		for (item: preferencias){
			if (unUsuario.disgustos.exists[unD | unD == item])
			{apto = false}
		}
		for (item: misRecetas){
			if ( unUsuario.precondiciones.exists[unaPre | unaPre.esInadecuadaPara(item)])
			{apto = false}
		}
		if (apto == true) {misUsuarios.add(unUsuario)
						   unUsuario.misGrupos.add(this)}
		else 
    	{
    		throw new NoCumpleRequisitosException("No puede agregar el usuario por alguna receta o preferencia")
    	} 
		
	}
	
	def agregarReceta(Receta unaReceta){
		var boolean apto = true
		
		var Receta unaNuevaR = new Receta
		
		unaNuevaR.setNombrePlato(unaReceta.getNombrePlato)
		unaNuevaR.setIngredientes(unaReceta.getIngredientes)
		unaNuevaR.setCondimentos(unaReceta.getCondimentos)
		unaNuevaR.setPasos(unaReceta.getPasos)
		unaNuevaR.setCondiciones(unaReceta.getCondiciones)
		unaNuevaR.setTotalCalorias(unaReceta.getTotalCalorias)
		unaNuevaR.setDificultad(unaReceta.getDificultad)
		unaNuevaR.setTemporadas(unaReceta.getTemporadas)
		
		for (item: misUsuarios){
			if ( item.precondiciones.exists[unaPre | unaPre.esInadecuadaPara(unaReceta)])
			{apto = false}
		}
		if (apto == true) {
			unaNuevaR.setEstado(estadoReceta.Compartida)
			misRecetas.add(unaNuevaR)
		}
		else 
    	{
    		throw new NoCumpleRequisitosException("No puede agregar la receta por algun usuario ")
    	} 
		
		
	}
	
	def public void agregarPreferencias(Ingrediente unaP) {

		preferencias.add(unaP)

	}
	
}