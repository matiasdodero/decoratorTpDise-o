package ar.edu.frba.anothercat

import org.junit.Before
import org.junit.Test

class TestReceta {

	Receta receta1
	Ingrediente ingrediente1
	Ingrediente ingrediente2
	
	
	Receta receta3
	
	Condimento condimento1

	@Before
	def void init() {
		ingrediente1 = new Ingrediente => [
			nombreIngrediente = "carne"
			calorias = 400
		]

		ingrediente2 = new Ingrediente => [
			nombreIngrediente = "agua"
			calorias = 0
		]
		
		condimento1 = new Condimento => [
			nombre = "azucar"
			cantidad = 120
		]
		
		receta1 = new Receta		
		receta3 = new Receta

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
			agregarCondimento(condimento1)
//			verificarPlato()
		]
		
		
	}
	
	

}