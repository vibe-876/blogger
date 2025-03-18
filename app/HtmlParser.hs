module HtmlParser where


-- Notes is there for incase I want inline stuff in future.
data HTML = Pair Tag Content Notes
          | Single Tag Content

instance Show HTML where
  show (Pair t c n) = foldr (++) [] ["<", t, " ", n, ">", c, "</", t, ">"]
  show (Single t c) = foldr (++) [] ["<", t, " ", c, ">"]

type Tag = String
type Notes = String
type Content = String


fromLine :: String -> HTML
fromLine []     = Single "br" ""
fromLine (x:xs) | x == ';'  = Pair "h1" xs ""
                | x == '/'  = buildLink xs
                | otherwise = Pair "p" (x:xs) ""

buildLink :: String -> HTML
buildLink [] = Pair "p" "<b>EMPTY LINK!</b>" ""
buildLink xs = Pair "a" (takeWhile (/='!') xs) ("href = " ++ ((tail . dropWhile (/='!')) xs))
