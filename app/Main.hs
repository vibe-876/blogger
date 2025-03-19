module Main where

import System.Environment
import HtmlParser (renderHtml)


main :: IO ()
main = do
  args <- getArgs
  if (length args) >= 2
    then readFile (args !! 0) >>= writeFile ((args !! 1) ++  ".html") . renderHtml
    else print "Noooooo, too few arguments!"
