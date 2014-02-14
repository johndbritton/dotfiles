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
end
