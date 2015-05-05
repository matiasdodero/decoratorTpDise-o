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
	List<Receta> compuestaDe = new ArrayList<Receta>

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
			throw new NoCumpleRequisitosException("La Receta no cumple con los requisitos minimos para que sea valida")
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
		if (unaReceta != this && NoloopDeRecetas(this,unaReceta)) 
		{compuestaDe.add(unaReceta)}
		else {
			throw new NoCumpleRequisitosException("Receta agregandose a ella misma")
		}
		
	}
	
	private def boolean NoloopDeRecetas(Receta unaReceta, Receta otraReceta) {
		if (otraReceta.compuestaDe.empty) 
		{return true}
		else {
			for(item: otraReceta.compuestaDe) {
		    	if (item == unaReceta) {throw new NoCumpleRequisitosException("Receta en loop agregandose")}
		    	else
		    	{NoloopDeRecetas(unaReceta,item) }
		    }
		    return true
		}
		
	}
	
	def sosSimple() {
		return (compuestaDe.empty)
	}
	
	def List<Ingrediente> decimeTusIngredientesTotales()
	{
		var List<Ingrediente> ingreAux = new ArrayList<Ingrediente>
		ingreAux = ingredientes
		
		if (compuestaDe.empty) {
			return ingreAux
		}
		else
		{
		    for(item: compuestaDe.map[unaRec | unaRec.decimeTusIngredientesTotales()]) {
		    	ingreAux.addAll(item)
		    }
		    return ingreAux	
		    
		}
			
	}
	
	def List<Condimento> decimeTusCondimentosTotales()
	{
		var List<Condimento> condAux = new ArrayList<Condimento>
		condAux = condimentos
		
		if (compuestaDe.empty) {
			return condAux
		}
		else
		{
		    for(item: compuestaDe.map[unaRec | unaRec.decimeTusCondimentosTotales()]) {
		    	condAux.addAll(item)
		    }
		    return condAux	
		    
		}
			
	}
	
	def int caloriasFinales(){
		var int ingreAux = 0
		ingreAux = (ingredientes.fold(0, [acum, unIn |acum + unIn.getCalorias]))
		
		if (compuestaDe.empty) {
			return ingreAux
		}
		else
		{
		    for(item: compuestaDe.map[unaRec | unaRec.caloriasFinales()]) {
		    	ingreAux += item
		    }
		    return ingreAux	
		    
		}
	}
	
	def int azucarTotal(){
		var int ingreAux = 0
		//var	Iterable<Condimento> condimentosAux = new ArrayList<Condimento>
		//condimentosAux = condimentos.filter[unC | unC.getNombreCondimento == "azucar"]
		for(item: condimentos) {
			if (item.getNombreCondimento == "azucar") {
				ingreAux += item.getCantidad
			}
		}
			
		if (compuestaDe.empty) {
			return ingreAux
		}
		else
		{
		    for(item: compuestaDe.map[unaRec | unaRec.azucarTotal()]) {
		    	ingreAux += item
		    }
		    return ingreAux	
		    
		}
	}
	
	def boolean tenesAzucar() {
		return (this.decimeTusCondimentosTotales.exists[unC | unC.getNombreCondimento == "azucar"] )
	}
	
	def boolean tenesSal() {
		return (this.decimeTusCondimentosTotales.exists[unC | unC.getNombreCondimento == "sal"] )	
	}
	
	def boolean tenesCaldo() {
		return (this.decimeTusCondimentosTotales.exists[unC | unC.getNombreCondimento == "caldo"] )	
	}
	
	def boolean tenesPolloCarneChivitoChori() {
		return (this.decimeTusIngredientesTotales.exists[unI | unI.getNombreIngrediente == "pollo"
															|| unI.getNombreIngrediente == "carne"
															|| unI.getNombreIngrediente == "chivito"
															|| unI.getNombreIngrediente == "chori"
		] )
		
	}
	
	def boolean sugerimeAlUsuario(Usuario unUsuario){
		for (item: this.decimeTusIngredientesTotales()){
			if (unUsuario.disgustos.exists[unD | unD == item])
			{return false}
		}
		return !(unUsuario.precondiciones.exists[unaPre | unaPre.esInadecuadaPara(this)])
 
	}
	
	def boolean sugerimeAlGrupo(Grupo unGrupo){
		var boolean encontro = false
		
		for (item: this.decimeTusIngredientesTotales()){
			if (unGrupo.preferencias.exists[unaP | unaP == item])
			{encontro = true}
		}
		if (encontro == false){return false}
		
		for (item: unGrupo.misUsuarios){
			if (item.precondiciones.exists[unaPre | unaPre.esInadecuadaPara(this)])
			{return false}
		}
 
	}
		
}
