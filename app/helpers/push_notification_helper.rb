module PushNotificationHelper

	def self.shouldSendNotification(task, previus_user_id)
		if previus_user_id.blank?
			return true
		else
			return task.user.id.to_s != previus_user_id.to_s
		end
	end

	def self.sendNotification(task)
		puts "ENVIANDO NOTIFICACION"
		puts task.to_yaml
	end
end