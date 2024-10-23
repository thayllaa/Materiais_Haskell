main = do
  putStrLn "Hello"

{- Cap 4 - Um Pouco de Sobre Funções
  4.1 Lambdas (funções anônimas): Não é preciso declara uma função em um contexto para utilizá-la. 
Exemplos: (\ x -> x + 1) 2, seu retorno é 3
          (\ xs -> reverse xs) "FATEC", retornando "CETAF"
          (\ x xs -> x ++ xs) "T" "haylla"
          (\ x -> even x) 4, retornando True, já que 4 é um número par

  4.2 Funções de Alta Ordem: função que recebe uma função como parâmetro. Os dois tipos passados em aula foram (.) e ($).
Exemplo com Lambda: aplicaFunc (\ x y -> x * y ) 2 4 = 8
                    aplicaFuncao (\ x y -> x ++ y) "T" "S" retorna TS
                    aplicaFuncao (\ x y -> x + y) 4 4 retorna 8
                    aplicaFuncao (\ x y -> x > y) 4 4 retorna False
  4.3 Currying: a technique that transforms a function of several arguments to a function of a single argument
Exemplo: somar2 :: Int -> Int 
         somar2 y = 2 + y0
Eta Reduction
-}

somar :: Int -> Int -> Int
somar x y = x + y

aplicaFunc :: (Int -> Int -> Int) -> Int -> Int -> Int 
aplicaFunc func x y = func x y
-- ou também aplicaFunc func = func

aplicaFuncao :: (a -> b -> c) -> a -> b -> c
aplicaFuncao func x y = func x y 

{- Dois tipos de MAP
    map :: (a -> b) -> [a] -> [b] 
    fmap :: Functor f => (a -> b) -> f a -> f b
    filter :: (a -> Bool) -> [a] -> [a]

Exemplos:
  map ("f"++) ["elicidade", "elipe"]
  filter (\ x -> even x) [1..39]
  filtro xs x = filter (\ nome -> nome == x) xs
  filter (\ nome -> nome == "Claudia") ["Felipe", "Claudia", "Marcela"]
-}

filtro :: (Eq a) => [a] -> a -> [a]
filtro xs x = filter (== x) xs