module HtmlParser where


-- Notes is there for incase I want inline stuff in future.
data HTML = Pair Tag Content
          | Single Tag Content

instance Show HTML where
  show (Pair t c)   = foldr (++) [] ["<", t, ">", c, "</", t, ">"]
  show (Single t c) = foldr (++) [] ["<", t, " ", c, ">"]

type Tag = String
type Notes = String
type Content = String


fromLine :: String -> HTML
fromLine []     = Single "br" ""
fromLine (x:xs) | x == ';'  = Pair "h1" xs
                | otherwise = Pair "p" xs
