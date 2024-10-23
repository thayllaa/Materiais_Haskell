main = do
  putStrLn "Hello, Haskell!"

{- 4.1) Faça uma função	que	retorne	a	média de um [Double], usando foldl -}
media :: Double -> [Double] -> Double
media x xs = (foldl (+) x xs)/fromIntegral (length xs)

{- 4.2) Faça uma função que receba uma [String] e retorne todos os elementos palíndromos. Ver exercício 3.7 -}
palindromo :: String -> Bool
palindromo x = x == reverse x

listaPalindromo :: [String] -> [String]
listaPalindromo = filter palindromo

{- 4.3) Implemente uma função que filtre os números pares e outra que filtre os ímpares de uma lista recebida via parâmetro -}
filtraPar = filter even [1..30]
filtraImpar = filter odd [1..30]

{- 4.4) Filtre os números primos de uma lista recebida por parâmetro -}
primos :: [Int] -> [Int]
primos n = filter (\elemento -> (length $ filter (\x -> mod elemento x == 0) [1 .. elemento]) == 2) n

{- 4.5) Implemente uma função que receba uma lista de inteiros e retorne o dobro de todos, eliminando os múltiplos de 4 -}
funcInteiros :: [Int] -> [Int]
funcInteiros x = filter (\x -> mod x 4 /= 0) (map (\x -> 2 * x) x)

{- 4.6) Faça uma função func que receba uma função f de tipo (String -> String), e uma String s que retorna o reverso de s concatenando com aplicação da função f em s -}
funcF :: String -> String 
funcF f = [head f] ++ [last f]

func :: (String -> String) -> String -> String
func xs s = reverse s ++ xs(s)

{- 4.7) Crie um tipo Dia contendo os dias da semana. Faça uma função que receba uma lista de Dias e filtre as Terças -}
data Dia = Segunda | Terca | Quarta | Quinta | Sexta | Sabado | Domingo deriving (Show, Enum, Eq)

filtraTerca :: [Dia] -> [Dia]
filtraTerca x = filter (\x -> x == Terca) x
{- teste: filtraTerca [Segunda,Terca,Quarta] -}

{- 4.9) Usando a função foldl, crie lambdas para -}
 -- A) Contar números negativos de uma lista de Int --
numNegativos :: [Int] -> Int
numNegativos x = (\ x -> foldl (\ y _ -> y + 1) 0 $ filter (<0) x ) [-6..4]

 -- B) Contar letras 'P' de uma String -- 
contarPs :: Int -> Char -> Int
contarPs a b 
    | elem b "pP" = a + 1
    | otherwise = a
-- teste: foldl contarPs 0 "paralelepipedo"

 -- C) Para contar Sábados em uma lista de um [DiaSemana] --
contarSabados :: Int -> Dia -> Int
contarSabados conta x
    | x == Sabado = conta + 1
    | otherwise = conta
{- teste: foldl contarSabados 0 [Sexta,Sabado,Domingo,Sabado] -}

{- D) Para, a partir de uma lista de [DiaSemana], retornar a soma dos dias. 
      Exemplo: [Segunda, Segunda, Quarta] deve retornar 5. Use uma função auxiliar para converter DiaSemana para Int -}
numeroDiaSemana :: Dia -> Int
numeroDiaSemana Segunda = 1 
numeroDiaSemana Terca = 2
numeroDiaSemana Quarta = 3
numeroDiaSemana Quinta = 4
numeroDiaSemana Sexta = 5
numeroDiaSemana Sabado = 6
numeroDiaSemana Domingo = 7

somarDiaSemana :: Int -> Dia -> Int
somarDiaSemana x y = x + (numeroDiaSemana y)
{- foldl somarDiaSemana 0 [Sexta,Segunda,Segunda,Quarta] -}
