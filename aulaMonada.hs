--main = do
--  putStrLn "Hello"

{- 
  Monada:  
    Sites: 
      https://wiki.haskell.org/Monad
      https://haskell.pesquisa.ufabc.edu.br/teoria-das-categorias/16-monads/
      https://haskell.pesquisa.ufabc.edu.br/teoria-das-categorias/02-tipos-e-funcoes/

    Image:
      https://yogsototh.github.io/Category-Theory-Presentation/categories/img/mp/hask-endofunctor-objects.png
      https://toggl.com/blog/save-princess-8-programming-languages
      https://toggl.com/blog/kill-dragon-comic
-}

maybeLista :: Maybe a -> [a]
maybeLista (Just x) = [x]
maybeLista Nothing = []

listaMaybe :: [a] -> Maybe a
listaMaybe [x] = (Just x)
listaMaybe [] = Nothing

{- Exercicio acima:
> maybeLista (Just 5)
[5]
> (listaMaybe.maybeLista) (Just 5)
Just 5 -}


main :: IO ()
main = putStrLn "Digite um valor" >>
       getLine >>= \ x ->
       putStrLn (x ++ "Oi")

main2 :: IO ()
main2 = do
      x <- putStrLn "Digite um valor" 
      y <- getLine
      putStrLn (y ++ "Oi") 