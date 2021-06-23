--
-- EPITECH PROJECT, 2021
-- imageCompressor [WSL: Ubuntu-20.04]
-- File description:
-- Parser
--

module Parser where

import Types
import Utils

parsePixels :: [String] -> [Pixel]
parsePixels = map parsePixel

parsePixel :: String -> Pixel
parsePixel str =
    Pixel {
        point = parsePoint $ head tab,
        color = parseColor $ tab !! 1
    } where tab = words str

parsePoint :: String -> Point
parsePoint str =
    Point {
        x = parseToken str 0,
        y = parseToken str 1
    }

parseColor :: String -> Color
parseColor str
    | r < 0 || r > 255 = error "Invalid red value"
    | g < 0 || g > 255 = error "Invalid green value"
    | b < 0 || b > 255 = error "Invalid blue value"
    | otherwise = Color { r = r, g = g, b = b }
    where r = parseToken str 0
          g = parseToken str 1
          b = parseToken str 2

parseToken :: String -> Int -> Int
parseToken str index =
    read (tab !! index) :: Int
    where tab = splitDelim ',' $ removeParentheses str