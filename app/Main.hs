module Main where

import HtmlParser (renderHtml)


main :: IO ()
main = do
  inputString <- readFile "test"
  print (renderHtml inputString)
