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
	Ingrediente ingrediente3
	Ingrediente ingrediente4
	Ingrediente ingrediente5
	Ingrediente ingrediente6
	
	Condimento condimento1
	Condimento condimento2
	Condimento condimento3
	
	Repositorio_Receta Repo1
	
	Receta receta1
	Receta receta2
	Receta receta3
	Receta receta4
	
	Grupo PinPals

	@Before
	def void init(){
	    matias = new Usuario => [
	    	setNombre("matias")
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
			agregarDisgusto(ingrediente3)
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
		
		ingrediente3 = new Ingrediente => [
			setNombreIngrediente("polenta")
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
		estado = estadoReceta.Publica
		agregarIngrediente(ingrediente1)
		agregarCondimento(condimento1)
		//agregarCondimento(condimento2)
		//agregarCondimento(condimento3)
		
			]	
			
		receta2 = new Receta =>[
		    nombrePlato = "plato de receta 2"
			sumarCalorias(100)
			estado = estadoReceta.Publica
			agregarIngrediente(ingrediente2)
			agregarCondimento(condimento2)
		]
		
		receta3 = new Receta =>[
			nombrePlato = "plato de receta 3"
			estado = estadoReceta.Publica
			agregarIngrediente(ingrediente1)
		]
		
		receta4 = new Receta =>[
			nombrePlato = "plato de receta 4"
			estado = estadoReceta.Publica
			agregarIngrediente(ingrediente3)
		]
		
		PinPals = new Grupo =>[
			setNombre("PinPals")
			agregarPreferencias(ingrediente3)
			agregarPreferencias(ingrediente1)
		]
		Repo1 = new Repositorio_Receta

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

	PinPals.agregarReceta(receta1)
	}
	
	@Test
	def void validameAlGrupitoConUnaUsuario(){

	PinPals.agregarUsuario(matias)
	}
	
	@Test
	def void validameAlGrupitoenGral(){

	PinPals.agregarReceta(receta1)
	PinPals.agregarUsuario(matias)
	//PinPals.misRecetas.forEach[u | System.out.println(u.getNombrePlato)]
	//PinPals.misUsuarios.forEach[u | System.out.println(u.getNombre)]
	}
	
	@Test
	def void validameAlGrupitoenGral2(){

	PinPals.agregarUsuario(matias)
	PinPals.agregarReceta(receta1)
	PinPals.misRecetas.forEach[u | System.out.println(u.getNombrePlato)]
	PinPals.misUsuarios.forEach[u | System.out.println(u.getNombre)]
	}
	
	@Test
	def void validameAlGrupitoenGral3(){

	PinPals.agregarUsuario(matias)
	PinPals.agregarReceta(receta2)
	PinPals.misRecetas.forEach[u | System.out.println(u.getNombrePlato)]
	PinPals.misUsuarios.forEach[u | System.out.println(u.getNombre)]
	matias.misGrupos.forEach[u | System.out.println(u.getNombre)]
	}
	
	@Test
	def void sugerimeUnaRecAlUsuario(){
	//receta1.decimeTusIngredientesTotales().forEach[unI | System.out.println(unI.getNombreIngrediente)]
	//receta2.decimeTusIngredientesTotales().forEach[unI | System.out.println(unI.getNombreIngrediente)]
	Assert.assertFalse(receta1.sugerimeAlUsuario(matias))
	}
	
	@Test
	def void sugerimeUnaRecAlUsuario2(){
	//receta2.decimeTusIngredientesTotales().forEach[unI | System.out.println(unI.getNombreIngrediente)]
	Assert.assertTrue(receta2.sugerimeAlUsuario(matias))
	}
	
	@Test
	def void sugerimeUnaRecAlUsuario3(){
	//receta4.decimeTusIngredientesTotales().forEach[unI | System.out.println(unI.getNombreIngrediente)]
	Assert.assertFalse(receta4.sugerimeAlUsuario(matias))
	}
	
	@Test
	def void sugerimeUnaRecAlGrupo(){
	//receta1.decimeTusIngredientesTotales().forEach[unI | System.out.println(unI.getNombreIngrediente)]
	//receta2.decimeTusIngredientesTotales().forEach[unI | System.out.println(unI.getNombreIngrediente)]
	Assert.assertTrue(receta1.sugerimeAlGrupo(PinPals))
	}
	
	@Test
	def void sugerimeUnaRecAlGrupo2(){
	//receta1.decimeTusIngredientesTotales().forEach[unI | System.out.println(unI.getNombreIngrediente)]
	//receta2.decimeTusIngredientesTotales().forEach[unI | System.out.println(unI.getNombreIngrediente)]
	Assert.assertFalse(receta2.sugerimeAlGrupo(PinPals))
	}
	
	@Test
	def void sugerimeUnaRecAlGrupo3(){
	//receta1.decimeTusIngredientesTotales().forEach[unI | System.out.println(unI.getNombreIngrediente)]
	//receta2.decimeTusIngredientesTotales().forEach[unI | System.out.println(unI.getNombreIngrediente)]
	PinPals.agregarUsuario(matias)
	Assert.assertFalse(receta1.sugerimeAlGrupo(PinPals))
	}
	
	@Test
	def void sugerimeUnaRecAlGrupo4(){
	//receta1.decimeTusIngredientesTotales().forEach[unI | System.out.println(unI.getNombreIngrediente)]
	//receta2.decimeTusIngredientesTotales().forEach[unI | System.out.println(unI.getNombreIngrediente)]
	Assert.assertTrue(receta1.sugerimeAlGrupo(PinPals))
	PinPals.agregarUsuario(matias)
	Assert.assertFalse(receta1.sugerimeAlGrupo(PinPals))
	}
	
	@Test
	def void sugerimeRecetasGrupos(){
	PinPals.agregarUsuario(matias)
	Repo1.agregarRecetasPublicas(receta1)
	Repo1.agregarRecetasPublicas(receta2)
	Repo1.agregarRecetasPublicas(receta3)
	Repo1.agregarRecetasPublicas(receta4)
	//Repo1.sugerirRecetaGrupo(PinPals).forEach[unI | System.out.println(unI.getNombrePlato)]
	}
	
	@Test
	def void sugerimeRecetasUsuarios(){
	Repo1.agregarRecetasPublicas(receta1)
	Repo1.agregarRecetasPublicas(receta2)
	Repo1.agregarRecetasPublicas(receta3)
	Repo1.agregarRecetasPublicas(receta4)
	//Repo1.sugerirRecetaA(matias)
	//Repo1.sugerirRecetaA(matias).forEach[unI | System.out.println(unI.getNombrePlato)]
	}
	
	@Test
	def void agregameFavorita1(){
	matias.agregarRecetaFavorita(receta1)
	//matias.favoritas.forEach[unaR | 
 	//	    System.out.println(unaR.getNombrePlato)]
	}
	
	@Test
	def void agregameFavorita2(){
	matias.agregarRecetaFavorita(receta2)
	//matias.favoritas.forEach[unaR | 
 	//	    System.out.println(unaR.getNombrePlato)]
	}
	
	@Test
	def void puedoVerTodas(){
	matias.agregarReceta(receta2)
	Repo1.agregarRecetasPublicas(receta1)
	Repo1.agregarRecetasPublicas(receta2)
	Repo1.agregarRecetasPublicas(receta3)
	Repo1.agregarRecetasPublicas(receta4)
	PinPals.agregarUsuario(matias)
	PinPals.agregarReceta(receta2)
	matias.decimeTodasTusRecetas(Repo1).forEach[unaR | 
 		    System.out.println(unaR.getNombrePlato)]
    /*PinPals.misRecetas.forEach[unaR | 
 		    System.out.println(unaR.getNombrePlato)]
 	matias.misRecetas.forEach[unaR | 
 		    System.out.println(unaR.getNombrePlato)]
 	System.out.println(matias.getMisRecetas.size)*/
	}
	
	
	
}
