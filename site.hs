--------------------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}
import           Data.Monoid (mappend)
import           Hakyll
import           System.Environment (withArgs)
import           System.Cmd (system)
import           System.FilePath
import           Hakyll.Core.Compiler
import           Text.Pandoc
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
            writerOptions = defaultHakyllWriterOptions {
              writerTableOfContents = True,
              writerTemplate = "<h2>目次</h2>\n$toc$\n$body$",
              writerStandalone = True
              }
        route   $ customRoute $
            addIndex . (`replaceExtension` "html") . toFilePath
        compile $ pandocCompilerWith defaultHakyllReaderOptions writerOptions
            >>= loadAndApplyTemplate "templates/default.html" defaultContext
            >>= relativizeUrls

    match "index.md" $ do
        route $ setExtension "html"
        compile $ pandocCompiler
            >>= loadAndApplyTemplate "templates/default.html" defaultContext
            >>= relativizeUrls

    match "templates/*" $ compile templateCompiler
