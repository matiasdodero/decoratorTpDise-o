package ar.edu.frba.anothercat

import org.junit.Test
import org.junit.Assert
import org.junit.Before

class TestUsuario {
	
	//String CondPreex
	String nombreIngrediente
	Usuario matias
	
	Receta receta1
	Ingrediente ingrediente1
	Ingrediente ingrediente2
	
	Condimento condimento1
	Condimento condimento2
	Condimento condimento3

	@Before
	def void init(){
	    matias = new Usuario => [
	    	nombre = "mati"
	    	fech = "05-29-1989"
//	    	rutina = "dsad"
			peso=90
			altura=1.41
			sexo = "m"
			agregarCondicion(hiperten) 
		//	agregarCondicion(diabe)
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
			setNombre("azucar")
			setCantidad(200)
		]
		
		condimento2 = new Condimento => [
			setNombre("sal")
			setCantidad(200)
		]
		
		condimento3 = new Condimento => [
			setNombre("caldo")
			setCantidad(200)
		]
		receta1 = new Receta => [
		nombrePlato = "unPlato"
		sumarCalorias(100)
		agregarIngrediente(ingrediente1)
		agregarCondimento(condimento1)
		//agregarCondimento(condimento2)
		//agregarCondimento(condimento3)
	]	

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
	

}
