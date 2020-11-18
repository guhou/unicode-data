-- |
-- Module      : Data.Unicode.Properties.Decompose
-- Copyright   : (c) 2020 Composewell Technologies and Contributors
-- License     : Apache-2.0
-- Maintainer  : streamly@composewell.com
-- Stability   : experimental
--
module Data.Unicode.Properties.Decompose
    ( decomposeChar
    , decomposeCharHangul
    , DecomposeMode(..)
    , isHangul
    , jamoLFirst
    , isDecomposable
    )
where

import qualified Data.Unicode.Properties.Decomposable    as D
import qualified Data.Unicode.Properties.DecomposableK   as K
import           Data.Unicode.Properties.DecomposeHangul ( decomposeCharHangul
                                                         , jamoLFirst
                                                         , isHangul)
import qualified Data.Unicode.Properties.Decompositions  as D
import qualified Data.Unicode.Properties.DecompositionsK as K

data DecomposeMode = DecomposeNFD | DecomposeNFKD

-- | Given the 'DecomposeMode' @D@ and a character @c@, decompose @c@ into its
-- normal form in @D@.
{-# INLINE decomposeChar #-}
decomposeChar :: DecomposeMode -> Char -> [Char]
decomposeChar DecomposeNFD  = D.decomposeChar
decomposeChar DecomposeNFKD = K.decomposeChar

-- | Given the 'DecomposeMode' @D@ and a character @c@, return True if @c@ is
-- decomposable in @D@. This does not work for Hangul characters.
{-# INLINE isDecomposable #-}
isDecomposable :: DecomposeMode -> Char -> Bool
isDecomposable DecomposeNFD  = D.isDecomposable
isDecomposable DecomposeNFKD = K.isDecomposable
