package ar.edu.frba.anothercat

import org.junit.Test
import org.junit.Assert
import org.junit.Before

class TestUsuario2 {
	Usuario pepe

	@Before
	def void init(){
	    pepe = new Usuario => [
			nombre = "Gervasio"
			sexo = "m"
			fech = "01-05-1970"
			altura = 1.78
			peso = 78
			rutinaE = tipoRutina.NADA
		]
	}
	@Test
	def usuarioSinNombre(){
		
		Assert.assertTrue(pepe.sosValido())
		
		//Falta Nombre
		pepe.nombre = null
		Assert.assertFalse(pepe.sosValido())
	}
	
	@Test
	def usuarioSinPeso(){
		Assert.assertTrue(pepe.sosValido())
		
		//Falta Peso
		pepe.peso = 0
		Assert.assertFalse(pepe.sosValido())
	}

	@Test
	def usuarioSinAltura(){
		Assert.assertTrue(pepe.sosValido())
		
		//Falta Altura
		pepe.altura = 0
		Assert.assertFalse(pepe.sosValido())
	}

	@Test
	def usuarioSinFechaDeNacimiento(){
		Assert.assertTrue(pepe.sosValido())
		
		//Falta Fecha de Nacimiento
		pepe.altura = 0
		Assert.assertFalse(pepe.sosValido())
	}
	
	@Test
	def usuarioConNombreCorto(){
		Assert.assertTrue(pepe.sosValido())
		
		//Cambiamos el nombre
		pepe.nombre = "Ari"
		Assert.assertFalse(pepe.sosValido())
	}
	
	@Test
	def usuarioDiabeticoSinSexoConPreferencia(){
		Assert.assertTrue(pepe.sosValido())
		
		//Le decimos que es diabetico
		pepe.agregarCondicion(new Diabetico)
		//Agregamos una preferencia
		pepe.agregarPrefer(new Ingrediente => [nombreIngrediente = "Manzana" tipoIngrediente = "Fruta" calorias = 2])
		
		//No tiene sexo Pepe
		pepe.sexo = null
		Assert.assertFalse(pepe.sosValido())
	}
	
	@Test
	def usuarioDiabeticoConSexoSinPreferencias(){
		Assert.assertTrue(pepe.sosValido())
		
		//Le decimos que es diabetico
		pepe.agregarCondicion(new Diabetico)
		Assert.assertFalse(pepe.sosValido())
		
		//Le agregamos una preferencia
		pepe.agregarPrefer(new Ingrediente => [nombreIngrediente = "Manzana" tipoIngrediente = "Fruta" calorias = 2])
		
		Assert.assertTrue(pepe.sosValido())
	}
}