package ar.edu.frba.anothercat.filtrosDeUsuario

import ar.edu.frba.anothercat.receta.Condimento
import ar.edu.frba.anothercat.receta.Ingrediente
import ar.edu.frba.anothercat.receta.Receta
import ar.edu.frba.anothercat.usuario.Hipertenso
import ar.edu.frba.anothercat.usuario.UsuarioPosta
import java.util.ArrayList
import java.util.List
import org.junit.Assert
import org.junit.Before
import org.junit.Test
import ar.edu.frba.anothercat.excepciones.ExceptionFiltro

class TestFiltroDeUsuario {

	UsuarioPosta pedro

	IngredientesCaros userPedroConIngredientesCaros
	ExcesoDeCalorias userPedroConExcesoCalorias
	GustoDelUsuario userPedroConGustos
	BusquedaPorCondicionPreexistente userPedroConPrecondicion
	
	PrimerosN userPedroTraerPrimeros10
	OrdenarPorPares userPedroConOrdenPar
	

	Ingrediente carne
	Ingrediente agua
	Ingrediente pure
	Ingrediente pollo
	Ingrediente pescado
	Ingrediente berenjena
	Ingrediente pan
	Ingrediente salmon

	Receta receta1
	Receta receta3
	Receta receta2
	Receta receta4
	Receta receta5
	Receta receta6
	Receta recetaCara
	Receta recetaPollo
	Receta receta9
	Receta receta10
	Receta receta11

	Condimento azucar
	Condimento sal
	Condimento aceite
	Condimento vinagre
	Condimento harina
	Condimento levadura

	Hipertenso hipertenso

	var List<Receta> recetas = new ArrayList<Receta>
	var List<Receta> recetasTestOrden = new ArrayList<Receta>

	@Before
	def void init() {

		pollo = new Ingrediente => [
			setNombreIngrediente("pollo")
			setCalorias(25)
		]

		hipertenso = new Hipertenso

		pedro = new UsuarioPosta
		pedro.altura = 1.7
		pedro.peso = 120
		pedro.agregarIngredientePreferido(pollo)
		pedro.agregarCondicionPreexistente(hipertenso)

		userPedroConIngredientesCaros = new IngredientesCaros(pedro)
		userPedroConExcesoCalorias = new ExcesoDeCalorias(pedro)
		userPedroConGustos = new GustoDelUsuario(pedro)
		userPedroConPrecondicion = new BusquedaPorCondicionPreexistente(pedro)
		
		userPedroTraerPrimeros10 = new PrimerosN(pedro)
		userPedroConOrdenPar = new OrdenarPorPares(pedro)

		carne = new Ingrediente => [
			setNombreIngrediente("carne")
			setCalorias(600)
		]

		agua = new Ingrediente => [
			setNombreIngrediente("agua")
			setCalorias(15)
		]

		pure = new Ingrediente => [
			setNombreIngrediente("pure")
			setCalorias(20)
		]

		pescado = new Ingrediente => [
			setNombreIngrediente("pescado")
			setCalorias(30)
		]

		berenjena = new Ingrediente => [
			setNombreIngrediente("berenjena")
			setCalorias(35)
		]

		pan = new Ingrediente => [
			setNombreIngrediente("pan")
			setCalorias(40)
		]

		salmon = new Ingrediente => [
			setNombreIngrediente("salmon")
			setCalorias(120)
			setIngredienteCaro(true)
		]

		azucar = new Condimento => [
			setNombreCondimento("azucar")
			setCantidad(110)
		]

		sal = new Condimento => [
			setNombreCondimento("sal")
			setCantidad(15)
		]

		aceite = new Condimento => [
			setNombreCondimento("aceite")
			setCantidad(150)
		]

		vinagre = new Condimento => [
			setNombreCondimento("vinagre")
			setCantidad(150)
		]

		harina = new Condimento => [
			setNombreCondimento("harina")
			setCantidad(150)
		]

		levadura = new Condimento => [
			setNombreCondimento("levadura")
			setCantidad(150)
		]

		receta1 = new Receta
		receta2 = new Receta
		receta3 = new Receta
		receta4 = new Receta
		receta5 = new Receta
		receta6 = new Receta
		recetaCara = new Receta
		recetaPollo = new Receta
		receta9 = new Receta
		receta10 = new Receta
		receta11 = new Receta

		receta1 => [
			agregarIngrediente(carne)
			agregarIngrediente(agua)
			agregarCondimento(azucar)
			sumarCalorias(carne.calorias)
			validar()
		]

		receta3 => [
			agregarIngrediente(pure)
			agregarIngrediente(pollo)
			agregarCondimento(sal)
			sumarCalorias(pure.calorias)
			validar()
		]

		receta2 => [
			agregarIngrediente(pescado)
			agregarCondimento(aceite)
			agregarCondimento(vinagre)
			sumarCalorias(pescado.calorias)
			validar()
		]

		receta4 => [
			agregarIngrediente(berenjena)
			agregarCondimento(azucar)
			sumarCalorias(berenjena.calorias)
			validar()
		]

		receta5 => [
			agregarIngrediente(pan)
			agregarCondimento(levadura)
			sumarCalorias(pan.calorias)
			validar()
		]

		receta6 => [
			agregarIngrediente(carne)
			agregarIngrediente(agua)
			agregarCondimento(vinagre)
			agregarCondimento(harina)
			sumarCalorias(pan.calorias)
			validar()
		]

		recetaCara => [
			agregarIngrediente(salmon)
			agregarCondimento(vinagre)
			sumarCalorias(salmon.calorias)
		]
		recetaPollo => [
			agregarIngrediente(pollo)
			sumarCalorias(pollo.calorias)
		]

		recetas => [
			add(receta1)
			add(receta2)
			add(receta3)
			add(receta4)
			add(receta5)
			add(receta6)
			add(recetaCara)
			add(recetaPollo)
			
		]
		
		recetasTestOrden =>[
			add(receta1)
			add(receta2)
			add(receta3)
			add(receta4)
			add(receta5)
			add(receta6)
			add(recetaCara)
			add(recetaPollo)
			add(receta9)
			add(receta10)
			add(receta11)
		]

	}

	@Test
	def void imcUsuarioPedro() {
		Assert.assertEquals(41.5, (pedro.calcularImc()), 0.1)
	}

	@Test
	def void caloriasReceta1() {
		Assert.assertEquals(615, (receta1.caloriasFinales))
	}

	@Test
	def void caloriasReceta2() {
		Assert.assertEquals(30, (receta2.caloriasFinales))
	}

	@Test
	def void caloriasReceta3() {
		Assert.assertEquals(45, (receta3.caloriasFinales))
	}

	@Test
	def void caloriasReceta4() {
		Assert.assertEquals(35, (receta4.caloriasFinales))
	}

	@Test
	def void caloriasReceta5() {
		Assert.assertEquals(40, (receta5.caloriasFinales))
	}

	@Test
	def void caloriasReceta6() {
		Assert.assertEquals(615, (receta6.caloriasFinales))
	}

	@Test
	def void caloriasRecetaCara() {
		Assert.assertEquals(120, (recetaCara.caloriasFinales))
	}

	@Test
	def void filtrarRecetasExcesoDeCalorias() {

		Assert.assertEquals(6,
			userPedroConExcesoCalorias.filtrarRecetasSegunCondicionesDeBusquedaDelUsuario(recetas).size())

	// como tiene sobrepeso son 6 las recetas que puede ver con calorias < 500
	}

	@Test
	def void filtrarRecetasPorIngredientesPreferidos() {

		Assert.assertEquals(2, userPedroConGustos.filtrarRecetasSegunCondicionesDeBusquedaDelUsuario(recetas).size())

	// hay 2 recetas que contienen pollo
	}

	@Test
	def void filtrarRecetasPorIngredientesCaros() {

		Assert.assertEquals(1, userPedroConIngredientesCaros.filtrarRecetasSegunCondicionesDeBusquedaDelUsuario(recetas).size())

	// 1 sola receta con ingrediente caro//
	}

	@Test
	def void filtrarRecetasSegunCondicionPreexistente() {

		Assert.assertEquals(7,
			userPedroConPrecondicion.filtrarRecetasSegunCondicionesDeBusquedaDelUsuario(recetas).size())

	// hay 7 recetas que no contienen sal
	}

	@Test(expected=typeof(ExceptionFiltro))
	def void filtrarUsandoTodosLosFiltros() {
		Assert.assertEquals(
			0,
			userPedroConGustos.filtrarRecetasSegunCondicionesDeBusquedaDelUsuario(
				userPedroConGustos.filtrarRecetasSegunCondicionesDeBusquedaDelUsuario(
					userPedroConPrecondicion.filtrarRecetasSegunCondicionesDeBusquedaDelUsuario(
							userPedroConIngredientesCaros.filtrarRecetasSegunCondicionesDeBusquedaDelUsuario(recetas)))).size())

	// se queda sin elementos para filtrar dando 0 finalmente
	}
	
	@Test
	def void traerPrimeras10Recetas(){
		Assert.assertEquals(10,userPedroTraerPrimeros10.ordenamientoDeRecetas(recetasTestOrden).size())
		
		// trae 10 recetas, habiendo 11 en total
	}
	
	@Test
	def void ordenarRecetasPorPares(){
		Assert.assertEquals(6,userPedroConOrdenPar.ordenamientoDeRecetas(recetasTestOrden).size())
		
		// trae la de la posicion 0,2,4,6,8,10 ( 6 en total)
	}

}
