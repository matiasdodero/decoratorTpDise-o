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
	Receta receta2
	Receta receta4
	Receta receta5
	Receta receta6
	
	
	//RecetaSimple recetaPure
	
	Condimento condimento1
	Condimento condimento2
	Condimento condimento3
	Condimento condimento4
	Condimento condimento5
	Condimento condimento6
	
	Hipertenso hiperten
	Vegano vegano
	Diabetico diab
	

	
	List<CondicionPreexistente> condiciones = new ArrayList<CondicionPreexistente>
	
	

	@Before
	def void init() {
		ingrediente1 = new Ingrediente => [
			setNombreIngrediente("carne")
			setCalorias(10)
		]

		ingrediente2 = new Ingrediente => [
			setNombreIngrediente("agua")
			setCalorias(15)
		]
		
		ingrediente3 = new Ingrediente =>[
			setNombreIngrediente("pure")
			setCalorias(20)
		]
		
		ingrediente4 = new Ingrediente => [
			setNombreIngrediente("pollo")
			setCalorias(25)
		]
		
		ingrediente5 = new Ingrediente => [
			setNombreIngrediente("pescado")
			setCalorias(30)
		]
		
		ingrediente6 = new Ingrediente => [
			setNombreIngrediente("berenjena")
			setCalorias(35)
		]
		
		ingrediente7 = new Ingrediente => [
			setNombreIngrediente("pan")
			setCalorias(40)
		]
		
		condimento1 = new Condimento => [
			setNombreCondimento("azucar")
			setCantidad(10)
		]
		
		condimento2 = new Condimento => [
			setNombreCondimento("sal")
			setCantidad(15)
			
		]
		
		condimento3 = new Condimento => [
			setNombreCondimento("aceite")
			setCantidad(150)
			
		]
		
		condimento4 = new Condimento => [
			setNombreCondimento("vinagre")
			setCantidad(150)
			
		]
		
		condimento5 = new Condimento => [
			setNombreCondimento("harina")
			setCantidad(150)
			
		]
		
		condimento6 = new Condimento => [
			setNombreCondimento("levadura")
			setCantidad(150)
			
		]
		

		

		
		
		
		hiperten = new Hipertenso
		vegano = new Vegano
		diab = new Diabetico
		
		receta1 = new Receta		
		receta2 = new Receta
		receta3 = new Receta
		receta4 = new Receta
		receta5 = new Receta
		receta6 = new Receta
		
		condiciones.add(hiperten)
		condiciones.add(vegano)
		condiciones.add(diab)
		
		receta1  => [
			agregarIngrediente(ingrediente1)
			agregarIngrediente(ingrediente2)
			agregarCondimento(condimento1)
			sumarCalorias(ingrediente1.calorias)
			validar()
		]
		
		receta3  => [
			agregarIngrediente(ingrediente3)
			agregarIngrediente(ingrediente4)
			agregarCondimento(condimento2)
			sumarCalorias(ingrediente3.calorias)
			validar()
		]
		
		receta2  => [
			agregarIngrediente(ingrediente5)
			agregarCondimento(condimento3)
			agregarCondimento(condimento4)
			sumarCalorias(ingrediente5.calorias)
			validar()
		]
		
		receta4  => [
			agregarIngrediente(ingrediente6)
			agregarCondimento(condimento1)
			sumarCalorias(ingrediente6.calorias)
			validar()
		]
		
		receta5  => [
			agregarIngrediente(ingrediente7)
			agregarCondimento(condimento6)
			sumarCalorias(ingrediente7.calorias)
			validar()
		]
		
		receta6  => [
			agregarIngrediente(ingrediente1)
			agregarIngrediente(ingrediente2)
			agregarCondimento(condimento4)
			agregarCondimento(condimento5)
			sumarCalorias(ingrediente7.calorias)
			validar()
		]

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
		
		receta2.agregarmeReceta(receta6)
		receta2.agregarmeReceta(receta5)
		receta3.agregarmeReceta(receta4)
		receta3.agregarmeReceta(receta2)		
		receta1.agregarmeReceta(receta3)
		receta1.decimeTusIngredientesTotales.forEach[unI | System.out.println(unI.getNombreIngrediente)]
		
	}	
	
	@Test
	def void decimeTusIngredientesTotales3(){
		
		receta2.agregarmeReceta(receta6)
		receta2.agregarmeReceta(receta5)
		receta3.agregarmeReceta(receta4)
		receta3.agregarmeReceta(receta2)		
		receta1.agregarmeReceta(receta3)
		receta1.decimeTusCondimentosTotales.forEach[unI | System.out.println(unI.getNombreCondimento)]

		
	}	
	
	@Test
	def void decimeTusCaloriasFinales1(){
		
		System.out.println(receta1.caloriasFinales)
		
	}	
	
	@Test
	def void decimeTusCaloriasFinales2(){
		
		receta2.agregarmeReceta(receta6)
		receta2.agregarmeReceta(receta5)
		receta3.agregarmeReceta(receta4)
		receta3.agregarmeReceta(receta2)		
		receta1.agregarmeReceta(receta3)
		System.out.println(receta1.caloriasFinales)
		
	}
	
	@Test
	def void dameTuAzucarTotal1(){
		
		System.out.println(receta1.azucarTotal)
		
	}
	
	@Test
	def void dameTuAzucarTotal2(){
		
		receta2.agregarmeReceta(receta6)
		receta2.agregarmeReceta(receta5)
		receta3.agregarmeReceta(receta4)
		receta3.agregarmeReceta(receta2)		
		receta1.agregarmeReceta(receta3)
		System.out.println(receta1.azucarTotal)
		
	}

}