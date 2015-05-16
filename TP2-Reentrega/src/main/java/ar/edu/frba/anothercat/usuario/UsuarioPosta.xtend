package ar.edu.frba.anothercat.usuario

import java.util.ArrayList
import java.util.Date
import java.util.HashSet
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.frba.anothercat.receta.Ingrediente
import ar.edu.frba.anothercat.receta.Receta
import ar.edu.frba.anothercat.excepciones.NoCumpleRequisitosException
import ar.edu.frba.anothercat.receta.Condimento
import ar.edu.frba.anothercat.receta.Repositorio_Receta

@Accessors
class UsuarioPosta implements Usuario {

	String nombre
	String sexo
	Date fechaDeNacimiento
	double altura
	int peso
	List<CondicionPreexistente> precondiciones = new ArrayList<CondicionPreexistente>
	List<Ingrediente> preferencias = new ArrayList<Ingrediente>
	List<Ingrediente> disgustos = new ArrayList<Ingrediente>
	List<Receta> misRecetas = new ArrayList<Receta>
	List<Grupo> misGrupos = new ArrayList<Grupo>
	List<Receta> favoritas = new ArrayList<Receta>
	private tipoRutina rutinaE
	List<DecoratorUsuarioCondicionesBusqueda> filtros = new ArrayList<DecoratorUsuarioCondicionesBusqueda>
	List<DecoratorProcesamientoPosterior> procesamientos = new ArrayList<DecoratorProcesamientoPosterior>
	

	def boolean sosValido() {

		if ((nombre == null) || (peso == 0) || (altura == 0) || (fechaDeNacimiento == null) || (rutinaE.equals(null))) {
			return false
		}
		if (nombre.length() <= 4) {
			return false
		}
		if (precondiciones.isEmpty() == false) {
			if (precondiciones.forall[precondicion|precondicion.cumpleValidacion(this)] == false) {
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

	def public void agregarCondicion(CondicionPreexistente unaCond) {

		precondiciones.add(unaCond)

	}

	def public void agregarPrefer(Ingrediente unaPreferencia) {

		preferencias.add(unaPreferencia)

	}

	def public void agregarDisgusto(Ingrediente unDisgusto) {

		disgustos.add(unDisgusto)

	}

	def double calcularImc() {
		return peso / (altura * altura)
	}

	def public boolean seguisDietaSaludable() {
		if (this.calcularImc <= 18 || this.calcularImc >= 30 && precondiciones.size < 1) {
			return false
		} else if (this.calcularImc > 18 && this.calcularImc < 30 && precondiciones.size < 1) {
			return true
		} else {
			return precondiciones.forall[precondicion|precondicion.subsanasteCondicionesPreEx(this)]
		}
	}

	def boolean puedoVerReceta(Receta unaReceta) {

		return (unaReceta.getEstado == 1 || this.misRecetas.exists[unaRec|unaRec == unaReceta] )

	}

	def boolean puedoModificarReceta(Receta unaReceta) {
		return ( unaReceta.getEstado == estadoReceta.Publica || !(unaReceta.getEstado == estadoReceta.Publica) &&
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
			if (precondiciones.exists[unaPre|unaPre.esInadecuadaPara(unaReceta)]) {
				throw new NoCumpleRequisitosException("No es apto")
			} else {
				unaNuevaR.setEstado(estadoReceta.Privada)
				misRecetas.add(unaNuevaR)

			}

		}

	}
	
	def public void agregarFiltro(DecoratorUsuarioCondicionesBusqueda filtro) {

		filtros.add(filtro)

	}	
	
	def public void agregarProcesamientoPosterior(DecoratorProcesamientoPosterior procesamiento) {

		procesamientos.add(procesamiento)
	}	

	def public agregarRecetaFavorita(Receta unaReceta) {

		if (unaReceta.validar()) {
			if (precondiciones.exists[unaPre|unaPre.esInadecuadaPara(unaReceta)]) {
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

	def List<Receta> filtrarRepositorioDeRecetas(Repositorio_Receta repositorio) {

		var List<Receta> todasLasRecetas = new ArrayList<Receta>
		var List<Receta> recetasFiltradas = new ArrayList<Receta>

		todasLasRecetas = this.decimeTodasTusRecetas(repositorio).toList()

		recetasFiltradas = (todasLasRecetas.filter[receta|
			!(this.getFiltros.exists[filtro|filtro.filtrarRecetasSegunCriterio2(receta, this)])] ).toList()
		return (recetasFiltradas)

	}

	def HashSet<Receta> puedeVer(Repositorio_Receta repositorio) {

		var List<Receta> recetas = new ArrayList<Receta>
		var HashSet<Receta> setRecetas = new HashSet<Receta>

		recetas = this.decimeTodasTusRecetas(repositorio)

		for (item : getFiltros) {
			recetas = this.filtroRec(recetas, item)
		}

		for (item : recetas) {
			setRecetas.add(item)
		}

		return setRecetas
	}

	def List<Receta> filtroRec(List<Receta> listaDeRecetas, DecoratorUsuarioCondicionesBusqueda filtro) {
		var List<Receta> recetas = new ArrayList<Receta>
		recetas = listaDeRecetas
		recetas = filtro.filtrarRecetasSegunCriterio1(listaDeRecetas, this)
		return recetas
	}

	 def Iterable<Receta> ordenarRecetasPorProcesoPosterior(List<Receta> recetas){
    	
    var Iterable<Receta> recetasFiltradas = new ArrayList<Receta>
    
	for(item:recetas)
		{
		recetasFiltradas = recetas
		}
	
    for (item: getProcesamientos){
     recetasFiltradas = this.procesoRecursivo(recetasFiltradas,item)
     }
    
 
    return recetasFiltradas
    }
	
	 private def Iterable<Receta> procesoRecursivo(Iterable<Receta> listaRecetas,DecoratorProcesamientoPosterior proceso) {
    	var Iterable<Receta> Rece = new ArrayList<Receta>
    	Rece = listaRecetas
    	Rece = proceso.procesar(listaRecetas)
    	return Rece.toList()
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