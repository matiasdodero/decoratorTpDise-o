package ar.edu.frba.anothercat

import java.util.List
import org.junit.Before
import org.junit.Test
import java.util.ArrayList

class TestReceta {

	Receta receta1
	Ingrediente ingrediente1
	Ingrediente ingrediente2
	Ingrediente ingrediente3
	
	
	Receta receta3
	
	RecetaSimple recetaPure
	
	Condimento condimento1
	
	
	Hipertenso hiperten
	Vegano vegano
	Diabetico diab
	
	Condimento condimento2
	
	List<CondicionPreexistente> condiciones = new ArrayList<CondicionPreexistente>
	
	

	@Before
	def void init() {
		ingrediente1 = new Ingrediente => [
			setNombreIngrediente("carne")
			setCalorias(400)
		]

		ingrediente2 = new Ingrediente => [
			setNombreIngrediente("agua")
			setCalorias(0)
		]
		
		condimento1 = new Condimento => [
			setNombreCondimento("azucar")
			setCantidad(120)
		]
		
		condimento2 = new Condimento => [
			setNombreCondimento("sal")
			setCantidad(5)
			
		]
		
		ingrediente3 = new Ingrediente =>[
			setNombreIngrediente("pure")
			setCalorias(200)
		]
		
		recetaPure = new RecetaSimple =>[
			setNombrePlato("pure")
			agregarIngrediente(ingrediente3)
		]
		
		
		
		hiperten = new Hipertenso
		vegano = new Vegano
		diab = new Diabetico
		
		receta1 = new Receta		
		receta3 = new Receta
		
		condiciones.add(hiperten)
		condiciones.add(vegano)
		condiciones.add(diab)

	}

	@Test
	def void creacionReceta1() {

		receta1  => [
			agregarIngrediente(ingrediente1)
			sumarCalorias(ingrediente1.calorias)
			validar()
		]
		

	}
	
	@Test
	def void otraReceta(){
		receta3 =>[
			agregarIngrediente(ingrediente2)
			agregarIngrediente(ingrediente1)
			agregarCondimento(condimento1)
			agregarCondimento(condimento2)
			recetaInadecuadaPara(condiciones)
			
		]
		
		
	}
	
	@Test
	def void agregarRecetaSimpleAOtraReceta(){
		
		receta1.agregarIngredientesDeRecetaSimple(recetaPure)
		
	}
	

}