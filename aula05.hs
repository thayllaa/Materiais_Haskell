main = do
  putStrLn "Hello World"

{- 4.6 Recursão
Toda recursividade tem um 
  Caso Base: quando o indice for 1 ou 2 retorna 1
      B = []
  Passo Indutivo: tk = tk-1 + tk-2
      PI = xs

A recusão é feita pela chamada de uma função - peat, repeat
- cycle é uma lista infinita
Exemplos: cycle [1,2]
          take 4 cycle [1,2], que vai retornar [1,2,1,2]
-} 

inverteLista :: [a] -> [a]
inverteLista [] = []
inverteLista (x:xs) = inverteLista xs ++ [x]

{- 
[2,4,5] 
 x, xs

inverteLista [1,2,3] = [3,2,1]
inverteLista (1:[2,3]) = inverteLista [2,3[ ++ [1] 
inverteLista (2:[3]) = inverteLista [3] ++ [2]
inverteLista (3:[]) = inverteLista [] ++ [3]
inverteLista [] = [] 
-} 

fat :: Int -> Int
fat 0 = 1
fat 1 = 1
fat k = k * fat (k -1)

fat' :: Int -> Int
fat' k 
      | k < 0 = k 
      | k == 0 = 1
      | k == 1 = 1
      | otherwise = k * fat (k -1)

fat'' :: Int -> Int
fat'' k 
      | foraDosNaturais = k 
      | casoBase1 = 1
      | casoBase2 = 
      | otherwise = k * fat (k -1)
      where
        foraDosNaturais = k < 0
        casoBase1 = k == 0
        casoBase2 = k == 1

par :: Int -> Int
par = even

nada :: Int -> String
nada x = show x

verificarPares :: [Int] -> [String]
verificarPares xs = [ nada x | x <- xs, par x ]
{- Para fazer o exercicio do primo, primeiro fazer verificaPrimo-}