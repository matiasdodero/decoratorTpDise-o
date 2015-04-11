package ar.edu.frba.anothercat

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Usuario {
	
	int peso
	double altura
	double imc
	
	def double calcularImc ()
	{
		imc = peso/(altura*altura)
	}
		
}

