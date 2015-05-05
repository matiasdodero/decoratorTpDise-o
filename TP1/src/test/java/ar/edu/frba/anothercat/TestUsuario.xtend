package ar.edu.frba.anothercat

import org.junit.Test
import org.junit.Assert
import org.junit.Before

class TestUsuario {
	
	//String CondPreex
	String nombreIngrediente
	Usuario matias
	
	
	Ingrediente ingrediente1
	Ingrediente ingrediente2
	
	Condimento condimento1
	Condimento condimento2
	Condimento condimento3
	
	Receta receta1
	Receta receta2
	Receta receta3
	
	Grupo PinPalls

	@Before
	def void init(){
	    matias = new Usuario => [
	    	nombre = "matias"
	    	fech = "05-29-1989"
//	    	rutina = "dsad"
			peso=90
			altura=1.41
			sexo = "m"
		//	agregarCondicion(hiperten) 
			agregarCondicion(diabe)
		//	agregarCondicion(vegano) 
			agregarPrefer(manzana)
		//	agregarPrefer(pollo)
			agregarPrefer(lechuga)
		//	agregarPrefer(carne)
			rutinaE = tipoRutina.PREINTENSIVO
		] 
		
		ingrediente1 = new Ingrediente => [
			setNombreIngrediente("carne")
			setCalorias(400)
		]

		ingrediente2 = new Ingrediente => [
			setNombreIngrediente("agua")
			setCalorias(20)
		]
		
		condimento1 = new Condimento => [
			setNombreCondimento("azucar")
			setCantidad(200)
		]
		
		condimento2 = new Condimento => [
			setNombreCondimento("sal")
			setCantidad(200)
		]
		
		condimento3 = new Condimento => [
			setNombreCondimento("caldo")
			setCantidad(200)
		]
		receta1 = new Receta => [
		nombrePlato = "plato de receta 1"
		sumarCalorias(100)
		esPublica = true
		agregarIngrediente(ingrediente1)
		agregarCondimento(condimento1)
		//agregarCondimento(condimento2)
		//agregarCondimento(condimento3)
		
			]	
			
		receta2 = new Receta =>[
		    nombrePlato = "plato de receta 2"
			setEsPublica(true)
			sumarCalorias(100)
			esPublica = true
			agregarIngrediente(ingrediente1)
		]
		
		receta3 = new Receta =>[
			setEsPublica(false)
		]
		
		PinPalls = new Grupo

	}
	
	Diabetico diabe = new Diabetico 
	
	Hipertenso hiperten = new Hipertenso 
	
	Vegano vegano = new Vegano 
	
	Ingrediente pollo = new Ingrediente => [
		setNombreIngrediente("pollo") 		
		setTipoIngrediente("carne")	
	]
	
	Ingrediente carne = new Ingrediente => [
		setNombreIngrediente("carne") 		
		setTipoIngrediente("carne")	
	]
	
	Ingrediente manzana = new Ingrediente => [
		setNombreIngrediente("manzana")	
		setTipoIngrediente("fruta")
	]	
	
	Ingrediente lechuga = new Ingrediente => [
		setNombreIngrediente("lechuga")	
		setTipoIngrediente("verdura")
	]
	
	
	
	

	@Test
	def void creacionUsuario () 
	{
		
	matias.agregarReceta(receta1)
	/*matias.misRecetas.forEach[unaRec | 
			System.out.println(unaRec.getNombrePlato)
			unaRec.ingredientes.forEach [unIngr | 
			System.out.println(unIngr.getNombreIngrediente)
			System.out.println(unIngr.getTipoIngrediente)
			]
			unaRec.condimentos.forEach [unCond | 
			System.out.println(unCond.getNombre)
			System.out.println(unCond.getCantidad)
			]
			matias.precondiciones.forEach[unaPre |
				System.out.println(unaPre.esInadecuadaPara(unaRec))
			]]*/
	//	Assert.assertEquals(true,matias.sosValido())
	//	Assert.assertEquals(true,matias.seguisDietaSaludable())
	//	Assert.assertEquals(20.5,matias.calcularImc(),1)
	}
	
	
	@Test
	def void averiguarIMC(){
		Assert.assertEquals(45.2,matias.calcularImc(),0.1)
	}
	
	@Test
	def void usuarioSigueRutinaSaludable(){
		Assert.assertTrue(matias.seguisDietaSaludable())
	}
	
	@Test
	def void puedoVerRecetaPublica(){
		matias=>[
			Assert.assertTrue(puedoVerReceta(receta2))
		]
	}
	
	@Test
	def void puedoModificarRecetaPublica(){
		matias =>[
			Assert.assertTrue(puedoModificarReceta(receta2))
		]
	}
	
	@Test
	def void PuedoVerRecetaPrivada(){
		matias =>[
			Assert.assertFalse(puedoVerReceta(receta3))
		]
	}
	
	@Test
	def void puedoModificarRecetaPrivada(){
		matias =>[
			Assert.assertFalse(puedoModificarReceta(receta3))
		]
	}
	
	@Test
	def void ModificoRecetaPrivada(){
		matias.agregarReceta(receta1)
		/*System.out.println(receta1.getNombrePlato)
		System.out.println(receta1.getTotalCalorias)
		System.out.println(receta1.getDificultad)
		System.out.println(receta1.esPublica)
		receta1.ingredientes.forEach [unIngr | 
			System.out.println(unIngr.getNombreIngrediente)
			System.out.println(unIngr.getTipoIngrediente)
			]
		receta1.condimentos.forEach [unCond | 
			System.out.println(unCond.getNombreCondimento)
			System.out.println(unCond.getCantidad)
			]
		matias.misRecetas.forEach[unaR | 
 		    System.out.println(unaR.getNombrePlato)
	        System.out.println(unaR.getTotalCalorias)
		    System.out.println(unaR.getDificultad)
		    System.out.println(unaR.esPublica)
		    unaR.ingredientes.forEach [unIngr | 
			   System.out.println(unIngr.getNombreIngrediente)
			   System.out.println(unIngr.getTipoIngrediente)
			]
		    unaR.condimentos.forEach [unCond | 
		  	   System.out.println(unCond.getNombreCondimento)
			   System.out.println(unCond.getCantidad)
			]
		] */
		matias.modificarNombrePlato(receta1,"elPlato")
		matias.modificarTotalCalorias(receta1,100)
		matias.modificarDificultad(receta1,"facil")
		matias.modificarIngredientesReceta(receta1,ingrediente2)
		matias.modificarCondimentosReceta(receta1,condimento2)
		/*System.out.println(receta1.getNombrePlato)
		System.out.println(receta1.getTotalCalorias)
		System.out.println(receta1.getDificultad)
		System.out.println(receta1.esPublica)
		receta1.ingredientes.forEach [unIngr | 
			System.out.println(unIngr.getNombreIngrediente)
			System.out.println(unIngr.getTipoIngrediente)
			]
		receta1.condimentos.forEach [unCond | 
			System.out.println(unCond.getNombreCondimento)
			System.out.println(unCond.getCantidad)
			]
		matias.misRecetas.forEach[unaR | 
 		    System.out.println(unaR.getNombrePlato)
	        System.out.println(unaR.getTotalCalorias)
		    System.out.println(unaR.getDificultad)
		    System.out.println(unaR.esPublica)
		    unaR.ingredientes.forEach [unIngr | 
			   System.out.println(unIngr.getNombreIngrediente)
			   System.out.println(unIngr.getTipoIngrediente)
			]
		    unaR.condimentos.forEach [unCond | 
		  	   System.out.println(unCond.getNombreCondimento)
			   System.out.println(unCond.getCantidad)
			]
		] */
		
	}
	

	@Test
	def void validarUsuario(){

		matias.sosValido()
	}
	
	@Test
	def void validameAlGrupitoConUnaReceta(){

	PinPalls.agregarReceta(receta1)
	}
	
	@Test
	def void validameAlGrupitoConUnaUsuario(){

	PinPalls.agregarUsuario(matias)
	}
	
	@Test
	def void validameAlGrupitoenGral(){

	PinPalls.agregarReceta(receta1)
	PinPalls.agregarUsuario(matias)
	PinPalls.misRecetas.forEach[u | System.out.println(u.getNombrePlato)]
	PinPalls.misUsuarios.forEach[u | System.out.println(u.getNombre)]
	}
	
	@Test
	def void validameAlGrupitoenGral2(){

	PinPalls.agregarUsuario(matias)
	PinPalls.agregarReceta(receta1)
	PinPalls.misRecetas.forEach[u | System.out.println(u.getNombrePlato)]
	PinPalls.misUsuarios.forEach[u | System.out.println(u.getNombre)]
	}
	
	@Test
	def void validameAlGrupitoenGral3(){

	PinPalls.agregarUsuario(matias)
	PinPalls.agregarReceta(receta2)
	PinPalls.misRecetas.forEach[u | System.out.println(u.getNombrePlato)]
	PinPalls.misUsuarios.forEach[u | System.out.println(u.getNombre)]
	}
	
	
}
