showHour 1 = "one"
showHour 2 = "two"
showHour 3 = "three"
showHour 4 = "four"
showHour 5 = "five"
showHour 6 = "six"
showHour 7 = "seven"
showHour 8 = "eight"
showHour 9 = "nine"
showHour 10 = "ten"
showHour 11 = "eleven"
showHour 0 = "twelve"

showMinute 0 = ""
showMinute 5 = "five past "
showMinute 10 = "ten past "
showMinute 15 = "quarter past "
showMinute 20 = "twenty past "
showMinute 25 = "twenty-five past "
showMinute 30 = "half past "
showMinute 35 = "twenty-five to "
showMinute 40 = "twenty to "
showMinute 45 = "quarter to "
showMinute 50 = "ten to "
showMinute 55 = "five to "

fuzz :: (Double, Double) -> String
fuzz (h, m) = showMinute m' ++ showHour h'
  where m' = 5 * round (m / 5) `mod` 60
        h' = round (h + (m / 60)) `mod` 12

parse :: String -> (Double, Double)
parse x = (read h, read m)
  where h = takeWhile (/=':') x
        m = if ':' `elem` x
            then takeWhile (/=':') $ tail $ dropWhile (/=':') x
            else "0"

main = interact $ concat
                . map (unlines . map (fuzz . parse) . words)
                . lines
