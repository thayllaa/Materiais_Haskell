main = do
  putStrLn "Hello fucking World!!"

{- 

Cap 5.5 Monoides
  Monoide é um typeclass e um elemento neutro. Para ser monoide, ela primeiro precisa ser um semi grupo (PESQUISAR POR CONTA!!!) Possiu mappend e mempty

  1+2+5+4
  sConcat = [1,2,5,4]

  LINKS:
    https://wiki.haskell.org/Monoid
    https://wiki.haskell.org/Newtype

Exercícios:
  5.1 , 5.2, 5.3, 5.4, 5.7, 5.8, 5.10 e 5.11
-}

data Numeros = Zero | Um | Dois | Tres | Erro deriving Show

instance Semigroup Numeros where
    Um <> Um = Dois
    Um <> Dois = Tres
    Dois <> Um = Tres
    mempty <> x = x
    x <> mempty = x
    _ <> _ = Erro

instance Monoid Numeros where
  mempty = Zero