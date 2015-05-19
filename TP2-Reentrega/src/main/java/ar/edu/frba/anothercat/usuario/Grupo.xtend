package ar.edu.frba.anothercat.usuario

import java.util.List
import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.frba.anothercat.receta.Ingrediente
import ar.edu.frba.anothercat.receta.Receta
import ar.edu.frba.anothercat.excepciones.NoCumpleRequisitosException
import ar.edu.frba.anothercat.receta.EstadoReceta

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
			if ( unUsuario.condicionesPreexistentes.exists[unaPrecondicion|unaPrecondicion.esInadecuadaPara(item)])
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
		
		var Receta unaNuevaReceta = new Receta
		
		unaNuevaReceta.setNombrePlato(unaReceta.getNombrePlato)
		unaNuevaReceta.setIngredientes(unaReceta.getIngredientes)
		unaNuevaReceta.setCondimentos(unaReceta.getCondimentos)
		unaNuevaReceta.setPasos(unaReceta.getPasos)
		unaNuevaReceta.setCondiciones(unaReceta.getCondiciones)
		unaNuevaReceta.setTotalCalorias(unaReceta.getTotalCalorias)
		unaNuevaReceta.setDificultad(unaReceta.getDificultad)
		unaNuevaReceta.setTemporadas(unaReceta.getTemporadas)
		
		for (item: misUsuarios){
			if ( item.condicionesPreexistentes.exists[unaPrecondicion|unaPrecondicion.esInadecuadaPara(unaReceta)])
			{apto = false}
		}
		if (apto == true) {
			unaNuevaReceta.estadoReceta = EstadoReceta.COMPARTIDA
			misRecetas.add(unaNuevaReceta)
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