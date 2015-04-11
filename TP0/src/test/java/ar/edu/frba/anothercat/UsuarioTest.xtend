package ar.edu.frba.anothercat

import org.junit.Test
import org.junit.Assert
import org.junit.Before

class UsuarioTest {
	
	Usuario matias
	Usuario emi
	Usuario dani
	Usuario pablo
	
	@Before
	def void init(){
		
		matias = new Usuario => [
			peso=70
			altura=1.71
		]
		emi = new Usuario => [
			peso=70
			altura=1.76
		]
		
		dani = new Usuario => [
			peso=70
			altura=1.69
		]
		
		pablo = new Usuario => [
			peso = 70
			altura = 1.72
		]
	}
	
	@Test
	def void creacionUsuario (){
		Assert.assertEquals(23.938989774631512,matias.calcularImc(),0.1)
				
	}
		
	@Test
	def void creacionUsuarioEmi (){
		Assert.assertEquals(22.59814049586776,emi.calcularImc(),0.1)
	}
	
	@Test
	def void creacionUsuarioDani (){
		Assert.assertEquals(24.50894576520429,dani.calcularImc(),0.1)
	}
	
	@Test
	def void creacionUsuarioPablo (){
		Assert.assertEquals(23.661, pablo.calcularImc(),0.1) //Este test tiene que dar correcto
	}
	
	@Test
	def void creacionUsuarioPablo_testIncorrecto (){
		Assert.assertEquals(23.861, pablo.calcularImc(),0.1) //Este test tiene que dar incorrecto 
	}
}