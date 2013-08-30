require 'launchy'

desc 'deploy'
task :deploy do
  sh 'git rebase master deploy'
  Rake::Task['generate'].invoke
  sh 'rsync -avz _site/ sakura:www/railsdoc'
  sh 'git checkout master'
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
  Thread.new do
    sleep 1
    Launchy.open 'http://localhost:4000/'
  end

  sh 'ghc --make site.hs && ./site preview'
end

desc 'compass'
task :compass do
  sh 'compass watch'
end
