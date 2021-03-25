import System.Environment (getArgs) -- для считывания из консоли

somesum :: Int -> Int -> Int -- max for n = 75 000, m = 3
somesum n m = sum [ k^m | k <- [1..n]]

s_3 :: Float -> Float
s_3 n = (n*(n+1)/2)^2

-- ghci
-- :l somesum.hs
-- *Main> somesum 75000 3
-- 7910367188906250000
-- *Main> s_3 75000
-- 7.9103677e18
-- :q


main :: IO ()
main = do args <- getArgs
          case args of [n, m] -> do putStr "Сумма равна: "
                                    print $ somesum (read n) (read m)
                                    putStr "Проверочная сумма равна: "
                                    print $ s_3 (read n)
                       _      -> putStrLn "Некорректные данные, \
                                          \программа ожидает два натуральных числа a и b"

-- ghc somesum.hs или ghc -o somesum somesum.hs
-- запуск: ./somesum 75000 3

-- Examples  ./somesum 75 3
-- Сумма равна: 8122500
-- Проверочная сумма равна: 8122500.0

