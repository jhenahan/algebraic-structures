module Math.Algebra.Structures.Magma
                                 (
                                  Magma(..)
                                 )
where

import GHC.Int
import qualified Prelude
import Control.Category ((.),id)
import Data.Functor (fmap, Functor(..))

class PartialMagma a where
  (~⋅) :: a -> a -> a
  infix 9 ~⋅

class Magma a where
  (⋅) :: a -> a -> a
  infix 9 ⋅

data FreeMagma a
     = Element a
     | Op (FreeMagma a) (FreeMagma a)
     deriving (Prelude.Show)

newtype SumWise a = SumWise { getSum :: a } deriving (Prelude.Num, Prelude.Show, Functor)
newtype ProductWise a = ProductWise { getProduct :: a } deriving (Prelude.Num, Prelude.Show, Functor)

instance Magma (FreeMagma a) where
  (⋅) = Op

instance Magma (SumWise Int) where
  (⋅) = (Prelude.+)

instance Magma (ProductWise Int) where
  (⋅) = (Prelude.*)

instance Magma (SumWise Prelude.Integer) where
  (⋅) = (Prelude.+)

instance Magma (ProductWise Prelude.Integer) where
  (⋅) = (Prelude.*)
