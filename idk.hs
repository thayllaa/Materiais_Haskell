main = do
  putStrLn "Hello"

{-
  5c
foldl (/ b a -> [a] ++ b) "" ['F','A'] 
> AF

  5d
reverse "FA" == foldl (\ b a -> [a] ++ b) "" ['F', 'A']
> True
-}
