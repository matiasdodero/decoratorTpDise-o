package ar.edu.frba.anothercat

import org.junit.Test
import org.junit.Assert
import org.junit.Before

class UsuarioTest {
	
	Usuario matias
	
	@Before
	
	def void init(){
		matias = new Usuario
	}
	
	@Test
	
	def void creacionUsuario (){
		
		matias.peso=70
		matias.altura=1.71
		
		Assert.assertEquals(23.938989774631512,matias.calcularImc(),0.1)
		
		
	}
	
	
}