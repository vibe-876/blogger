module HtmlParser where

import Data.List.Split

data HTML = Pair Tag Content Notes
          | Single Tag Content
 
instance Show HTML where
  show (Pair t c n) = concat ["<", t, " ", n, ">", c, "</", t, ">"]
  show (Single t c) = concat ["<", t, " ", c, ">"]

type Tag = String
type Notes = String
type Content = String


genHtml :: String -> String -> String
genHtml header body = genHead header ++ genBody body


genHead :: String -> String
genHead header = "<head>" ++ header ++ "</head>"

genBody :: String -> String
genBody input = "<body>" ++ (concatMap (show . fromLine) . splitOn "\n") input ++ "</body>"

fromLine :: String -> HTML
fromLine []     = Single "br" ""
fromLine (x:xs) | x == ';'  = Pair "h1" xs ""
                | x == '/'  = buildLink xs
                | otherwise = Pair "p" (x:xs) ""

buildLink :: String -> HTML
buildLink xs = Pair "a" content ("href=" ++ notes)
  where
    text = splitOn "!" xs
    (content : notes : rest) = if length text >= 2 then text else ("":"":[])
