object false
node (:success) { true }
node (:info) { 'ok' }
child :data do
  node (:posts_count) { @posts.size }
  child @posts do
    attributes :id, :title, :content, :created_at
  end
end
