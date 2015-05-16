package ar.edu.frba.anothercat.filtrosDeUsuario

import java.util.ArrayList
import java.util.List
import ar.edu.frba.anothercat.usuario.DecoratorUsuarioCondicionesBusqueda
import ar.edu.frba.anothercat.usuario.UsuarioPosta
import ar.edu.frba.anothercat.receta.Receta

class GustoDelUsuario extends DecoratorUsuarioCondicionesBusqueda {

	override filtrarRecetasSegunCriterio1(List<Receta> recetas, UsuarioPosta usuario) {
		var List<Receta> recetasSegunGustos = new ArrayList<Receta>
		return recetasSegunGustos = (recetas.filter[receta|
			receta.getIngredientes.forall(
				ingrediente|usuario.getDisgustos.exists[disgusto|disgusto != ingrediente])]).toList()

	}

	override filtrarRecetasSegunCriterio2(Receta receta, UsuarioPosta usuario) {

		return (( receta.getIngredientes.forall(
			ingrediente|usuario.getDisgustos.exists[disgusto|disgusto == ingrediente]) ))
	}

}