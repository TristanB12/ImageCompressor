--
-- EPITECH PROJECT, 2021
-- image_compressor [WSL: Ubuntu]
-- File description:
-- Clusters
--

module Clusters where

import Types
import System.Random

initClusters :: Int -> [Pixel] -> [Cluster] -> IO [Cluster]
initClusters 0 pixels clusters = return clusters
initClusters k pixels clusters = do
    cluster <- randCluster pixels
    initClusters (k - 1) pixels (clusters ++ [cluster])

randCluster :: [Pixel] -> IO Cluster
randCluster pixels = do
    nb <- randNb $ length pixels
    color <- randColor nb pixels
    return (Cluster color [])

randNb :: Int -> IO Int
randNb len = randomRIO (0, len)

randColor :: Int -> [Pixel] -> IO Color
randColor n (Pixel point color:[]) = return color
randColor 0 (Pixel point color:xs) = return color
randColor n (x:xs) = randColor (n - 1) xs