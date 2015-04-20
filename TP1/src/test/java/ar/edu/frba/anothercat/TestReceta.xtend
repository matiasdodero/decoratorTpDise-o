package ar.edu.utn.frba.anothercat

import org.junit.Before
import org.junit.Test

class TestReceta {

	Receta receta1
	Ingrediente ingrediente1
	Ingrediente ingrediente2
	
	Receta receta2

	@Before
	def void init() {
		ingrediente1 = new Ingrediente => [
			nombre = "carne"
			calorias = 400
		]

		ingrediente2 = new Ingrediente => [
			nombre = "agua"
			calorias = 0
		]
		
		receta1 = new Receta
		receta2 = new Receta

	}

	@Test
	def void creacionReceta1() {

		receta1  => [
			agregarIngrediente(ingrediente1)
			sumarCalorias(ingrediente1.calorias)
		]
		receta1.validar()

	}
	
	@Test
	def void creacionRecetaQueFalla(){
		receta2  =>[
			agregarIngrediente(ingrediente2)
			sumarCalorias(ingrediente2.calorias)
		]
		receta2.validar()
	}

}
