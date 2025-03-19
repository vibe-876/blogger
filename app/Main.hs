module Main where

import System.Environment
import HtmlParser (renderHtml)


main :: IO ()
main = do
  args <- getArgs
  readFile (args !! 0) >>= writeFile ((args !! 1) ++  ".html") . renderHtml
