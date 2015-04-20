package ar.edu.frba.anothercat


import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList
import java.util.Date
import java.text.SimpleDateFormat

@Accessors
class Usuario {
	
	String nombre
	String sexo

	double altura
	int peso
	List<C_Pr> precond = new ArrayList<C_Pr>
	
	String fech
	List<Alimentos> preferen = new ArrayList<Alimentos>
	List<Alimentos> disgusta = new ArrayList<Alimentos>

	String rutina
	
	
	def boolean sosValido() {
		var int error = 0

		if ((nombre == null) || (peso == 0) || (altura == 0) || (fech == null) || (rutina == null)) {
			return false
		}
		if (nombre.length() < 4)
		{
			return false
		}
		 if (precond.exists[condi | condi.dameCondicion() == "diabetico"  
		 	&& sexo == null ] == true
			)
         {  System.out.println("dio en 1")
         	return false
         }
         if (precond.exists[condi | (condi.dameCondicion() == "diabetico" 
         							&& preferen.size < 1) || 
         							(condi.dameCondicion() == "hipertenso"  
         							&& preferen.size < 1)] == true)
         {  System.out.println("dio en 2")
         	return false
         }
         
         if (precond.exists[condi | (condi.dameCondicion() == "vegano")
         							&& preferen.exists [unaPre | unaPre.dameNombre() == "pollo" ||
         														 unaPre.dameNombre() == "carne" ||
         														 unaPre.dameNombre() == "chivito" ||
         														 unaPre.dameNombre() == "chori" ]
         ] == true)
         {  System.out.println("dio en 3")
         	return false
         }
         
         System.out.println(convertirFecha(fech))
         
         

		return true	
	}
	
	def Date convertirFecha(String unafech) {
		var SimpleDateFormat formatoDelTexto
		
		formatoDelTexto = new SimpleDateFormat("mm-dd-yyyy");
		var Date fecha
        
		fecha = formatoDelTexto.parse(unafech);
		
		return fecha
	}

	
	def public void agregarCondicion(C_Pr unaCond) {

		precond.add(unaCond)

	}
	
	
	def public void agregarPrefer(Alimentos unaPrefe) {

		preferen.add(unaPrefe)

	}	
	
 }


@Accessors
class C_Pr {
	String condicion_preexistente	
	
	def String dameCondicion() {
		return condicion_preexistente
	}
}

@Accessors
class Alimentos {
	String nombreAlim	
	
	def String dameNombre() {
		return nombreAlim
	}
}
