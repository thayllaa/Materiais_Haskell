main = do
  putStrLn "Hello"
  putStrLn "World"

(+-) :: (Num a) => a -> a
(+-) x = x +2

funcao :: Int -> Int
funcao x = x + x * 10 `div` 2 

geraLista :: Int -> [Int]
geraLista valor = [ x | x <- [1..valor] ] 

aplicaFunc :: (Int -> Int) -> [Int] -> [Int]
aplicaFunc funcao xs = [ funcao x | x <- xs ]