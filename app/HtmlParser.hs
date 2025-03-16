module HtmlParser where


-- Notes is there for incase I want inline stuff in future.
data HTML = Pair Tag Notes Content
-- A line should be in this format.
data Line = Tag Content

type Tag = String
type Notes = String
type Content = String


toHtml :: HTML -> String
toHtml (Pair t n c) = foldr (++) [] ["<", t, " ", n, ">", c, "</", t, ">"]

