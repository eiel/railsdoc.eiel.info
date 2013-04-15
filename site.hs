--------------------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}
import           Data.Monoid (mappend)
import           Hakyll
import           System.Environment (withArgs)
import           System.Cmd (system)
import           System.FilePath
--------------------------------------------------------------------------------
main :: IO ()
main = hakyll $ do

    match "images/*" $ do
      route   idRoute
      compile copyFileCompiler

    match "stylesheets/*.css" $ do
      route   idRoute
      compile compressCssCompiler

    -- Google Webmaster Tools
    match "google*.html" $ do
      route idRoute
      compile copyFileCompiler

    match "**/*.md" $ do
        let addIndex x = replaceBaseName x $ (takeBaseName x) ++ "/index"
        route   $ customRoute $
            addIndex . (`replaceExtension` "html") . toFilePath
        compile $ pandocCompiler
            >>= loadAndApplyTemplate "templates/default.html" defaultContext
            >>= relativizeUrls

    match "index.md" $ do
        route $ setExtension "html"
        compile $ pandocCompiler
            >>= loadAndApplyTemplate "templates/default.html" defaultContext
            >>= relativizeUrls

    match "templates/*" $ compile templateCompiler
