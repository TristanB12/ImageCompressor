--
-- EPITECH PROJECT, 2021
-- pushswap_checker [WSL: Ubuntu-20.04]
-- File description:
-- opts
--

module Opts where

import Conf
import Data.Maybe ( isNothing )
import Text.Read (readMaybe)

getOpts :: Conf -> [String] -> Maybe Conf
getOpts Conf {
    Conf.nbColors = nbColors,
    Conf.limit = limit,
    Conf.path = path
} []
    | isNothing nbColors = Nothing
    | isNothing limit = Nothing
    | isNothing path = Nothing
    | otherwise = Just (Conf nbColors limit path)

getOpts Conf {
    Conf.nbColors = _,
    Conf.limit = limit,
    Conf.path = path
} ("-n":value:xs)
    | isNothing (readMaybe value :: Maybe Int) = Nothing
    | otherwise = getOpts (Conf (Just (read value :: Int)) limit path) xs

getOpts Conf {
    Conf.nbColors = nbColors,
    Conf.limit = _,
    Conf.path = path
} ("-l":value:xs)
    | isNothing (readMaybe value :: Maybe Double) = Nothing
    | otherwise = getOpts (Conf nbColors (Just (read value :: Double)) path) xs

getOpts Conf {
    Conf.nbColors = nbColors,
    Conf.limit = limit,
    Conf.path = _
} ("-f":value:xs)
    = getOpts (Conf nbColors limit (Just (read $ show value :: String))) xs

getOpts _ (_:xs) = Nothing