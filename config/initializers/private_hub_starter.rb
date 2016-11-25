Thread.new do
  system("bundle exec rackup private_pub.ru -s thin -E production")
end