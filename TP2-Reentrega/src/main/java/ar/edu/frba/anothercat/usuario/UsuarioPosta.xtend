package ar.edu.frba.anothercat.usuario

import java.util.ArrayList
import java.util.Date
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.frba.anothercat.receta.Ingrediente
import ar.edu.frba.anothercat.receta.Receta
import ar.edu.frba.anothercat.excepciones.NoCumpleRequisitosException
import ar.edu.frba.anothercat.receta.Condimento
import ar.edu.frba.anothercat.receta.Repositorio_Receta
import ar.edu.frba.anothercat.receta.EstadoReceta
import ar.edu.frba.anothercat.filtrosDeUsuario.Ordenamiento

@Accessors
class UsuarioPosta implements Usuario, Ordenamiento {

	
	
	String nombre
	String sexo
	Date fechaDeNacimiento
	double altura
	int peso
	List<CondicionPreexistente> condicionesPreexistentes = new ArrayList<CondicionPreexistente>
	List<Ingrediente> ingredientesPreferidos = new ArrayList<Ingrediente>
	List<Ingrediente> disgustos = new ArrayList<Ingrediente>
	List<Receta> misRecetas = new ArrayList<Receta>
	List<Grupo> misGrupos = new ArrayList<Grupo>
	List<Receta> favoritas = new ArrayList<Receta>
	private tipoRutina rutinaE
	double imc
		
	new(){
		
		
		
	}
	
	new(int unPeso){
		peso=unPeso
	}
	
	new (double unaAltura){
		altura=unaAltura
	}
	
	override getImc(){
		peso/(altura*altura)
	}
	
	override getPeso(){
		peso
	}
	override getAltura(){
		altura
	}
	
	override getIngredientesPreferidos(){
		ingredientesPreferidos
	}
	
	override getCondicionesPreexistentes(){
		condicionesPreexistentes
	}
	
	
	
	

	def boolean sosValido() {

		if ((nombre == null) || (peso == 0) || (altura == 0) || (fechaDeNacimiento == null) || (rutinaE.equals(null))) {
			return false
		}
		if (nombre.length() <= 4) {
			return false
		}
		if (condicionesPreexistentes.isEmpty() == false) {
			if (condicionesPreexistentes.forall[precondicion|precondicion.cumpleValidacion(this)] == false) {
				return false
			}
		}

		if (!validaFechaNacimiento()) {
			System.out.println("dio en 4")
			return false
		}

		return true
	}

	def validaFechaNacimiento() {
		fechaDeNacimiento < new Date()
	}

	def public void agregarCondicionPreexistente(CondicionPreexistente unaCond) {

		condicionesPreexistentes.add(unaCond)

	}
	
	

	def public void agregarIngredientePreferido(Ingrediente ingrediente) {

		ingredientesPreferidos.add(ingrediente)

	}

	

	def double calcularImc() {
		return peso / (altura * altura)
	}

	def public boolean seguisDietaSaludable() {
		if (this.calcularImc <= 18 || this.calcularImc >= 30 && condicionesPreexistentes.size < 1) {
			return false
		} else if (this.calcularImc > 18 && this.calcularImc < 30 && condicionesPreexistentes.size < 1) {
			return true
		} else {
			return condicionesPreexistentes.forall[precondicion|precondicion.subsanasteCondicionesPreEx(this)]
		}
	}

	def boolean puedoVerReceta(Receta unaReceta){
		
		return (unaReceta.getEstado == EstadoReceta.PUBLICA || this.misRecetas.exists[unaRec| unaRec == unaReceta] )
		
	}

	def boolean puedoModificarReceta(Receta unaReceta) {
		return ( unaReceta.getEstado == EstadoReceta.PUBLICA || !(unaReceta.getEstado == EstadoReceta.PUBLICA) &&
			this.misRecetas.exists[unaRec|unaRec == unaReceta]
	 	)
	}

	def public agregarReceta(Receta unaReceta) {
		

		var Receta unaNuevaR = new Receta

		unaNuevaR.setNombrePlato(unaReceta.getNombrePlato)
		unaNuevaR.setIngredientes(unaReceta.getIngredientes)
		unaNuevaR.setCondimentos(unaReceta.getCondimentos)
		unaNuevaR.setPasos(unaReceta.getPasos)
		unaNuevaR.setCondiciones(unaReceta.getCondiciones)
		unaNuevaR.setTotalCalorias(unaReceta.getTotalCalorias)
		unaNuevaR.setDificultad(unaReceta.getDificultad)
		unaNuevaR.setTemporadas(unaReceta.getTemporadas)

		if (unaReceta.validar()) {
			if (condicionesPreexistentes.exists[unaPre|unaPre.esInadecuadaPara(unaReceta)]) {
				throw new NoCumpleRequisitosException("No es apto")
			} else {
				
				unaNuevaR.setEstadoReceta(EstadoReceta.PRIVADA)
				misRecetas.add(unaNuevaR)

			}

		}

	}
	
		
	
	

	def public agregarRecetaFavorita(Receta unaReceta) {

		if (unaReceta.validar()) {
			if (condicionesPreexistentes.exists[unaPre|unaPre.esInadecuadaPara(unaReceta)]) {
				throw new NoCumpleRequisitosException("No es apto")
			} else {
				favoritas.add(unaReceta)
			}

		}

	}

	def public eliminarReceta(Receta unaReceta) {

		if (misRecetas.exists[unaR|unaR == unaReceta]) {
			misRecetas.remove(unaReceta)
		} else {
			throw new NoCumpleRequisitosException("La receta no está contenida")
		}

	}

	def void modificarNombrePlato(Receta unaReceta, String nombrePlatoAux) {

		if (puedoModificarReceta(unaReceta) == true) {

			unaReceta.setNombrePlato(nombrePlatoAux)
		} else {
			throw new NoCumpleRequisitosException("No puede modificar el nombre del plato de la Receta")
		}

	}

	def void modificarTotalCalorias(Receta unaReceta, int totalCaloriasAux) {

		if (puedoModificarReceta(unaReceta) == true) {

			unaReceta.setTotalCalorias(totalCaloriasAux)
		} else {
			throw new NoCumpleRequisitosException("No puede modificar el total de calorias de la Receta ")
		}

	}

	def void modificarDificultad(Receta unaReceta, String dificultadAux) {

		if (puedoModificarReceta(unaReceta) == true) {

			unaReceta.setDificultad(dificultadAux)
		} else {
			throw new NoCumpleRequisitosException("No puede modificar la dificultad de la Receta ")
		}

	}

	def void modificarIngredientesReceta(Receta unaReceta, Ingrediente unIngre) {

		if (puedoModificarReceta(unaReceta) == true) {

			unaReceta.agregarIngrediente(unIngre)
		} else {
			throw new NoCumpleRequisitosException("No puede modificar los ingredientes de la Receta ")
		}

	}

	def void modificarCondimentosReceta(Receta unaReceta, Condimento unCond) {

		if (puedoModificarReceta(unaReceta) == true) {

			unaReceta.agregarCondimento(unCond)
		} else {
			throw new NoCumpleRequisitosException("No puede modificar los condimentos de la Receta ")
		}

	}

	def void solicitarAgregarmeAlGrupo(Grupo unGrupo) {
		unGrupo.agregarUsuario(this)
	}

	def List<Receta> decimeTodasTusRecetas(Repositorio_Receta unRepo) {
		var List<Receta> Rece = new ArrayList<Receta>
		for (item : unRepo.getRecetas_Publicas) {
			Rece.add(item)
		}
		for (itGru : this.getMisGrupos) {
			for (itGruRe : itGru.getMisRecetas) {
				Rece.add(itGruRe)
			}
		}
		for (misR : this.getMisRecetas) {
			Rece.add(misR)
		}
		return Rece
	}
	
	override filtrarRecetasSegunCondicionesDeBusquedaDelUsuario(List<Receta> recetas) {
		return recetas
	}

	
	override Iterable<Receta> ordenamientoDeRecetas (Iterable<Receta> recetas){
		
	}

				
				

}

public enum tipoRutina {
	LEVE,
	NADA,
	MEDIANO,
	INTENSIVO,
	PREINTENSIVO
;   	
   }