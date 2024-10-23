main = do
    putStrLn "Atividade-De-Haskell"

-- Ex1. Crie uma função que receba uma string e retorne o reverso da string.
invertendo :: String -> String
invertendo palavra = reverse palavra

-- Ex2. Crie uma função que receba duas strings, verifique se são palindromas e retorne true ou false.
palindromas :: String -> String -> Bool
palindromas palav1 palav2 = palav1 == reverse palav1 && palav2 == reverse palav2

-- Ex3. Crie uma função que receba uma String e retorne o primeiro e ultimos elementos concatenados.
lista :: String -> String
lista elemento = [head elemento] ++ [last elemento]

-- Ex4. Crie uma função que receba um vetor de inteiros e retorne a somatoria destes vetor.
somaLista :: [Int] -> Int
somaLista x = sum x

-- Ex5. Crie uma função que verifique se o tamanho de uma String é par ou não. Use Bool como retorno.
stringPares :: String -> Bool
stringPares palavraPar = even (length palavraPar)