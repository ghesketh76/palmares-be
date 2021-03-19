class CreateRefreshTokens < ActiveRecord::Migration[6.0]
  def change
    create_table :refresh_tokens do |t|
      t.references :user, null: false, foreign_key: true
      t.string :refresh_token
      t.boolean :scope

      t.timestamps
    end
  end
end
