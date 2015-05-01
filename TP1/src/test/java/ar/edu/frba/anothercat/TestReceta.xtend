package ar.edu.frba.anothercat

import java.util.List
import org.junit.Before
import org.junit.Test
import java.util.ArrayList
import org.junit.Assert

class TestReceta {

	Receta receta1
	Ingrediente ingrediente1
	Ingrediente ingrediente2
	Ingrediente ingrediente3
	Ingrediente ingrediente4
	Ingrediente ingrediente5
	Ingrediente ingrediente6
	Ingrediente ingrediente7	
	
	Receta receta3
	
	//RecetaSimple recetaPure
	
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
			setCalorias(10)
		]

		ingrediente2 = new Ingrediente => [
			setNombreIngrediente("agua")
			setCalorias(10)
		]
		
		ingrediente4 = new Ingrediente => [
			setNombreIngrediente("pollo")
			setCalorias(10)
		]
		
		ingrediente5 = new Ingrediente => [
			setNombreIngrediente("pescado")
			setCalorias(10)
		]
		
		ingrediente6 = new Ingrediente => [
			setNombreIngrediente("berenjena")
			setCalorias(10)
		]
		
		ingrediente7 = new Ingrediente => [
			setNombreIngrediente("pan")
			setCalorias(10)
		]
		
		condimento1 = new Condimento => [
			setNombreCondimento("azucar")
			setCantidad(10)
		]
		
		condimento2 = new Condimento => [
			setNombreCondimento("sal")
			setCantidad(15)
			
		]
		
		ingrediente3 = new Ingrediente =>[
			setNombreIngrediente("pure")
			setCalorias(20)
		]
		
		/*recetaPure = new RecetaSimple =>[
			setNombrePlato("pure")
			agregarIngrediente(ingrediente3)
		]*/
		
		
		
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
	def void decimeSiSosSimple(){
		
		Assert.assertTrue(receta1.sosSimple())
		
	}
	
	@Test
	def void decimeSiSosCompuesta(){
		
		receta1.agregarmeReceta(receta3)
		Assert.assertFalse(receta1.sosSimple())
		
	}
	
	@Test
	def void decimeTusIngredientesTotales(){
		
		receta1  => [
			agregarIngrediente(ingrediente1)
			agregarIngrediente(ingrediente2)
			sumarCalorias(ingrediente1.calorias)
			validar()
		]
		
		//receta1.decimeTusIngredientesTotales.forEach[unI | System.out.println(unI.getNombreIngrediente)]
		
	}

	@Test
	def void decimeTusIngredientesTotales2(){
		
		receta1  => [
			agregarIngrediente(ingrediente1)
			agregarIngrediente(ingrediente2)
			sumarCalorias(ingrediente1.calorias)
			validar()
		]
		
		receta3  => [
			agregarIngrediente(ingrediente3)
			agregarIngrediente(ingrediente4)
			sumarCalorias(ingrediente2.calorias)
			validar()
		]
		
		receta1.agregarmeReceta(receta3)
		receta1.decimeTusIngredientesTotales.forEach[unI | System.out.println(unI.getNombreIngrediente)]
		
	}	

}