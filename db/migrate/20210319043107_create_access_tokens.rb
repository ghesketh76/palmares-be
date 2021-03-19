class CreateAccessTokens < ActiveRecord::Migration[6.0]
  def change
    create_table :access_tokens do |t|
      t.references :user, null: false, foreign_key: true
      t.boolean :scope
      t.string :access_token
      t.timestamp :expires_at

      t.timestamps
    end
  end
end
