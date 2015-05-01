package ar.edu.frba.anothercat

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Receta {

	String nombrePlato
	List<Ingrediente> ingredientes = new ArrayList<Ingrediente>
	List<Condimento> condimentos = new ArrayList<Condimento>
	List<Paso> pasos = new ArrayList<Paso>
	var List<String> condiciones
	int totalCalorias = 0
	String dificultad
	List<Temporada> temporadas = new ArrayList<Temporada>
	boolean esPublica
	List<Receta> cumpuestaDe = new ArrayList<Receta>

	def void agregarIngrediente(Ingrediente unIngrediente) {

		ingredientes.add(unIngrediente)

	}

	def void agregarCondimento(Condimento unCondimento) {
		condimentos.add(unCondimento)
	}

	def void sumarCalorias(int cal) {
		totalCalorias += cal
	}

	def boolean validar() {
		if (ingredientes.size >= 1 && (totalCalorias >= 10 && totalCalorias <= 5000)) {
			return true
		} else {
			throw new NoCumpleRequisitosException("No cumple con los requisitos minimos")
		}
	}

	def List<CondicionPreexistente> recetaInadecuadaPara(List<CondicionPreexistente> condiciones) {
		condiciones.filter[condicion|condicion.esInadecuadaPara(this)].toList()
	}
	
	 
	/*def agregarIngredientesDeRecetaSimple(RecetaSimple recSimple){
		var  listaAux = recSimple.getIngredientes
		listaAux.forEach[ingrediente | this.ingredientes.add(ingrediente)]
	}*/
	
	def agregarmeReceta(Receta unaReceta) {
		cumpuestaDe.add(unaReceta)
	}
	
	def sosSimple() {
		return (cumpuestaDe.empty)
	}
	
	
	


	
}
