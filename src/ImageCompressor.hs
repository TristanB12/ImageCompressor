--
-- EPITECH PROJECT, 2021
-- imageCompressor [WSL: Ubuntu-20.04]
-- File description:
-- ImageCompressor
--

module ImageCompressor where

import System.IO
import System.Random
import Conf
import Parser
import Types
import Clusters
import KMeans

imageCompressor :: Conf -> IO ()
imageCompressor Conf {
    Conf.nbColors = Just nbColors,
    Conf.limit = Just limit,
    Conf.path = Just path
} = do
    content <- readFile path
    let pixels = parsePixels $ lines content
    clusters <- initClusters nbColors pixels []
    printClusters $ kMeanLoop nbColors limit clusters [] pixels

printClusters :: [Cluster] -> IO ()
printClusters [] = putStr ""
printClusters (x:xs) =
    print x >>
    printClusters xs