package ar.edu.frba.anothercat.filtrosDeUsuario

import java.util.ArrayList
import java.util.HashSet
import java.util.List
import ar.edu.frba.anothercat.receta.Receta
import ar.edu.frba.anothercat.usuario.DecoratorOrdenamientoPostCondicionesDeBusqueda

class OrdenarPorPares extends DecoratorOrdenamientoPostCondicionesDeBusqueda {

	override ordenamientoDeRecetas(Iterable<Receta> recetas) {

		var Iterable<Receta> recetasFiltro = new HashSet<Receta>
		var HashSet<Receta> setRecetas = new HashSet<Receta>
		var List<Receta> setRecetasAux = new ArrayList<Receta>

		for (var int i = 0; i < recetas.size; i++) {
			if (i % 2 == 0) {
				setRecetasAux.add(recetas.get(i))
			}
		}

		for (item : setRecetasAux) {
			setRecetas.add(item)
		}

		recetasFiltro = setRecetasAux

		return recetasFiltro

	}
	
}