--
-- EPITECH PROJECT, 2021
-- imageCompressor [WSL: Ubuntu-20.04]
-- File description:
-- Main
--

module Main where

import System.Environment ( getArgs )
import System.Exit ( exitWith, ExitCode(ExitFailure) )
import Opts
import Conf
import ImageCompressor
import  Clusters
import Types

main :: IO Int
main = do
    args <- getArgs
    case getOpts defaultConf args of
        Just conf -> imageCompressor conf >> return 0
        Nothing -> exitWith (ExitFailure 84)