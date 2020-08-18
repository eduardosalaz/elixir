defmodule M do
    #al entrar en la consola interactiva de elixir: $ iex tienes que cargar el archivo
    #$ c("elixirtut.ex") y entre corchetes va a mostrar los módulos disponibles
    #en este caso, M tiene a main o a data como funciones, por lo que se ejecutan así:
    #$M.main o $M.data
    #las funciones públicas (que se pueden acceder desde otros módulos) se declaran con def
    #las funciones privadas, disponibles solo para su módulo padre se declaran con defp)
    def main do
        name = IO.gets("What is your name? ") |> String.trim #para eliminar la \n del input
				#el |> sirve para "pipear" el ultimo valor obtenido como parametro para la siguiente función
				IO.puts("Hello #{name}") #interpola el string
    end

    def data do
    	my_int = 123
			IO.puts("Integer #{is_integer(my_int)}") #boolean para checar tipo de variable
    	my_float = 3.14159
			IO.puts("Float #{is_float(my_float)}") #realmente puede ser usado para cualquier tipo
      #las variables en elixir son inmutables, los átomos llevan como nombre su propio valor
			IO.puts("Atom #{is_atom(:Monterrey)}")
			#para usar espacios dentro de los átomos tienes que poner un : al principio
			# :"Nuevo León"
			#para definir rangos:
			one_to_10 = 1..10
    end

    def strings do
    	my_str = "Mi string"
			IO.puts("Length: #{String.length(my_str)}")
			longer_str = my_str <> " " <> "es más largo" # <> concatena strings
			IO.puts("Equal : #{"Egg" === "egg"}") #los === checan el valor y el tipo de dato
			#si solo es == checa el valor nada más
			IO.puts("Mi ? #{String.contains?(my_str, "Mi")}") #revisa si un string contiene x valor
			IO.puts("First : #{String.first(my_str)}")#primer char en el string
			IO.puts("Index 4 : #{String.at(my_str, 4)}") #char en el index indicado
			IO.puts("Substring : #{String.slice(my_str, 3,8)}")#saca un substring pasandole el string original
			#el index de inicio y el index donde acaba
			IO.inspect(String.split(longer_str, " ")) #imprime la representación interna del lenguaje, una lista
			IO.puts(String.reverse(longer_str)) #bastante obvio
			IO.puts(String.upcase(longer_str))
			IO.puts(String.downcase(longer_str))
			IO.puts(String.capitalize(longer_str))#Mayusculas solo la primera letra de cada palabra
			#por lo que estoy viendo maneja UTF-8
			4 * 10 |> IO.puts #Imprime el resultado, haciendole pipe a la función de puts
			#los strings en elixir están representados por cadenas de bytes conocidos como binaries
			IO.puts("Binary : #{is_binary(my_str)}") #tambien podemos hacer byte_size para obtener los bytes
			#byte_size y length son distintos
			#nota muy importante: "hola" y 'hola' no son lo mismo, el 'hola' es un charlist que puede ser
			#representado con una lista de los valores de las letras en ASCII
    end

    def maths do
    	IO.puts("5 + 4 = #{5+4}")
			IO.puts("5 - 4 = #{5-4}")
			IO.puts("5 * 4 = #{5*4}")
			IO.puts("5 / 4 = #{5/4}") # / division en flotante
			IO.puts("5 div 4 = #{div(5, 4)}") #div devuelve el resultado de la division en entero
			IO.puts("5 rem 4 = #{rem(5,4)}") #rem devuelve el modulo de la division
			#existen funciones de logaritmos, exponenciales, trigonometría, etcétera
    end

    def comparaciones do
			IO.puts("4 == 4.0 : #{4 == 4.0}") #compara el valor nada más
      IO.puts("4 === 4.0 : #{4 === 4.0}") #compara el valor y el tipo de dato
			IO.puts("4 != 4.0 : #{4 != 4.0}") #el valor es distinto?
			IO.puts("4 !== 4.0 : #{4 !== 4.0}") #el valor y el tipo de dato son distintos?
			edad = 16
			IO.puts("Votar y Manejar: #{(edad >= 18) and (edad >= 16)}")
			IO.puts("Votar o Manejar: #{(edad >= 18) or (edad >= 16)}")
			#IO.puts not true -> imprime false
    end

    def condicionales do
    	edad = 17
			if edad >= 18 do
	    	IO.puts("Puedes votar")
			else
	    	IO.puts("No puedes votar")
			end

			unless edad === 18 do
	    	IO.puts("No tienes 18") #esta expresión se evalúa si el resultado de unless es false
			else
		    IO.puts("Tienes 18") #si es true
      end
			#notese que no existe un else if como tal, para eso está cond, que se evalúa para el primer valor
			#que no sea nil o false
			cond do
	    	edad >= 18 -> IO.puts("Puedes votar y manejar")
	    	edad >= 16 -> IO.puts("Puedes manejar")
	    	edad < 16 -> IO.puts("No puedes ni manejar ni votar")
	    	true -> IO.puts("Default")
			end
			#como tampoco existe un switch, usamos el case para hacer pattern match de un dato, tambien
			#evalúa para la primera condición que se cumpla
			case {edad >=16, edad >=18 } do
		    {true, true} -> IO.puts("Puedes manejar y votar")
		    {true, false} -> IO.puts("Puedes manejar")
	  	  {false, false} -> IO.puts("No puedes ni manejar ni votar")
			end
			#operador ternario (no lo uso)
			IO.puts("Ternario: #{if edad > 18, do: "Puedes votar", else: "No puedes votar"}")
  end

  def estructuras do

	end

end
