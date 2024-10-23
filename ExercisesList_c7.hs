main = do
  putStrLn "Exercícios: 7.1 à 7.4. Dupla: Thay, Leo"

{- 7.1) Faça uma instância de Functor para o tipo Coisa, definido no início do capítulo 5. A função g deve "ir	para dentro" em todas as coordenadas de Coisa. No caso de ZeroCoisa, o fmap deve retornar ZeroCoisa -}

data Coisa a = UmaCoisa a | DuasCoisas a a | ZeroCoisa deriving (Show)

instance Functor Coisa where
  fmap g ZeroCoisa = ZeroCoisa
  fmap g (UmaCoisa x) = UmaCoisa (g x)
  fmap g (DuasCoisas x y) = DuasCoisas (g x) (g y)

{- 7.2) Aproveitando o exercício anterior, faça uma instância de Applicative Functor para o tipo Coisa -}
instance Applicative Coisa where
  pure = UmaCoisa
  ZeroCoisa <*> _ = ZeroCoisa
  (UmaCoisa f) <*> (UmaCoisa x) = UmaCoisa (f x)
  (UmaCoisa f) <*> (DuasCoisas x y) = DuasCoisas (f x) (f y)
  (DuasCoisas f g) <*> (DuasCoisas x y) = DuasCoisas (f x) (g y)

{- 7.4) Escreva uma instância para Functor e Applicative para o tipo Arvore, visto no capítulo 5 -}
data Arvore a = Nulo | Folha a | Ramo a (Arvore a) (Arvore a) deriving (Show)

instance Functor Arvore where
  fmap g Nulo = Nulo
  fmap g (Folha x) = Folha (g x)
  fmap g (Ramo c l r) = Ramo (g c) (fmap g l) (fmap g r)

instance Applicative Arvore where
  pure = Folha
  (<*>) (Folha f) (Folha x) = Folha (f x)
  (<*>) (Folha f) (Ramo c l r) = Ramo (f c) (fmap f l) (fmap f r)
  (<*>) (Ramo x y z) (Ramo c l r) = Ramo (x c) ((<*>) y l) ((<*>) z r)
  (<*>) (Ramo x y z) _ = Nulo
  (<*>) _ _ = Nulo