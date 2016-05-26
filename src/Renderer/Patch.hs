import Data.String
import Prologue hiding (snd)
import Data.List (span)
import Data.Text (pack)
patch :: Renderer
getRange splitDiff = case runFree splitDiff of
  (Free (Info range _ _ :< _)) -> range
  (Pure patch) -> range where (Info range _ _ :< _) = runCofree $ getSplitTerm patch
hunks diff blobs = hunksInRows (Both (1, 1)) $ fmap (fmap Prologue.fst) <$> splitDiffByLines (source <$> blobs) diff