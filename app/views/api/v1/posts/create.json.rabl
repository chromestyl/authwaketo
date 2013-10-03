object false
node (:success) { true }
node (:info) { 'Post created!' }
child :data do
  child @post do
    attributes :id, :title, :content, :created_at
  end
end