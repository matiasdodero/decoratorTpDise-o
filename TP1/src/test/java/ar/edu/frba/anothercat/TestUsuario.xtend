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
	    	fech = "04-18-2010"
	    	rutina = "dsad"
			peso=70
			altura=1.71
			sexo = "m"
			agregarCondicion(hiperten) 
			agregarCondicion(diabe)
			agregarCondicion(vegano) 
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
	}
	

}