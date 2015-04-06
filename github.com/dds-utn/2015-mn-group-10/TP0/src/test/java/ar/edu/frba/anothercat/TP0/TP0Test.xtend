package ar.edu.frba.anothercat.TP0

import org.junit.Test
import org.junit.Assert

class TP0Test {

	@Test
	def void saberIMC(){
		val unapers = new Persona();
		
		unapers.peso = 50;
		
		unapers.altura = 1.7f;
		
		System.out.println(unapers.darIMC());	
		System.out.println(unapers.QueSignificaMiIMC());
		
		Assert.assertEquals(17.301037,unapers.darIMC(),23.483477)
		
	}
	
		@Test
	def void saberIMC2(){
		val unapers = new Persona();
		
		unapers.peso = 83;
		
		unapers.altura = 1.88f;
		
		System.out.println(unapers.darIMC());	
		System.out.println(unapers.QueSignificaMiIMC());

		Assert.assertEquals(23.483477,unapers.darIMC(),23.483477);
	}
}