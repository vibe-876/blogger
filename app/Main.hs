module Main where

import HtmlParser (renderHtml)


main :: IO ()
main = readFile "test" >>= writeFile "post.html" . renderHtml
  
