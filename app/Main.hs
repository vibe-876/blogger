module Main where

import System.Environment
import HtmlParser (genHtml)


main :: IO ()
main = do
  args <- getArgs
  if (length args) >= 3
    then do input <- readFile (args !! 0)
            header <- readFile (args !! 2)
            writeFile ((args !! 1) ++ ".html") (genHtml header input)
                                                   
    else print "Noooooo, too few arguments!"
