main = do
  putStrLn "Hello"

{-

Polimorfismo Paramétrico: permite uma generalização de comportamentos. Todas as linguagens de programação possui polimorfismo, exceto Cobol. Haskell não possui polimorfismo de tipo

Em Java:
List<Pessoa> pessoas = new Array<List()>; => agora veremos em Haskell

:t Caixa > Caixa :: a -> Caixa a
> let d = Caixa 33 > dando :t em Caixa, ele muda o seu tipo

- kind emxerga tos tipos de comoo funções de tipos. Existem 3 kinds: somente o lado esquerdo importa, pois o mesmo define a quantidade - ignorar o lado direito
:kind Caixa
Caixa :: * -> *

Phantom Type: ter um tipo a mais do lado esquerdo, que não será usado do lado oposto.
-- https://wiki.haskell.org/Phantom_type

Não é preciso definir o tipo do 2o objeto.
> CaixaDois 3 True

Java pode ser dinamicamente tipado. Todas as linguagens que são dinamicamente tipadas herdam o Object.

Condição Inicial:
Condição de Parada:

HashSet (Java): implementado como uma tabela hash (na verdade uma instância de HashMap é usada como apoio), uma matriz na qual os elementos são armazenados em uma posição derivada de seu conteúdo.
-}

-- data Caixa a b = CaixaUm a | CaixaDois a b

-- data Lista a = Vazio | a :>: (Lista a) deriving Show
-- (::) delimita o operador
-- > (3 :>: (4 :>: Vazio))

-- em ordem 2+2
data Lista a = Final | a :>: (Lista a) deriving (Show)

-- (::) delimita o operador
-- >(4 :>: (10 :>: Final))

data Pessoa = Fisica {nome :: String} | Juridica String deriving (Show)

-- > ((Juridica "11") :>: ((Fisica 33) :>: Final))
-- retorna Juridica "11" :>: (Fisica {cpf = 33} :>: Final)
-- > Phase (Fisica "Felps") (Phase(Fisica{nome = "Andrew"}) Null)

-- Map indexado
data Mapa a b = Fim | Ma a b (Mapa a b)

-- pre-ordem +22
data List a = Null | Element a (List a) deriving (Show)

percorrerLista :: List a -> [a]
percorrerLista Null = []
percorrerLista (Element x list) = [x] ++ percorrerLista list

inserirElement :: a -> List a -> List a
inserirElement valor Null = Element valor Null
inserirElement valor (Element x list) = Element x (inserirElement valor list)

{-
let list = Element 4 (Element 5 (Element 6 Null))
percorrerLista list
  [4,5,6]

inserir mais de 1 valor
let list = Element 4 (Element 5 (Element 6 Null))
inserirElement 40 $ inserirElement 50 $ inserirElement 60 $ inserirElement 70 list

  Element 4 (Element 5 (Element 6 (Element 50 (Element 40 Null))))
inserirElement 7 list
  Element 4 (Element 5 (Element 6 (Element 7 Null)))
-}
