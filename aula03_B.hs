main = do
  putStrLn "Hello"

-- pattern matching: capacidade de definir a implemtção de uma funcao baseada no valor de um dado
-- Foo :: Int -> Int
-- Foo 1 = "um"; Foo 2 = "dois

numText :: Int -> String
numText 1 = "um"
numText 2 = "dois"
numText x = show x

data Pessoa = Pessoa String Int deriving Show
pessoaNome :: Pessoa -> String
pessoaNome (Pessoa nome _) = nome

pessoaIdade :: Pessoa -> Int
pessoaIdade (Pessoa idade _) = idade

data Pessoa1 = Pessoa1(nm::String, idd::Int) deriving Show