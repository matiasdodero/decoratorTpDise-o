package ar.edu.frba.anothercat.TP0

class Persona {
	public int peso;
	public float altura;
	
	def float darIMC() {
		return (peso / (altura * altura))
	}
	
	def String QueSignificaMiIMC() {
		switch (this) {
			case (darIMC() < 16): {
			   return "delgadez severa"; 
			}
			case (darIMC() >= 16  &&  darIMC() < 16.99): {			 
			   return "delgadez moderada";
			}
 			case (darIMC() >=17  &&  darIMC() < 18.50): {
			   return "delgadez aceptable"; 
			}
			case (darIMC() >= 18.50  &&  darIMC() < 25): {			 
			   return "Peso Normal";
			}
 			case (darIMC() >=25  &&  darIMC() < 30): {
			   return "Sobrepeso"; 
			}
			case (darIMC() >= 30  &&  darIMC() < 35): {			 
			   return "Obeso: tipo I";
			}
 			case (darIMC() >=35  &&  darIMC() < 40): {
			   return "Obeso: tipo II"; 
			}
			case (darIMC() >=40): {
			   return "Obeso: tipo III"; 
			}
			default: {			 
			   return "indice no reconocido";
			}
		}
	}
}