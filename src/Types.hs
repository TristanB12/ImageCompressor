--
-- EPITECH PROJECT, 2021
-- imageCompressor [WSL: Ubuntu-20.04]
-- File description:
-- Types
--

module Types where

import Text.Printf
import Data.List

data Point = Point {
    x :: Int,
    y :: Int
} deriving (Eq)

instance Show Point where
    show (Point x y) = printf "(%d,%d)" x y

data Color = Color {
    r :: Int,
    g :: Int,
    b :: Int
} deriving (Eq)

instance Show Color where
    show (Color r g b) = printf "(%d,%d,%d)" r g b

data Pixel = Pixel {
    point :: Point,
    color :: Color
} deriving (Eq)

instance Show Pixel where
    show (Pixel point color) = printf "%s %s" (show point) (show color)

data Cluster = Cluster {
    mean :: Color,
    pixels :: [Pixel]
}

instance Show Cluster where
    show (Cluster mean pixels) =
        printf "--\n%s\n-\n%s" (show mean) (intercalate "\n" $ map show pixels)
