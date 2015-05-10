package ar.edu.frba.anothercat

import java.util.ArrayList
import java.util.List

class GustoDelUsuario extends DecoratorUsuarioCondicionesBusqueda {

	override filtro1(List<Receta> recetas, UsuarioPosta usuario) {
		var List<Receta> recetasSegunGustos = new ArrayList<Receta>
		return recetasSegunGustos = (recetas.filter[receta|
			receta.getIngredientes.forall(
				ingrediente|usuario.getDisgustos.exists[disgusto|disgusto != ingrediente])]).toList()

	}

	override filtro2(Receta receta, UsuarioPosta usuario) {

		return (( receta.getIngredientes.forall(
			ingrediente|usuario.getDisgustos.exists[disgusto|disgusto == ingrediente]) ))
	}

}
