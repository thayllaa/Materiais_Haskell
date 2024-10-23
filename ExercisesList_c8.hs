main = do
  putStrLn "Hello. Exercises: 8.1 to 8.4"
  putStrLn "  Membros: Thay, Leo"

{- 8.1) Faça um tipo Caixa com um type parameter a e três construtores chamados Um, Dois e Tres possuindo um, dois e três campos de tipo a, respectivamente -}
data Caixa a = Um a | Dois a a | Tres a a a deriving (Show, Eq)

{- Faça uma instância de Functor para o tipo Caixa. A função deve ser aplicada em todas as coordenadas dos valores (Um, Dois ou Tres) -}
instance Functor Caixa where
  fmap f (Um x) = Um (f x)
  fmap f (Dois x y) = Dois (f x) (f y)
  fmap f (Tres x y z) = Tres (f x) (f y) (f z)

instance Applicative Caixa where
  pure = Um
  (<*>) (Um f) (Um y) = Um (f y) 
  (<*>) (Dois e f) (Dois x y) = Dois (e x) (f y) 
  (<*>) (Tres e f g) (Tres x y z) = Tres (e x) (f y) (g z)
  (<*>) (Um g) (Dois x y) = Dois (g x) (g y)
  (<*>) (Um g) (Tres x y z) = Tres (g x) (g y) (g z)

{- Crie uma instância de Monad para o tipo Caixa. Seu return deve ser o value constructor de Um -}
instance Monad Caixa where
  return = Um
  (Um x) >>= f = f x
  (Dois x y) >>= f = f y
  (Tres x y z) >>= f = f z

{- 8.2) Crie uma função mult234 :: Double -> Caixa Double que receba uma parâmetro x e devolva o dobro de x na primeira coordenada, o triplo na segunda e o quádruplo na terceira usando o operador >>= -}
daCaixa :: Caixa a -> a 
daCaixa (Um x) = x
    
mult234 :: Double -> Caixa Double
mult234 x = Tres  ( daCaixa (Um x >>= (\x -> return(x*2))) ) ( daCaixa (Dois x x >>= (\x -> return(x*3))) ) ( daCaixa (Tres x x x >>= (\x -> return(x*4))) ) 

{- 8.3) 
  Tres 1 2 3 >>= mult234 >>= mult234
  retorna: Tres 24.0 36.0 48.0

	Dois 2 4 >>= mult234
  retorna: Tres 8.0 12.0 16.0

  :kind Coisa
  retorna: Coisa :: * -> *

	Dois 2 3 >>= \_ -> Dois 7 7
  retorna: Dois 7 
-}

{- 8.4) -}
mult456 :: Double -> Caixa Double
mult456 x = do
  w <- return x
  x <- return (w*4)
  y <- return (x*5)
  z <- return (y*6)
  return z