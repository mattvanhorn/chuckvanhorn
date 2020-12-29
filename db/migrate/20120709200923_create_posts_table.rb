class CreatePostsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string    :title
      t.datetime  :published_at
      t.text      :body
      t.integer   :painting_id
      t.timestamps
    end
  end
end
