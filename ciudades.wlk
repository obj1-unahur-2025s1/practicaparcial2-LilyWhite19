import personajes.*

class Localidad{
    var ejercito
    method ejercito() = ejercito 
    method potencialDefensivo() = ejercito.potencialOfensivo()
    method serOcupada(unEjercito)
}
class Aldea inherits Localidad{
    const cantidaMaximaDeHabitantes
    override method serOcupada(unEjercito) {
        if(unEjercito.personajes().size() > cantidaMaximaDeHabitantes)
        ejercito = unEjercito.ejercitoMasFuerte()
        else
        ejercito = unEjercito
    }
    
}
class Ciudad inherits Localidad{
    override method potencialDefensivo() = super() + 300
    override method serOcupada(unEjercito) {ejercito = unEjercito}
}

class Ejercito{
    const property personajes = []
    method invadir(unaLocalidad) {
        if(self.puedeTomarLocalidad(unaLocalidad))
        unaLocalidad.serOcupada(self)
    }
    method potencialOfensivo() = personajes.sum({p => p.potencialOfensivo()})
    method puedeTomarLocalidad(unaLocalidad) = self.potencialOfensivo() > unaLocalidad.potencialDefensivo()
    method ejercitoMasFuerte() = self.potencialesOrdenados().take(10)
    method potencialesOrdenados() = personajes.sortBy({p1, p2 => p1.potencialOfensivo() > p2.potencialOfensivo()})
}