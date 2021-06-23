--
-- EPITECH PROJECT, 2021
-- image_compressor [WSL: Ubuntu]
-- File description:
-- KMeans
--

module KMeans where

import Clusters
import Types
import Utils
import Conf

type Index = Int
type Distance = Double
type Limit = Double

kMeanLoop :: Int -> Limit -> [Cluster] -> [Cluster] -> [Pixel] -> [Cluster]
kMeanLoop k l clusters prev pixels =
    case converging of
        True -> clusters
        False -> kMeanLoop k l adjustedClusters clusters pixels
        where converging = isConverging l clusters prev
              adjustedClusters = adjustClusters
                                (sortPixels (clearCluster clusters) pixels)

sortPixels :: [Cluster] -> [Pixel] -> [Cluster]
sortPixels c [] = c
sortPixels c (x:xs) =
    sortPixels (addPixelToCluster (findCluster 0 (0, 442) c x) x c) xs

findCluster :: Index -> (Index, Distance) -> [Cluster] -> Pixel -> Index
findCluster index (i, d) [] pixel = i
findCluster index (i, d) (Cluster mean pixels:xs) (Pixel point color)
    = case dist < d of
        True -> findCluster (index + 1) (index, dist) xs (Pixel point color)
        False -> findCluster (index + 1) (i, d) xs (Pixel point color)
    where dist = euclideanDist mean color

addPixelToCluster :: Index -> Pixel -> [Cluster] -> [Cluster]
addPixelToCluster _ _ [] = []
addPixelToCluster 0 pixel (Cluster mean pixels:xs) =
        Cluster mean (pixels ++ [pixel]) : addPixelToCluster (-1) pixel xs
addPixelToCluster i pixel (x:xs) = x : addPixelToCluster (i - 1) pixel xs

isConverging :: Limit -> [Cluster] -> [Cluster] -> Bool
isConverging l [] [] = True
isConverging l _ [] = False
isConverging l (Cluster ma _:as) (Cluster mb _:bs) = case dist < l of
                                True -> isConverging l as bs
                                False -> False
                        where dist = euclideanDist ma mb

adjustClusters :: [Cluster] -> [Cluster]
adjustClusters [] = []
adjustClusters (Cluster mean [] :xs) =
                Cluster mean [] : adjustClusters xs
adjustClusters (Cluster mean pixels :xs) =
                Cluster (getAverage pixels 0) pixels : adjustClusters xs

getAverage :: [Pixel] -> Int -> Color
getAverage (Pixel point color :xs) 1 = color
getAverage pixels n = divideColor (getSum pixels) (length pixels)

getSum :: [Pixel] -> Color
getSum [] = Color 0 0 0
getSum (Pixel point color :xs) = addColors color (getSum xs)

