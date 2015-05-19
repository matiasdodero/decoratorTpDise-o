package ar.edu.frba.anothercat.usuario

import ar.edu.frba.anothercat.receta.Receta
import java.util.List
import ar.edu.frba.anothercat.receta.Ingrediente

public interface Usuario {
	
		
	def List<Receta> filtrarRecetasSegunCondicionesDeBusquedaDelUsuario(List<Receta> recetas)
	def double getImc()
	def double getAltura()
	def int getPeso()
	def List<Ingrediente> getIngredientesPreferidos()
	def List<CondicionPreexistente> getCondicionesPreexistentes()
	
	
	
}