--main = do putStrLn "Hello"

{-

fmap :: (a -> b) -> f a -> f b
fmap [+1] [1] -> [2]
fmap (\ a -> Just a) (Just 5)
let ft x = Just x

Run: fmap (\ x -> Just x) (Just 5)
Return: Just (Just 5)

+ :: a -> a -> a
+1 :: a -> a

Run: fmap (+1) [1..5] / fmap (even) [1..5]
Return: [2,3,4,5,6]   / [False,True,False,True,False]

Link ref do arq ListChapter7:
      http://learnyouahaskell.com/functors-applicative-functors-and-monoids
-}

main :: IO ()
main = do
  x <- putStrLn "Digite valor:"
  y <- getLine
  putStrLn (y ++ " Haskell")