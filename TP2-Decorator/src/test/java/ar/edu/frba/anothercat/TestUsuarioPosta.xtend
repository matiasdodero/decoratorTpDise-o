package ar.edu.frba.anothercat

import org.junit.Assert
import org.junit.Before
import org.junit.Test

class TestUsuarioPosta {

	UsuarioPosta matias

	OrdenarAlfabeticamente ordenarAlfabeticamente
	OrdenarPorCalorias ordenarPorCalorias
	OrdenarPorPares ordenarPorPares
	PrimerosN primerosN

	Ingrediente ingrediente1
	Ingrediente ingrediente2
	Ingrediente ingrediente3
	Ingrediente ingrediente4
	Ingrediente ingrediente5

	Condimento condimento1
	Condimento condimento2
	Condimento condimento3
	Condimento condimento4

	Repositorio_Receta Repo1

	Receta receta1
	Receta receta2
	Receta receta3
	Receta receta4
	Receta receta5
	Receta receta6
	Receta receta7
	Receta receta8
	Receta receta9
	Receta receta10
	Receta receta11
	Receta receta12
	Receta receta13
	Receta receta14
	Receta receta15
	Receta receta16
	Receta receta17
	Receta receta18
	Receta receta19
	Receta receta20

	Grupo PinPals

	IngredientesCaros filtroIngredientesCaros
	BusquedaPorCondicionPreexistente filtroCondPre
	GustoDelUsuario filtroGustos
	ExcesoDeCalorias filtroExcesoCalorias

	@Before
	def void init() {

		ingrediente1 = new Ingrediente => [
			setNombreIngrediente("carne")
			setCalorias(200)
			setIngredienteCaro(false)
		]

		ingrediente2 = new Ingrediente => [
			setNombreIngrediente("agua")
			setCalorias(20)
			setIngredienteCaro(false)
		]

		ingrediente3 = new Ingrediente => [
			setNombreIngrediente("polenta")
			setCalorias(20)
			setIngredienteCaro(false)
		]

		ingrediente4 = new Ingrediente => [
			setNombreIngrediente("lechon")
			setCalorias(20)
			setIngredienteCaro(false)
		]

		ingrediente5 = new Ingrediente => [
			setNombreIngrediente("salmon")
			setCalorias(20)
			setIngredienteCaro(true)
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

		condimento4 = new Condimento => [
			setNombreCondimento("harina")
			setCantidad(200)
		]

		receta1 = new Receta => [
			nombrePlato = "plato de receta 1"
			sumarCalorias(100)
			estado = estadoReceta.Publica
			agregarIngrediente(ingrediente1)
			agregarCondimento(condimento1)
		]

		receta2 = new Receta => [
			nombrePlato = "plato de receta 2"
			sumarCalorias(300)
			estado = estadoReceta.Publica
			agregarIngrediente(ingrediente2)
			agregarCondimento(condimento2)
		]

		receta3 = new Receta => [
			nombrePlato = "plato de receta 3"
			estado = estadoReceta.Publica
			agregarIngrediente(ingrediente1)
			agregarIngrediente(ingrediente3)
		]

		receta4 = new Receta => [
			nombrePlato = "plato de receta 4"
			sumarCalorias(250)
			estado = estadoReceta.Publica
			agregarIngrediente(ingrediente3)
			agregarIngrediente(ingrediente4)
		]

		receta5 = new Receta => [
			nombrePlato = "plato de receta 5"
			sumarCalorias(150)
			estado = estadoReceta.Publica
			agregarIngrediente(ingrediente4)
			agregarCondimento(condimento4)
		]

		receta6 = new Receta => [
			nombrePlato = "plato de receta 6"
			sumarCalorias(600)
			estado = estadoReceta.Publica
			agregarIngrediente(ingrediente5)
			agregarCondimento(condimento4)
		]

		receta7 = new Receta => [
			nombrePlato = "plato de receta 7"
			sumarCalorias(100)
			estado = estadoReceta.Publica
			agregarIngrediente(ingrediente4)
			agregarCondimento(condimento4)
		]

		receta8 = new Receta => [
			nombrePlato = "plato de receta 8"
			sumarCalorias(200)
			estado = estadoReceta.Publica
			agregarIngrediente(ingrediente4)
			agregarCondimento(condimento4)
		]

		receta9 = new Receta => [
			nombrePlato = "plato de receta 9"
			sumarCalorias(100)
			estado = estadoReceta.Publica
			agregarIngrediente(ingrediente4)
			agregarCondimento(condimento4)
		]

		receta10 = new Receta => [
			nombrePlato = "plato de receta 10"
			sumarCalorias(100)
			estado = estadoReceta.Publica
			agregarIngrediente(ingrediente4)
			agregarCondimento(condimento4)
		]

		receta11 = new Receta => [
			nombrePlato = "plato de receta 11"
			sumarCalorias(100)
			estado = estadoReceta.Publica
			agregarIngrediente(ingrediente4)
			agregarCondimento(condimento4)
		]

		receta12 = new Receta => [
			nombrePlato = "plato de receta 12"
			sumarCalorias(100)
			estado = estadoReceta.Publica
			agregarIngrediente(ingrediente4)
			agregarCondimento(condimento4)
		]

		receta13 = new Receta => [
			nombrePlato = "plato de receta 13"
			sumarCalorias(100)
			estado = estadoReceta.Publica
			agregarIngrediente(ingrediente4)
			agregarCondimento(condimento4)
		]

		receta14 = new Receta => [
			nombrePlato = "plato de receta 14"
			sumarCalorias(100)
			estado = estadoReceta.Publica
			agregarIngrediente(ingrediente4)
			agregarCondimento(condimento4)
		]

		receta15 = new Receta => [
			nombrePlato = "plato de receta 15"
			sumarCalorias(100)
			estado = estadoReceta.Publica
			agregarIngrediente(ingrediente4)
			agregarCondimento(condimento4)
		]

		receta16 = new Receta => [
			nombrePlato = "plato de receta 16"
			sumarCalorias(100)
			estado = estadoReceta.Publica
			agregarIngrediente(ingrediente4)
			agregarCondimento(condimento4)
		]

		receta17 = new Receta => [
			nombrePlato = "plato de receta 17"
			sumarCalorias(100)
			estado = estadoReceta.Publica
			agregarIngrediente(ingrediente4)
			agregarCondimento(condimento4)
		]

		receta18 = new Receta => [
			nombrePlato = "plato de receta 18"
			sumarCalorias(100)
			estado = estadoReceta.Publica
			agregarIngrediente(ingrediente4)
			agregarCondimento(condimento4)
		]

		receta19 = new Receta => [
			nombrePlato = "plato de receta 19"
			sumarCalorias(100)
			estado = estadoReceta.Publica
			agregarIngrediente(ingrediente4)
			agregarCondimento(condimento4)
		]

		receta20 = new Receta => [
			nombrePlato = "plato de receta 20"
			sumarCalorias(100)
			estado = estadoReceta.Publica
			agregarIngrediente(ingrediente4)
			agregarCondimento(condimento4)
		]

		PinPals = new Grupo => [
			setNombre("PinPals")
		]

		matias = new UsuarioPosta => [
			setNombre("matias")
			peso = 50
			altura = 1.71
			sexo = "m"
			agregarCondicion(diabe)
			agregarPrefer(manzana)
			agregarPrefer(lechuga)
			agregarDisgusto(ingrediente3)
			rutinaE = tipoRutina.PREINTENSIVO
		]
		Repo1 = new Repositorio_Receta

		filtroIngredientesCaros = new IngredientesCaros

		filtroCondPre = new BusquedaPorCondicionPreexistente

		filtroGustos = new GustoDelUsuario

		filtroExcesoCalorias = new ExcesoDeCalorias

		ordenarAlfabeticamente = new OrdenarAlfabeticamente
		ordenarPorCalorias = new OrdenarPorCalorias
		ordenarPorPares = new OrdenarPorPares
		primerosN = new PrimerosN

	}

	Diabetico diabe = new Diabetico

	Ingrediente manzana = new Ingrediente => [
		setNombreIngrediente("manzana")
		setTipoIngrediente("fruta")
	]

	Ingrediente lechuga = new Ingrediente => [
		setNombreIngrediente("lechuga")
		setTipoIngrediente("verdura")
	]

	@Test(expected=typeof(NoCumpleRequisitosException))
	def void creacionUsuario() {

		Assert.assertFalse(matias.agregarReceta(receta1))

	}

	@Test
	def void averiguarIMC() {
		Assert.assertEquals(17, matias.calcularImc(), 0.1)
	}

	@Test
	def void usuarioSigueRutinaSaludable() {
		Assert.assertFalse(matias.seguisDietaSaludable())
	}

	@Test
	def void puedoVerRecetaPublica() {
		matias => [
			Assert.assertFalse(puedoVerReceta(receta2))
		]
	}

	@Test
	def void puedoModificarRecetaPublica() {
		matias => [
			Assert.assertTrue(puedoModificarReceta(receta2))
		]
	}

	@Test
	def void PuedoVerRecetaPrivada() {
		matias => [
			Assert.assertFalse(puedoVerReceta(receta3))
		]
	}

	@Test
	def void puedoModificarRecetaPrivada() {
		matias => [
			Assert.assertTrue(puedoModificarReceta(receta3))
		]

	}

	@Test
	def void validarUsuario() {

		Assert.assertFalse(matias.sosValido())
	}

	@Test
	def void validarGrupoConUnaReceta() {

		Assert.assertTrue(PinPals.agregarReceta(receta1))
	}

	@Test
	def void validameAlGrupoConUnUsuario() {

		Assert.assertTrue(PinPals.agregarUsuario(matias))
	}

	@Test(expected=typeof(NoCumpleRequisitosException))
	def void validarAlGrupo1() {

		Assert.assertTrue(PinPals.agregarReceta(receta1))
		Assert.assertTrue(PinPals.agregarUsuario(matias))

	}

	@Test(expected=typeof(NoCumpleRequisitosException))
	def void validarAlGrupo2() {

		Assert.assertTrue(PinPals.agregarUsuario(matias))
		Assert.assertTrue(PinPals.agregarReceta(receta1))

	}

	@Test
	def void validarAlGrupo3() {

		Assert.assertTrue(PinPals.agregarUsuario(matias))
		Assert.assertTrue(PinPals.agregarReceta(receta2))

	}

	@Test
	def void sugerirRecetaAlUsuario1() {
		Assert.assertFalse(receta1.sugerimeAlUsuario(matias))
	}

	@Test
	def void sugerirRecetaAlUsuario2() {

		Assert.assertTrue(receta2.sugerimeAlUsuario(matias))
	}

	@Test
	def void sugerirRecetaAlUsuario3() {
		receta4.decimeTusIngredientesTotales().forEach[unI|System.out.println(unI.getNombreIngrediente)]
		Assert.assertFalse(receta4.sugerimeAlUsuario(matias))
	}

	@Test
	def void sugerirRecetaAlGrupo1() {
		Assert.assertFalse(receta1.sugerimeAlGrupo(PinPals))
	}

	@Test
	def void sugerirRecetaAlGrupo2() {
		Assert.assertFalse(receta2.sugerimeAlGrupo(PinPals))
	}

	@Test
	def void sugerirRecetaAlGrupo3() {
		PinPals.agregarUsuario(matias)
		Assert.assertFalse(receta1.sugerimeAlGrupo(PinPals))
	}

	@Test
	def void sugerirRecetaAlGrupo4() {
		Assert.assertFalse(receta1.sugerimeAlGrupo(PinPals))
		PinPals.agregarUsuario(matias)
		Assert.assertFalse(receta1.sugerimeAlGrupo(PinPals))
	}

	@Test(expected=typeof(NoCumpleRequisitosException))
	def void agregarRecetaFavorita1() {
		Assert.assertFalse(matias.agregarRecetaFavorita(receta1))
	}

	@Test
	def void agregarRecetaFavorita2() {
		Assert.assertTrue(matias.agregarRecetaFavorita(receta2))

	}

	@Test
	def void puedoVerTodas() {
		matias.agregarReceta(receta2)
		Repo1.agregarRecetasPublicas(receta1)
		Repo1.agregarRecetasPublicas(receta2)
		Repo1.agregarRecetasPublicas(receta3)
		Repo1.agregarRecetasPublicas(receta4)
		PinPals.agregarUsuario(matias)
		PinPals.agregarReceta(receta2)
		Assert.assertEquals(6, matias.puedeVer(Repo1).size(), 0)

	}

	@Test
	def void filtramePorGustos() {

		Repo1.agregarRecetasPublicas(receta1)
		Repo1.agregarRecetasPublicas(receta2)
		Repo1.agregarRecetasPublicas(receta3)
		Repo1.agregarRecetasPublicas(receta4)
		Repo1.agregarRecetasPublicas(receta5)
		Repo1.agregarRecetasPublicas(receta6)
		matias.agregarFiltro(filtroGustos)

		Assert.assertEquals(6,
			(matias.ordenarRecetasPorProcesoPosterior(matias.filtrarRepositorioDeRecetas(Repo1))).size(), 0)

	}

	@Test
	def void filtrarPorIngredientesCaros() {

		Repo1.agregarRecetasPublicas(receta1)
		Repo1.agregarRecetasPublicas(receta2)
		Repo1.agregarRecetasPublicas(receta3)
		Repo1.agregarRecetasPublicas(receta4)
		Repo1.agregarRecetasPublicas(receta5)
		Repo1.agregarRecetasPublicas(receta6)
		matias.agregarFiltro(filtroIngredientesCaros)
		Assert.assertEquals(1,
			(matias.ordenarRecetasPorProcesoPosterior(matias.filtrarRepositorioDeRecetas(Repo1))).size(), 0)

	}

	@Test
	def void filtrarPorExcesoDeCalorias() {

		Repo1.agregarRecetasPublicas(receta1)
		Repo1.agregarRecetasPublicas(receta2)
		Repo1.agregarRecetasPublicas(receta3)
		Repo1.agregarRecetasPublicas(receta4)
		Repo1.agregarRecetasPublicas(receta5)
		Repo1.agregarRecetasPublicas(receta6)
		matias.agregarReceta(receta2)
		PinPals.agregarUsuario(matias)
		PinPals.agregarReceta(receta2)

		matias.agregarFiltro(filtroExcesoCalorias)

		Assert.assertEquals(8,
			(matias.ordenarRecetasPorProcesoPosterior(matias.filtrarRepositorioDeRecetas(Repo1))).size(), 0)

	}

	@Test
	def void filtrarPorTodasLasCondiciones() {
		Repo1.agregarRecetasPublicas(receta1)
		Repo1.agregarRecetasPublicas(receta2)
		Repo1.agregarRecetasPublicas(receta3)
		Repo1.agregarRecetasPublicas(receta4)
		Repo1.agregarRecetasPublicas(receta5)
		Repo1.agregarRecetasPublicas(receta6)
		Repo1.agregarRecetasPublicas(receta7)
		Repo1.agregarRecetasPublicas(receta8)
		Repo1.agregarRecetasPublicas(receta9)
		Repo1.agregarRecetasPublicas(receta10)
		Repo1.agregarRecetasPublicas(receta11)
		Repo1.agregarRecetasPublicas(receta12)
		Repo1.agregarRecetasPublicas(receta13)
		Repo1.agregarRecetasPublicas(receta14)
		matias.agregarReceta(receta2)
		matias.agregarReceta(receta12)
		PinPals.agregarUsuario(matias)
		PinPals.agregarReceta(receta2)
		PinPals.agregarReceta(receta14)

		matias.agregarFiltro(filtroGustos)
		matias.agregarFiltro(filtroIngredientesCaros)
		matias.agregarFiltro(filtroExcesoCalorias)
		matias.agregarFiltro(filtroCondPre)

		Assert.assertEquals(0,
			(matias.ordenarRecetasPorProcesoPosterior(matias.filtrarRepositorioDeRecetas(Repo1))).size(), 0)

	}

	@Test
	def void filtrarPrimeras10Recetas() {
		Repo1.agregarRecetasPublicas(receta1)
		Repo1.agregarRecetasPublicas(receta2)
		Repo1.agregarRecetasPublicas(receta3)
		Repo1.agregarRecetasPublicas(receta4)
		Repo1.agregarRecetasPublicas(receta5)
		Repo1.agregarRecetasPublicas(receta6)
		Repo1.agregarRecetasPublicas(receta7)
		Repo1.agregarRecetasPublicas(receta8)
		Repo1.agregarRecetasPublicas(receta9)
		Repo1.agregarRecetasPublicas(receta10)
		Repo1.agregarRecetasPublicas(receta11)
		Repo1.agregarRecetasPublicas(receta12)
		Repo1.agregarRecetasPublicas(receta13)
		Repo1.agregarRecetasPublicas(receta14)
		matias.agregarReceta(receta2)
		matias.agregarReceta(receta12)
		PinPals.agregarUsuario(matias)
		PinPals.agregarReceta(receta2)
		PinPals.agregarReceta(receta14)

		matias.agregarProcesamientoPosterior(primerosN)
		Assert.assertEquals(10,
			(matias.ordenarRecetasPorProcesoPosterior(matias.filtrarRepositorioDeRecetas(Repo1))).size(), 0)

	}

	@Test
	def void filtrandoYOrdenandoRecetas() {
		Repo1.agregarRecetasPublicas(receta1)
		Repo1.agregarRecetasPublicas(receta2)
		Repo1.agregarRecetasPublicas(receta3)
		Repo1.agregarRecetasPublicas(receta4)
		Repo1.agregarRecetasPublicas(receta5)
		Repo1.agregarRecetasPublicas(receta6)
		Repo1.agregarRecetasPublicas(receta7)
		Repo1.agregarRecetasPublicas(receta8)
		Repo1.agregarRecetasPublicas(receta9)
		Repo1.agregarRecetasPublicas(receta10)
		Repo1.agregarRecetasPublicas(receta11)
		Repo1.agregarRecetasPublicas(receta12)
		Repo1.agregarRecetasPublicas(receta13)
		Repo1.agregarRecetasPublicas(receta14)
		Repo1.agregarRecetasPublicas(receta15)
		Repo1.agregarRecetasPublicas(receta16)
		Repo1.agregarRecetasPublicas(receta17)
		Repo1.agregarRecetasPublicas(receta18)
		Repo1.agregarRecetasPublicas(receta19)
		Repo1.agregarRecetasPublicas(receta20)
		matias.agregarReceta(receta2)
		matias.agregarReceta(receta12)
		PinPals.agregarUsuario(matias)
		PinPals.agregarReceta(receta2)
		PinPals.agregarReceta(receta14)
		matias.agregarProcesamientoPosterior(ordenarPorCalorias)
		matias.agregarProcesamientoPosterior(ordenarAlfabeticamente)
		matias.agregarProcesamientoPosterior(ordenarPorPares)
		matias.agregarProcesamientoPosterior(primerosN)

		Assert.assertEquals(10,
			(matias.ordenarRecetasPorProcesoPosterior(matias.filtrarRepositorioDeRecetas(Repo1))).size(), 0)
		Assert.assertEquals(24, (matias.filtrarRepositorioDeRecetas(Repo1)).size(), 0)

	}

}
