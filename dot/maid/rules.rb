# Maid rules file
# See: https://github.com/benjaminoakes/maid

Maid.rules do

  rule 'Archive screenshots' do
    dir('~/Desktop/Screen Shot [0-9][0-9][0-9][0-9]-*').each do |path|
      if 10.minutes.since?(created_at(path))
        move(path, '~/Pictures/screenshots')
      end
    end
  end

  rule 'Archive old downloads' do
    files('~/Downloads/*').each do |path|
      if 7.days.since?(accessed_at(path))
        move(path, '~/Downloads/_outdated')
      end
    end
  end
end
