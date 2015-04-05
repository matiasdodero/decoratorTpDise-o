package ar.edu.frba.anothercat

import org.junit.Test
import org.junit.Assert

class UsuarioTest {
	
	@Test
	
	def void creacionUsuario (){
		val matias = new Usuario()
		matias.peso=70
		matias.altura=1.71
		println(matias.calcularImc())
		Assert.assertEquals(23.938989774631512,matias.calcularImc(),23.938989774631512)
		
		
	}
	
	
}