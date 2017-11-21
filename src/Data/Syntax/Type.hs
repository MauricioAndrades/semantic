{-# LANGUAGE DeriveAnyClass #-}
module Data.Syntax.Type where

import Algorithm
import Data.Align.Generic
import Data.Functor.Classes.Eq.Generic
import Data.Functor.Classes.Ord.Generic
import Data.Functor.Classes.Show.Generic
import Data.Mergeable
import GHC.Generics

data Annotation a = Annotation { annotationSubject :: !a, annotationType :: !a }
  deriving (Diffable, Eq, Foldable, Functor, GAlign, Generic1, Mergeable, Ord, Show, Traversable)

instance Eq1 Annotation where liftEq = genericLiftEq
instance Ord1 Annotation where liftCompare = genericLiftCompare
instance Show1 Annotation where liftShowsPrec = genericLiftShowsPrec

data Alias a = Alias { aliasSubject :: !a, aliasType :: !a }
  deriving (Diffable, Eq, Foldable, Functor, GAlign, Generic1, Mergeable, Ord, Show, Traversable)

instance Eq1 Alias where liftEq = genericLiftEq
instance Ord1 Alias where liftCompare = genericLiftCompare
instance Show1 Alias where liftShowsPrec = genericLiftShowsPrec

data Function a = Function { functionParameters :: [a], functionReturn :: a }
  deriving (Diffable, Eq, Foldable, Functor, GAlign, Generic1, Mergeable, Ord, Show, Traversable)

instance Eq1 Function where liftEq = genericLiftEq
instance Ord1 Function where liftCompare = genericLiftCompare
instance Show1 Function where liftShowsPrec = genericLiftShowsPrec

newtype Product a = Product { productElements :: [a] }
  deriving (Diffable, Eq, Foldable, Functor, GAlign, Generic1, Mergeable, Ord, Show, Traversable)

instance Eq1 Product where liftEq = genericLiftEq
instance Ord1 Product where liftCompare = genericLiftCompare
instance Show1 Product where liftShowsPrec = genericLiftShowsPrec

data Array a = Array { arraySize :: Maybe a, arrayElementType :: a }
  deriving (Diffable, Eq, Foldable, Functor, GAlign, Generic1, Mergeable, Ord, Show, Traversable)

instance Eq1 Array where liftEq = genericLiftEq
instance Ord1 Array where liftCompare = genericLiftCompare
instance Show1 Array where liftShowsPrec = genericLiftShowsPrec

newtype BiDirectionalChannel a = BiDirectionalChannel { biDirectionalChannelElementType :: a }
  deriving (Diffable, Eq, Foldable, Functor, GAlign, Generic1, Mergeable, Ord, Show, Traversable)

instance Eq1 BiDirectionalChannel where liftEq = genericLiftEq
instance Ord1 BiDirectionalChannel where liftCompare = genericLiftCompare
instance Show1 BiDirectionalChannel where liftShowsPrec = genericLiftShowsPrec

newtype Interface a = Interface { interfaceElements :: [a] }
  deriving (Diffable, Eq, Foldable, Functor, GAlign, Generic1, Mergeable, Ord, Show, Traversable)

instance Eq1 Interface where liftEq = genericLiftEq
instance Ord1 Interface where liftCompare = genericLiftCompare
instance Show1 Interface where liftShowsPrec = genericLiftShowsPrec

data Map a = Map { mapKeyType :: a, mapElementType :: a }
  deriving (Diffable, Eq, Foldable, Functor, GAlign, Generic1, Mergeable, Ord, Show, Traversable)

instance Eq1 Map where liftEq = genericLiftEq
instance Ord1 Map where liftCompare = genericLiftCompare
instance Show1 Map where liftShowsPrec = genericLiftShowsPrec

newtype Parenthesized a = Parenthesized { parenthesizedType :: a }
  deriving (Diffable, Eq, Foldable, Functor, GAlign, Generic1, Mergeable, Ord, Show, Traversable)

instance Eq1 Parenthesized where liftEq = genericLiftEq
instance Ord1 Parenthesized where liftCompare = genericLiftCompare
instance Show1 Parenthesized where liftShowsPrec = genericLiftShowsPrec

newtype Pointer a = Pointer { pointerType :: a }
  deriving (Diffable, Eq, Foldable, Functor, GAlign, Generic1, Mergeable, Ord, Show, Traversable)

instance Eq1 Pointer where liftEq = genericLiftEq
instance Ord1 Pointer where liftCompare = genericLiftCompare
instance Show1 Pointer where liftShowsPrec = genericLiftShowsPrec

newtype ReceiveChannel a = ReceiveChannel { receiveChannelElementType :: a }
  deriving (Diffable, Eq, Foldable, Functor, GAlign, Generic1, Mergeable, Ord, Show, Traversable)

instance Eq1 ReceiveChannel where liftEq = genericLiftEq
instance Ord1 ReceiveChannel where liftCompare = genericLiftCompare
instance Show1 ReceiveChannel where liftShowsPrec = genericLiftShowsPrec

newtype SendChannel a = SendChannel { sendChannelElementType :: a }
  deriving (Diffable, Eq, Foldable, Functor, GAlign, Generic1, Mergeable, Ord, Show, Traversable)

instance Eq1 SendChannel where liftEq = genericLiftEq
instance Ord1 SendChannel where liftCompare = genericLiftCompare
instance Show1 SendChannel where liftShowsPrec = genericLiftShowsPrec

newtype Slice a = Slice { sliceElementType :: a }
  deriving (Diffable, Eq, Foldable, Functor, GAlign, Generic1, Mergeable, Ord, Show, Traversable)

instance Eq1 Slice where liftEq = genericLiftEq
instance Ord1 Slice where liftCompare = genericLiftCompare
instance Show1 Slice where liftShowsPrec = genericLiftShowsPrec

data TypeParameters a = TypeParameters { typeParameters :: ![a] }
  deriving (Diffable, Eq, Foldable, Functor, GAlign, Generic1, Mergeable, Ord, Show, Traversable)

instance Eq1 TypeParameters where liftEq = genericLiftEq
instance Ord1 TypeParameters where liftCompare = genericLiftCompare
instance Show1 TypeParameters where liftShowsPrec = genericLiftShowsPrec

data Readonly a = Readonly
  deriving (Diffable, Eq, Foldable, Functor, GAlign, Generic1, Mergeable, Ord, Show, Traversable)

instance Eq1 Readonly where liftEq = genericLiftEq
instance Ord1 Readonly where liftCompare = genericLiftCompare
instance Show1 Readonly where liftShowsPrec = genericLiftShowsPrec
