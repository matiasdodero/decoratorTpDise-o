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

	def void agregarIngrediente(Ingrediente unIngrediente) {

		ingredientes.add(unIngrediente)

	}
	
	def void agregarCondimento(Condimento unCondimento){
		condimentos.add(unCondimento)
	}

	def void sumarCalorias(int cal) {
		totalCalorias += cal
	}

	def void validar() {
		if (ingredientes.size >= 1 && (totalCalorias >= 10 && totalCalorias <= 5000)) {
		} else {
			throw new NoCumpleRequisitosException("No cumple con los requisitos minimos")
		}
	}

	def void verificarPlato() {

		if (noEsAptoParaVeganos) {
			condiciones.add("vegano")
		}

		if (noEsAptoParaDiabeticos) {
			condiciones.add("diabetico")
		}

		if (noEsAptoParaHipertensos) {
			condiciones.add("hipertenso")
		}

	}
	
	def boolean noEsAptoParaVeganos(){
		ingredientes.contains("carne") || ingredientes.contains("pollo") || ingredientes.contains("chivito") ||
			ingredientes.contains("chori")
	}
	
	def boolean noEsAptoParaDiabeticos(){
		(condimentos.contains("azucar") &&
			(condimentos.fold(0, [acum, condimento|acum + condimento.dameCantidad]) > 100))
	}
	
	def boolean noEsAptoParaHipertensos(){
		ingredientes.contains("sal") || ingredientes.contains("caldo")
	}

}