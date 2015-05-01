/*package ar.edu.frba.anothercat

import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List

@Accessors
class RecetaCompuesta extends Receta {
	
	List<Receta> cumpuestaDe = new ArrayList<Receta>
	
	def agregarIngredientesDeRecetaSimple(RecetaSimple recSimple){
		var  listaAux = recSimple.getIngredientes
		listaAux.forEach[ingrediente | this.ingredientes.add(ingrediente)]
	}
	
}*/