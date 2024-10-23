main = do
  putStrLn "Hellow"

{-
Pré +22
Ordem 2+2
Pós 22+

RED ERD EDR
-}

data Pessoa = Fisica | Juridica deriving (Read)

foo :: Show a => a -> String
foo x = show x

-- class Show a where
      -- show a = show a 

instance Show Pessoa where
-- Pode tambem retornar uma String 
   show Fisica = "Palavra" 
   show Juridica = show Juridica

{-
class Eq a where
   (==) :: a -> a -> Bool
   (/=) :: a -> a -> Bool

abs(-10) 
retorna 10

Tabela ASC 
-} 

data Numeros = Um | Dois | Tres deriving Show
(+) Um Um = Dois

