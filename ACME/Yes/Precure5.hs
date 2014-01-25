module ACME.Yes.Precure5 where

import System.Random

data Precure5 =
  CureDream | CureRouge | CureLemonade | CureMint | CureAqua
  deriving (Show, Bounded, Enum)

instance Random Precure5 where
  randomR (a, b) g =
    let (p, g') = randomR (fromEnum a, fromEnum b) g
        in (toEnum p, g')
  random = randomR (minBound, maxBound)

transformationPhrase :: Precure5 -> String
transformationPhrase CureDream    = "大いなる希望の力、キュアドリーム！"
transformationPhrase CureRouge    = "情熱の赤い炎、キュアルージュ！"
transformationPhrase CureLemonade = "はじけるレモンの香り、キュアレモネード！"
transformationPhrase CureMint     = "安らぎの緑の大地、キュアミント！"
transformationPhrase CureAqua     = "知性の青き泉、キュアアクア！"

fullTransformationPhrase  :: [Precure5] -> String
fullTransformationPhrase ps =
     "プリキュア！メタモルフォーゼ！\n"
  ++ (unlines $ map transformationPhrase ps)
  ++ "希望の力と未来の光！\n"
  ++ "華麗に羽ばたく5つの心！"
  ++ "Yes！プリキュア5！"
