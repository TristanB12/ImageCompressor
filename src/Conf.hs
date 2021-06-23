--
-- EPITECH PROJECT, 2021
-- imageCompressor [WSL: Ubuntu-20.04]
-- File description:
-- conf
--

module Conf where

data Conf = Conf {
    nbColors :: Maybe Int,
    limit :: Maybe Double,
    path :: Maybe String
} deriving (Show, Eq)

defaultConf :: Conf
defaultConf = Conf {
    nbColors = Nothing,
    limit = Nothing,
    path = Nothing
}