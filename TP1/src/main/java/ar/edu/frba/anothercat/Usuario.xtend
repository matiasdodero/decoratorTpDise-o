package ar.edu.frba.anothercat

import java.text.SimpleDateFormat
import java.util.ArrayList
import java.util.Calendar
import java.util.Date
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

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
	List<Receta> misRecetas = new ArrayList<Receta>
//	String rutina
	private tipoRutina rutinaE
	
	def boolean sosValido() {

		if ((nombre == null) || (peso == 0) || (altura == 0) || (fech == null) || (rutinaE.equals(null))) {
			return false
		}
		if (nombre.length() < 4)
		{
			return false
		}
		if (precondiciones.isEmpty() == false)
		{
			if (precondiciones.forall [precondicion | precondicion.cumpleValidacion(this)] == false)
			{return false} 		
		}
         
         if (validaFechNacim() == false )  
         
         {  System.out.println("dio en 4")
         	return false
         }

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
	
	def public boolean seguisDietaSaludable(){
		if (this.calcularImc > 18 && this.calcularImc < 30 && precondiciones.size < 1) {
			return true
		} 
		else
		{
		 return precondiciones.forall [precondicion | precondicion.subsanasteCondicionesPreEx(this)]
		}
	}
	
	def boolean puedoVerReceta(Receta unaReceta){
		
		return (unaReceta.esPublica || this.misRecetas.exists[unaRec| unaRec == unaReceta] )
		
	}
	 def boolean puedoModificarReceta(Receta unaReceta){
	 	return ( unaReceta.esPublica || !(unaReceta.esPublica) && this.misRecetas.exists[unaRec| unaRec == unaReceta] )
	}
	
	def public agregarReceta(Receta unaReceta) {
		
		var Receta unaNuevaR = new Receta
		
		unaNuevaR = unaReceta				
			
		if (unaReceta.validar())
		{  
			if (precondiciones.exists[unaPre | unaPre.esInadecuadaPara(unaReceta)]) 
			{	throw new NoCumpleRequisitosException("No es apto")}
			else{
				unaNuevaR.esPublica = false
				misRecetas.add(unaNuevaR)
				
			}

		}
		
	}
	
	   def void modificarNombrePlato(Receta unaReceta, String nombrePlatoAux){

		
    	if(puedoModificarReceta(unaReceta) == true){
    		
    			unaReceta.setNombrePlato(nombrePlatoAux)
    	}
    	
    	else 
    	{
    		throw new NoCumpleRequisitosException("No puede modificar la Receta ")
    	}    	
    	
    }
    
 }

   public enum tipoRutina {
   	LEVE,
	NADA,
	MEDIANO,
	INTENSIVO,
	PREINTENSIVO;   	
   }
