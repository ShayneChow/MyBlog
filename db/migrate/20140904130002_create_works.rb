class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.string :title
      t.string :desc
      t.text :content
      t.datetime :fromdate
      t.datetime :todate

      t.timestamps
    end
  end
end
