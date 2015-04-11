package ar.edu.frba.anothercat

import org.junit.Test
import org.junit.Assert
import org.junit.Before

class UsuarioTest {
	
	Usuario matias
	Usuario emi
	@Before
	
	def void init(){
		
		matias = new Usuario
		emi = new Usuario
	}
	
	@Test
	
	def void creacionUsuario (){
		
		matias.peso=70
		matias.altura=1.71
		
		Assert.assertEquals(23.938989774631512,matias.calcularImc(),0.1)
		
		
	}
		
	@Test
	
	def void creacionUsuarioEmi (){
		
		emi.peso=70
		emi.altura=1.76
		Assert.assertEquals(22.59814049586776,emi.calcularImc(),0.1)
	}
	
}