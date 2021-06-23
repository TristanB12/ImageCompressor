--
-- EPITECH PROJECT, 2021
-- B-FUN-300-RUN-3-1-pushswapchecker-julien.pause [WSL: Ubuntu-20.04]
-- File description:
-- UnitTests
--

module Main (main) where

import System.Exit
import Test.HUnit

main :: IO ()
main = do
    counts <- runTestTT (test [
            
        ])
    if errors counts + failures counts == 0
        then exitSuccess
        else exitFailure