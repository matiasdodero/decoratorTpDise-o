package ar.edu.frba.anothercat

import org.junit.Test
import org.junit.Assert
import org.junit.Before

class TestUsuario {
	
	String CondPreex
	String nombreIngrediente
	Usuario matias

	@Before
	def void init(){
	    matias = new Usuario => [
	    	nombre = "mati"
	    	fech = "05-29-1989"
	    	rutina = "dsad"
			peso=60
			altura=1.71
			sexo = "m"
			rutina = "INTENSIVO"
		//	agregarCondicion(hiperten) 
		//	agregarCondicion(diabe)
			agregarCondicion(vegano) 
			agregarPrefer(manzana)
			agregarPrefer(pollo)
		] 

	}
	
	Diabetico diabe = new Diabetico => [
		CondPreex = "diabetico"
	]
	
	Hipertenso hiperten = new Hipertenso => [
		CondPreex = "hipertenso"
	]
	
	Vegano vegano = new Vegano => [
		CondPreex = "vegano"
	]
	
	Ingrediente pollo = new Ingrediente => [
		setNombreIngrediente("pollo") 		
		setTipoIngrediente("carne")	
	]
	
	Ingrediente manzana = new Ingrediente => [
		setNombreIngrediente("manzana")	
		setTipoIngrediente("fruta")
	]	
	

	@Test
	def void creacionUsuario () 
	{
		Assert.assertEquals(true,matias.sosValido())
	//	Assert.assertEquals(true,matias.seguisDietaSaludable())
	//	Assert.assertEquals(20.5,matias.calcularImc(),1)
	}
	

}