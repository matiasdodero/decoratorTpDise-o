package ar.edu.frba.anothercat

import java.util.List
import java.util.ArrayList

class Repositorio_Receta {
	List<Receta> Recetas_Publicas = new ArrayList<Receta>
	
	def List<Receta> sugerirRecetaA(Usuario unUsu){
		var List<Receta> Recetas_Pu = new ArrayList<Receta>
		for (item: Recetas_Publicas) {
			if (item.sugerimeAlUsuario(unUsu) == true) {Recetas_Pu.add(item)}
		}
		return Recetas_Pu
	}
	
	def List<Receta> sugerirRecetaGrupo(Grupo unGru){
		var List<Receta> Recetas_Pu = new ArrayList<Receta>
		for (item: Recetas_Publicas) {
			if (item.sugerimeAlGrupo(unGru) == true) {Recetas_Pu.add(item)}
		}
		return Recetas_Pu
	}
	
	def boolean sosValido(){
		true
	}
		
	
	}