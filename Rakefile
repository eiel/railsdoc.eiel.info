desc 'deploy'
task :deploy do
   Rake::Task['generate'].invoke
  sh 'rsync -avz _site/ sakura:www/railsdoc'
end

desc 'generate site'
task :generate do
  sh 'ghc --make site.hs && compass compile && ./site build'
end

desc "clean"
task :clean do
  sh 'rm -rf _site'
  sh 'rm -rf _cache'
end

desc 'preview'
task :preview do
  sh 'ghc --make site.hs && ./site preview'
end

desc 'compass'
task :compass do
  sh 'compass watch'
end
