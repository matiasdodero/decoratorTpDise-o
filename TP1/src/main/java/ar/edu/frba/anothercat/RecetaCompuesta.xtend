package ar.edu.frba.anothercat



class RecetaCompuesta extends Receta {
	
	override agregarIngredientesDeRecetaSimple(RecetaSimple recSimple){
		var listaAux = recSimple.ingredientes.clone()
		listaAux.forEach[ingrediente | this.ingredientes.add(ingrediente)]
	}
	
}