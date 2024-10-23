main = do
  putStrLn "Good luck, mate. You'll need it..."

{-
        OPERAÇÃO COM LISTAS
    Pode-se usar diversas funções para operar nas listas. Uma	lista	é	um tipo	de dado que	assume um valor vazio [] ou, se possuir algum valor, como elementos inteiros, [1,2,3].

  FUNÇÕES E SEUS TIPOS:
  Função (++) - representa a concatenação	entre	duas listas.
    Exemplo: [1,2]	++	[3,4]
             [1,2,3,4]
          Também	temos	a	maneira	infixa:
          	 (++)	[1,2]	[3,4]
             [1,2,3,4]

  Função (!!) - A função !! , usada de maneira infixa, recebe uma lista e um número inteiro, e devolve o elemento na posição informada.
    Exemplo: > [1,2,3,4] !! 2
               3
             > [1,2,3,4] !! 0
               1

  Função Cons (:) - recebe um elemento e uma lista, e devolve este elemento na frente da lista:
    Exemplo: >	3	:	[3,4,5,6,-1]
                [3,3,4,5,6,-1]
             >	'A'	:	"BCDE"
                "ABCDE"
             >	2	:	[]
                [2]
             > 3 : 4 : 5 : 2 : []
                [3,4,5,2]
    
    / Não podemos nos esquecer que uma String (aspas duplas) é um apelido para lista de Char (aspas simples) ou, em Haskell, [Char]. /

  head - obtem o primeiro elemento
    tipo: head :: [a] -> a
    teste: head	"ABCDEFG" => retornado 'A' 

  last - obtem o último elemento
    tipo: last :: [a] -> a
    teste: last "ABCDEFG" => retornando 'G'

  tail - obtem o corpo, tirando o primeiro elemento (head)
    tipo: tail :: [a] -> [a]
    teste: tail	"ABCDEFG" => retornando 'BCDEFG'

  length - verifica o tamanho
    tipo: length :: Foldable t => t a -> Int
    teste: length	[1,2,3] => retornando 3

  reverse - inverte a ordem de qualquer tipo
    tipo: reverse :: [a] -> [a]
    teste: reverse "HASKELL" => retornando "LLEKSAH"

  take - pega um elemento
    tipo: take :: Int -> [a] -> [a]

  drop - remove
    tipo: drop :: Int -> [a] -> [a]

  max - pega o maior valor
    tipo: max :: Ord a => a -> a -> a

  min - pega o menor valor
    tipo: min :: Ord a => a -> a -> a

  sqrt - retorna a raiz quadrada de um argumento
    tipo: sqrt :: (Floating a) => a -> a -> a

  fst - Retorna o primeiro componente de um par de tuplas
    tipo: fst :: (a, b) -> a 
    A declaração nos diz que o tipo do primeiro componente (da tupla) deve ser o mesmo que o do retorno, mesmo a e b sendo diferentes tipos de variáveis, eles não devem ser necessariamente de tipos diferentes.

  snd - Retorna o segundo componente de um par de tuplas
  tipo: snd :: (a, b) -> b

  (==) :: (Eq a) => a -> a -> Bool
    A função de igualdade recebe dois argumentos de mesmo tipo e retorna um tipo Bool (True or False)

  elem :: (Foldable t, Eq a) => a -> t a -> Bool

        COMPREENSÃO DE LISTAS

        TUPLAS
    Diferentemente das listas,  que só  carregam dados de um tipo só com um número variável de elementos,	 as tuplas carregam diversos tipo ao mesmo tempo e possuem um	 número fixo de elementos. Não é possível usar a função cons (:), nem concatenar (++) nada a elas. Tuplas	são	imutáveis. O número de elementos	em uma	tupla	é fixo, e cada local no qual um	elemento reside é chamado de coordenada.
      Exemplo: foo	::	Char	->	Int	->	(Int,	String)
               foo	x	y	=	(y+9,	x:[x])
            >	foo	'E'	2
              (11,"EE").

        PATTERN MATCHING
    Consiste em specificar padrões aos quais alguns dados devem se conformar, verificando se o fazem e desvaindo os dados de acordo com esses padrões
      Exemplo: f :: (Int,	Int)	->	Int
               f (0,0)	=	0
               f (0,1)	=	1
               f (1,0)	=	1
               f (x,0)	=	x
               f (0,y)	=	y
               f (x,y)	=	x+y
            > f (0,0) => retornando 0
            > f (0,1) => retornando 1

        CAMPOS DE UM CONSTRUTOR
    Todo	value	constructor	pode	possuir	campos.
          data	Pessoa	=	Fisica	String	Int	|	Juridica	String
    Nesse	 exemplo,	 o	 tipo	 	 Pessoa	 	 possui	 dois	 values constructors: Fisica, que	possui dois	campos;	e Juridica, que possui apenas um.
        eXEMPLO: teste	::	Pessoa	->	(String,	String)	
                 teste	(Fisica	x	y)	=	("Nome:	"	++	x,	"Idade:	"	++	show	y)
                 teste	(Juridica	x)	=	("Nome:	"	++	x,	"Não	há	idade")

        LAMBDAS
    Funções sem corpo.

        FUNÇÕES DE ALTA ORDEM
  map - retorna uma lista construída aplicando uma função (o primeiro argumento) a todos os itens de uma lista aprovada como segundo argumento
    tipo: map :: (a -> b) -> [a] -> [b]
      Exemplo: map (+2)	[1..5] 
               [3,4,5,6,7]

  foldl - ele pega o segundo argumento e o primeiro item da lista e aplica a função a eles, em seguida, alimenta a função com este resultado e o segundo argumento e assim por diante. Consulte scanl para obter resultados intermediários.
    tipo: foldl :: (a -> b -> a) -> a -> [b] -> a
      Exemplos: foldl (+) 0 [1..4]
                10                    Explicando: (+)	0	1	[2,3,4]
                                                  (+)	1	2	[3,4]	
                                                  (+)	3	3	[4]	
                                                  (+)	6	4	[]	
                                                  10
      	  foldl	(\xs x -> x:xs) [] ''FATEC''
          ''CETAF''                   Explicando:'F':[]	"ATEC"	
                                                 'A':'F':[]	"TEC"
                                                 'T':'A':'F':[]	"EC"
                                                 'E':'T':'A':'F':[]	"C"	
                                                 'C':'E':'T':'A':'F':[]	""
                                                 ''CETAF''
          Vê-se que (\xs x->  x: xs) é um lambda, que nada mais é do que uma função sem corpo. Esta função recebe	uma lista xs e um valor x, e retorna o elemento x inserido à frente da lista xs	.

  filter - retorna uma lista construída a partir de membros de uma lista (o segundo argumento) cumprindo uma condição dada pelo primeiro argumento
    tipo: filter :: (a -> Bool) -> [a] -> [a]
      Exemplo: filter	(>0)	[-4..4]
             - [1,2,3,4]

    Função (.) - É o simples ato de chamar duas funções, ou mais, sendo que o retorno de uma é o argumento da outra.
    tipo: (.) :: (b -> c) -> (a -> b) -> a -> c
    Exemplo: traseira :: String -> String
             traseira []	= []
             traseira (x:xs) = xs
            
             contar :: String -> Int
             contar = length
          - (contar	.	traseira)	"Haskell" => retornando 6

    Função ($) - A função infixa $ recebe uma função e um valor, e aplica a função neste valor.
    Exemplo: contar	$	"Ola"`
             3

    Função (|>) - O infixl indica alta precedência à esquerda. É possível reescrever a seguinte função:
             func :: String -> String
             func x =	x ++ (tail (take 3 (reverse x)))
            
            Da seguinte forma:
             funcI :: String -> String
             funcI x = x	
            	|>	reverse
             	|>	take	3
             	|>	tail
             	|>	(x	++)

      SINTAXES EM FUNÇÕES
      Os guards são uma maneira de testar várias condições em uma função, de maneira similar a um if encadeado. 
      imc :: Double -> Double ->  Double
      imc p a	
      | p/(a*a) <= 18.5 = "Abaixo do peso"
      | p/(a*a) <	 25.0 = "Peso ideal"
      | p/(a*a) <= 30 = "Acima do peso"
      | otherwise = "Obesidade"
      where 
         valorImc = p / (a*a)

      CURRYING 


      RECURSÃO
    É um método de resolução de problemas que consiste na solução de pequenas instâncias do problema até achar a solução global. A recursão precisa de uma condição de base (de parada ou inicial) para que não se caia em loops infinitos.
    fat n
      | n <= 1 = 1	
      | otherwise = n * fat(n-1)
    > fat 5 => retornando 120
    Teste de mesa: fat 1 = 1
                   fat 2 = 2 * fat 1 = 2 * 1 = 2
                   fat 3 = 3 * fat 2 = 3 * 2 = 6
                   fat 4 = 4 * fat 3 = 6 * 4 = 24
                   fat 5 = 5 * fat 4 = 24*  5 = 120.

-}
