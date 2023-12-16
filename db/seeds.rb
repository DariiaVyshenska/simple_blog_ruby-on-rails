puts "Seeding"

print "  posts"

posts = [
  {
    title:     'Blog 1',
    body:      'Lorem ipsum dolor sit amet.',
    author:    'Kevin',
  },
  {
    title:     'Blog 2',
    body:      'Lorem ipsum dolor sit amet.',
    author:    'Chris',
  },
  {
    title:     'Blog 3',
    body:      'Lorem ipsum dolor sit amet.',
    author:    'Brad',
  }
]

time = DateTime.parse '2023-12-15'

posts.each do |post_hsh|
  Post.create post_hsh.merge(created_at: time, updated_at: time)
  time += 1.day
  print '.'
end

print "\n comments "

comment_authors = %w[Matz DHH tenderlove]

Post.all.each do |post|
  3.times do
    post.comments.create \
      body:      'Lorem ipsum dolor sit amet.',
      author:     comment_authors.sample,
      created_at: time,
      updated_at: time
    
    time += 1.day

    print '.'
  end
end

puts