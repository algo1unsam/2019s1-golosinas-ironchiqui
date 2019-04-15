object bombon {
	var peso = 15
	
	method precio() { return 5 }
	method peso() { return peso }
	method mordisco() { peso = peso * 0.8 - 1 }
	method gusto() { return "frutilla" }
	method libreGluten() { return true }
}
//Vale 12 pesos y pesa inicialmente 300 gramos. Su gusto es chocolate. No es libre de gluten.
//Cuando recibe un mordisco, pierde el 20 % de su peso (o sea, su nuevo peso se calcula como peso * 0.8).
object alfajor {
	var peso = 300
	
	method precio() = 12 // esto es igual a method precio(){return 12}
	method peso(){return peso}
	method gusto(){return "chocolate"}
	method libreGluten(){return false}
	
	method mordisco(){ peso = peso - (peso *0.8)}
}
//Vale 1 peso y pesa inicialmente 5 gramos. Su gusto es frutilla. Es libre de gluten.
//Cuando recibe un mordisco, pierde 1 gramo.
object caramelo {
	var peso = 5
	
	method precio() = 1
	method peso() = peso
	method gusto() = "frutilla"
	method libreGluten()= true
	
	method mordisco(){
		peso = peso - 1
	}
}
//Vale 2 pesos y pesa inicialmente 7 gramos. Su gusto es naranja. Es libre de gluten.
//Cuando recibe un mordisco, pierde el 10 % de su peso, a excepción de que su peso actual
 //sea menor a 2 gramos: en tal caso, no pierde nada.
object chupetin {
	var peso = 7
	
	method precio()= 2
	method gusto() = "naranja"
	method peso()= peso
	method pierdePeso(){
		
		if (peso > 2){
			
			peso = peso - (peso * 0.1)
		}
		
	}
	method mordisco(){
		
		self.pierdePeso()
	}
	method libreGluten() = true
}
//Vale 5 pesos y pesa inicialmente 250 gramos. Su gusto es vainilla. No es libre de gluten.
//Al recibir un mordisco pierde peso, en una cantidad que depende del peso actual: si es mayor 
//a 70 gramos pierde el 50 % de su peso, en caso contrario, el 25 %.
object oblea {
	var peso = 250
	
	method precio() = 5
	
	method libreGluten()= false
	method peso()=peso
	
	method pierdePeso(){
		
		if (peso < 75){
			
			peso = peso - (peso * 0.25)
		}
		else{
			peso = peso - (peso * 0.5)
			
		}
		
	}
	
}
//El peso inicial es desconocido, lo asigna el usuario. El precio es de $0,50 por cada gramo de peso inicial.
// No es libre de gluten. Obviamente, su gusto es chocolate.
//Pierde 2 gramos por mordisco.
//¡Atención! El precio es según el peso inicial, no debe cambiar con los mordiscos.

object chocolatin {
	// hay que acordarse de *dos* cosas, el peso inicial y el peso actual
	// el precio se calcula a partir del precio inicial
	// el mordisco afecta al peso actual
	
	
	var pesoInicial
	var pesoActual
	
	/* al principio, el peso actual coincide con el inicial */
	method pesoInicial(cuanto) { 
		pesoInicial = cuanto
		pesoActual = cuanto
	}
	
	method precio(){
		
		return pesoInicial * 0.5
	}
	method pierdePeso(){
		
		pesoActual -= 2
	}
	method mordisco(){
		
		self.pierdePeso() 
	}
	
	method peso() = pesoActual
}
//Se arma a partir de una golosina de base. 
//El peso inicial es el de la golosina de base más 4 gramos que es lo que pesa el bañado.
// El precio es el de la golosina de base más 2 pesos. El gusto es el de la golosina de base. 
//De la misma manera, es libre de gluten si lo es su golosina base.
//Con cada mordisco se da un mordisco a la golosina de base. 
//Además, en el primer mordisco pierde 2 gramos de bañado, y en el segundo los otros dos.

object golosinaBaniada {
	var golosinaInterior
	var pesoBanio = 4
	
	method baniaA(unaGolosina) { 
		
		golosinaInterior = unaGolosina
	}
	method precio() {
		return golosinaInterior.precio() + 2
	}
	method peso() {
		return golosinaInterior.peso() + pesoBanio
	}
	
	method pierdePeso(){
		
		if (pesoBanio >= 2) { 
			
			golosinaInterior.mordisco()
			pesoBanio -= 2
			
			if(pesoBanio == 0){
				golosinaInterior.mordisco()
				
			}
		}
	}
	method mordisco() {
		
		self.pierdePeso()
		// otra forma de hacer la cuenta: pesoBanio = (pesoBanio - 2).max(0) 
	}	
	method gusto() { 
		
		return golosinaInterior.gusto()
	}
	method libreGluten() { 
	
		return golosinaInterior.libreGluten()
	}	
}
//Pesa inicialmente 5 gramos. La pastilla puede ser libre de gluten o no (se configura). 
//Si es libre de gluten el precio es $7; si no, es de $10.
//En cada mordisco cambia el sabor, pasa de frutilla a chocolate, de ahí a naranja, de ahí vuelve a frutilla.

object tuttifrutti {
	var gusto = "frutilla"
	var gustoCambiante = [gustoFrutilla, gustoNaranja, gustoChocolate]
	method peso()= 5

method mordisco(){
	
	self.cambiaGusto()
	
}	
	
	method cambiaGusto(){
		
	
	}
}

