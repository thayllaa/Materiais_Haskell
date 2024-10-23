main = do
  putStrLn "Hello"

-- 3a
data Pessoa = Fisica {nf :: String, cpf :: Int} | Juridica {nj :: String, cnpj :: Int} deriving Show

--3b
pessoasFisicas :: [Pessoa] -> [Pessoa]
pessoasFisicas xs = filter pfisica xs

pfisica :: Pessoa -> Bool 
pfisica (Fisica __) = true
pfisica (Juridica __) = false

-- 4
trib :: Int -> Int
trib x 
  | x < 0 = 0 
  | x <= 3 = 1
  | x > 3 = trib(x -1) + trib(x -2) + trib(x -3)

-- 5
