package ar.edu.frba.anothercat

import org.junit.Test
import org.junit.Assert
import org.junit.Before

class UsuarioTest {
	
	Usuario matias
	Usuario emi
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
	}
	
	@Test
	
	def void creacionUsuario (){
		
		Assert.assertEquals(23.938989774631512,matias.calcularImc(),0.1)
		
		
	}
		
	@Test
	
	def void creacionUsuarioEmi (){
		
		Assert.assertEquals(22.59814049586776,emi.calcularImc(),0.1)
	}
	
}