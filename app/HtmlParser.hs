module HtmlParser where


data HTML = Pair Tag Notes Content

type Tag = String
type Notes = String
type Content = String


toHtml :: [HTML] -> String
toHtml []     = ""
toHtml (Pair t n c:hs) = (foldr (++) [] ["<", t, " ", n, ">", c, "</", t, ">"]) ++ toHtml hs
