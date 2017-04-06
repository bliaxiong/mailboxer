class AddEncryptionToNotification < ActiveRecord::Migration
	def self.up
		rename_column :mailboxer_notifications, :body, :encrypted_body
		rename_column :mailboxer_notifications, :subject, :encrypted_subject
		add_column :mailboxer_notifications, :encrypted_body_iv, :string
		add_column :mailboxer_notifications, :encrypted_subject_iv, :string
	end

	def self.down
		remove_column :mailboxer_notifications, :encrypted_body_iv
		remove_column :mailboxer_notifications, :encrypted_subject_iv
		rename_column :mailboxer_notifications, :encrypted_body, :body
		rename_column :mailboxer_notifications, :encrypted_subject, :subject
	end
end
