class Habitacion {
	const ocupantes = []
	
	method nivelConfort(persona) = 10
	method puedeEntrar()
	method abandonarHabitacion(persona){
		
	}
}

class UsoGeneral inherits Habitacion{
	override method puedeEntrar() = true
}

class Banio inherits Habitacion{
	
	override method nivelConfort(persona) = super(persona) + if (persona.edad() <= 4) {2} else {4}
	override method puedeEntrar() {
		return ocupantes.size()==0 or ocupantes.any({p=>p.edad()<=4})
	}
}

class Dormitorio inherits Habitacion{
	const duermen = []
	
	method cantidadDuermen() = duermen.size()
	
	method entrar(unaPersona){
		if (self.puedeEntrar()){
			ocupantes.add(unaPersona)
		}
	}
	
	override method puedeEntrar(){
		return ocupantes.all({p=>self.personaDuerme(p)})
	}
	method personaDuerme(unaPesona){
		return duermen.contains(unaPesona)
	}
	
	override method nivelConfort(persona){
		return super(persona) + if(duermen.contains(persona)){10/self.cantidadDuermen()}else{0}
	}
}

class Cocina inherits Habitacion{
	var metrosCuadrados
	
	override method nivelConfort(persona) {
		return if (persona.sabeCocinar()) {metrosCuadrados*porcentaje.unidad()/100}else{0}	
	}
	override method puedeEntrar() = true
}

object porcentaje {
	var property unidad = 10
}

class Persona {
	const property edad
	var property sabeCocinar
	
}