package ar.edu.frba.anothercat

class Usuario {
	
	public int peso
	public double altura
	double imc
	
	def double calcularImc ()
	{
		imc = peso/(altura*altura)
	}
	
	
}