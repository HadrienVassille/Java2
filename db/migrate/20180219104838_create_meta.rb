class CreateMeta < ActiveRecord::Migration[5.1]
  def change
    create_table :meta do |t|
	t.string :name
	t.references :mettaable, polymorphic: true, index:true
    end
	
  end
end
