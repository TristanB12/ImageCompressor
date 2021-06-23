--
-- EPITECH PROJECT, 2021
-- imageCompressor [WSL: Ubuntu-20.04]
-- File description:
-- utils
--

module Utils where

import Types

import System.Random

removeParentheses :: String -> String
removeParentheses [] = []
removeParentheses ('(':xs) = removeParentheses xs
removeParentheses (')':xs) = removeParentheses xs
removeParentheses (x:xs) = x : removeParentheses xs

splitDelim :: Char -> String -> [String]
splitDelim delim xs = case break (== delim) xs of
    (y, _ : ys) -> y : splitDelim delim ys
    (y, []) -> [y]

euclideanDist :: Color -> Color -> Double
euclideanDist (Color r1 g1 b1) (Color r2 g2 b2) =
        sqrt(fromIntegral((r1-r2)^2 + (g1-g2)^2 + (b1-b2)^2))

clearCluster :: [Cluster] -> [Cluster]
clearCluster [] = []
clearCluster ((Cluster mean pixels):xs) = Cluster mean [] : clearCluster xs

addColors :: Color -> Color -> Color
addColors (Color r g b) (Color r2 g2 b2) = Color (r + r2) (g + g2) (b + b2)

divideColor :: Color -> Int -> Color
divideColor (Color r g b) d = Color (r `div` d) (g `div` d) (b `div` d)