package ar.edu.frba.anothercat

import org.junit.Test
import org.junit.Assert
import org.junit.Before

class TestUsuario {
	
	Usuario matias

	@Before
	def void init(){
	    matias = new Usuario => [
	    	nombre = "mati"
	    	fech = "05-29-2015"
	    	rutina = "dsad"
			peso=60
			altura=1.71
			sexo = "m"
			rutina = "INTENSIVO"
			agregarCondicion(hiperten) 
			agregarCondicion(diabe)
		//	agregarCondicion(vegano) 
			agregarPrefer(manzana)
		//	agregarPrefer(pollo)
		] 

	}
	
	C_Pr diabe = new C_Pr => [
		condicion_preexistente = "diabetico"
	]
	
	C_Pr hiperten = new C_Pr => [
		condicion_preexistente = "hipertenso"
	]
	
	C_Pr vegano = new C_Pr => [
		condicion_preexistente = "vegano"
	]
	
	Alimentos pollo = new Alimentos => [
		nombreAlim = "pollo"		
	]
	
	Alimentos manzana = new Alimentos => [
		nombreAlim = "manzana"		
	]

	@Test
	def void creacionUsuario () 
	{
		Assert.assertEquals(true,matias.sosValido())
		Assert.assertEquals(true,matias.seguisDietaSaludable())
		Assert.assertEquals(20.5,matias.calcularImc(),1)
	}
	

}