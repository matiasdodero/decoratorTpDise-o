package ar.edu.frba.anothercat


import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList
import java.util.Date
import java.text.SimpleDateFormat
import java.util.Calendar

@Accessors
class Usuario {
	
	String nombre
	String sexo
	String fech
	double altura
	int peso
	List<CondicionPreexistente> precondiciones = new ArrayList<CondicionPreexistente>	
	List<Ingrediente> preferencias = new ArrayList<Ingrediente>
	List<Ingrediente> disgustos = new ArrayList<Ingrediente>
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
		 if (precondiciones.exists[condi | condi.dameCondicion() == "diabetico"  
		 	&& sexo == null ] == true
			)
         {  System.out.println("dio en 1")
         	return false
         }
         if (precondiciones.exists[condi | (condi.dameCondicion() == "diabetico" 
         							&& preferencias.size < 1) || 
         							(condi.dameCondicion() == "hipertenso"  
         							&& preferencias.size < 1)] == true)
         {  System.out.println("dio en 2")
         	return false
         }
         
         if (precondiciones.exists[condi | (condi.dameCondicion() == "vegano")
         							&& preferencias.exists [unaPre | unaPre.dameNombre() == "pollo" ||
         														 unaPre.dameNombre() == "carne" ||
         														 unaPre.dameNombre() == "chivito" ||
         														 unaPre.dameNombre() == "chori" ]
         ] == true)
         {  System.out.println("dio en 3")
         	return false
         }
         
         if (validaFechNacim() == false )  
         
         {  System.out.println("dio en 4")
         	return false
         }
         
         
         //System.out.println(convertirFecha(fech))
         //System.out.println(dameElDiaDeHoy())
         

		return true	
	}
	
	    def Date convertirFecha(String unafech) {
		var SimpleDateFormat formatoDelTexto
		
		formatoDelTexto = new SimpleDateFormat("MM-dd-yyyy");
		var Date fecha
        
		fecha = formatoDelTexto.parse(unafech);
		
		return fecha
	}
	
		def Date dameElDiaDeHoy() {

		var SimpleDateFormat formatoDelTexto
		var Calendar cal  = Calendar.getInstance();
		
		formatoDelTexto = new SimpleDateFormat("MM-dd-yyyy");
        
		var Date fecha
        
		fecha = formatoDelTexto.parse(formatoDelTexto.format(cal.getTime()));
		return fecha
	}
	
	
	
	def public boolean validaFechNacim() {
          if (this.convertirFecha(fech).before(dameElDiaDeHoy())) {
          	return true
          }
          else {return false}

	    }

	
	def public void agregarCondicion(CondicionPreexistente unaCond) {

		precondiciones.add(unaCond)

	}
	
	
	def public void agregarPrefer(Ingrediente unaPreferencia) {

		preferencias.add(unaPreferencia)

	}	
	
	def double calcularImc()
	{
		return peso/(altura*altura)
	}
	
	def public boolean sosHipertensoNoSaludable()
	    {
	    	if (precondiciones.exists[condi | condi.dameCondicion() == "hipertenso"  
         							&& rutina != "INTENSIVO"] == true) {return true}
         	
	    }
	    
	def public boolean sosDiabeticoNoSaludable()
	    {
	    	if (precondiciones.exists[condi | condi.dameCondicion() == "diabetico"  
         							&& (rutina != "INTENSIVO" && peso >= 70)] == true) 
         							{return true}
         	
	    }
	    
    def public boolean sosVeganoNoSaludable()
	    {
	    	if (precondiciones.exists[condi | condi.dameCondicion() == "vegano"  
         							&& (preferencias.exists[unaPre | unaPre.dameTipo() != "fruta"
         							] == true)] == true) 
         							{return true}
         	
	    }
	
	def public boolean seguisDietaSaludable(){
		if (this.calcularImc > 18 && this.calcularImc < 30 && precondiciones.size < 1) {
			return true
		} 
		else
		{
		 if (this.sosHipertensoNoSaludable()
		 	|| this.sosDiabeticoNoSaludable()
		    || this.sosVeganoNoSaludable())
		  {return false}
		}
		return true
	}
	
 }


