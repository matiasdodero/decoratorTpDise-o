package ar.edu.frba.anothercat

import java.util.ArrayList
import java.util.Collection
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Receta {

	String nombrePlato
	Collection<Ingrediente> ingredientes = new ArrayList<Ingrediente>		
	Collection<Condimento> condimentos = new ArrayList<Condimento>
	Collection<Paso> pasos = new ArrayList<Paso>
	Collection<Condicion_Preexistente> condiciones = new ArrayList<Condicion_Preexistente>
	int totalCalorias=0
	String dificultad
	Collection<Temporada> temporadas = new ArrayList<Temporada>
	
	

	def void agregarIngrediente(Ingrediente unIngrediente) {

		ingredientes.add(unIngrediente)

	}

	def void sumarCalorias(int cal) {
		totalCalorias += cal
	}

	def void validar() {
		if(ingredientes.size >= 1 && (totalCalorias >= 10 && totalCalorias <= 5000))
		{
			
		}
		else
		{
			throw new NoCumpleRequisitosException("No cumple con los requisitos minimos")
		}		
	}	
	
def void verificarHipertenso() {
		if (ingredientes.contains("sal") || ingredientes.contains("caldo")) {
			throw new HipertensoException("No apta para hipertensos")
		}

	}

	
	def void verificarDiabetico() {

		if ((condimentos.contains("azucar") && (condimentos.fold(0, [acum, condimento|acum + condimento.cantidad]) > 100))){
			throw new DiabeticoException("No apta para diabeticos ")
		}
	}

	def void verificarVegano() {
		if (condimentos.contains("carne") || condimentos.contains("pollo") || condimentos.contains("chivito") ||	condimentos.contains("chori")) {
			throw new NoAptaParaVeganosException("No apta para veganos")
		}

	}
}