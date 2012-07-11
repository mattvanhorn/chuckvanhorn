class CreatePostsTable < ActiveRecord::Migration
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
