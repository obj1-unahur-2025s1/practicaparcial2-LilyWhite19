class Raza{
  const fuerza
  const inteligencia
  var property rol
  method potencialOfensivo() = (fuerza * 10) + rol.fuerzaExtra()
// method cambiarDeRol(unRol) {rol = unRol}
  method claseAbastracta()
  method esGroso() = self.esInteligente() || self.esGrosoEnSuRol()
  method esInteligente()
  method esGrosoEnSuRol() = rol.esGroso(self)
} 
class Orco inherits Raza{
  override method potencialOfensivo() = super() + (super() / rol.fuerzaExtraOgro())
  override method esInteligente() = false
}
class Humano inherits Raza{
  override method esInteligente() = inteligencia > 50
}

class Cazador{
  const property mascota
  method fuerzaExtra() = mascota.potencialOfensivo()
  method esGroso(unPersonaje) = mascota.esLongeva()
}
object guerrero{
  method fuerzaExtra() = 100
  method esGroso(unPersonaje) = unPersonaje.fuerza() > 50
}
object brujo{
  method fuerzaExtra() = 0
  method fuerzaExtraOgro() = 10
  method esGroso(unPersonaje) = true
}

class Mascota{
  const property fuerza
  var edad
  const property tieneGarras
  method potencialOfensivo() = if (tieneGarras) fuerza * 2 else fuerza
  method esLongeva() = edad > 10
  method cumplirAños() {edad = edad + 1}  
}