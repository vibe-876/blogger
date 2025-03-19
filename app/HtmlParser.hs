module HtmlParser where

import Data.List.Split

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
buildLink xs = Pair "a" content ("href=" ++ notes)
  where
    text = splitOn "!" xs
    (content : notes : rest) = if length text >= 2 then text else ("":"":[])
