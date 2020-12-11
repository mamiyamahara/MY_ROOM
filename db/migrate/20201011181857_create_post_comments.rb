# frozen_string_literal: true

class CreatePostComments < ActiveRecord::Migration[5.2]
  def change
    create_table :post_comments do |t|
      t.integer :user_id,   foreign_key: true
      t.integer :post_id,   foreign_key: true
      t.text :comment,      null: false

      t.timestamps
    end
  end
end
