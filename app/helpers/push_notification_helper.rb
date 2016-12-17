require 'net/http'

module PushNotificationHelper

	def self.shouldSendNotification(task, previus_user_id)
		if previus_user_id.blank?
			return true
		else
			return task.user.id.to_s != previus_user_id.to_s
		end
	end

	def self.sendNotification(task)
		# Thread.new do
	 #  		puts "I'm in a thread!"
		# 	url = URI.parse('http://localhost:3000/api/plans')
		# 	http = Net::HTTP.new(url.host, url.port)
		# 	# http.use_ssl = true
		# 	request = Net::HTTP::Post.new(url.path, {'Content-Type' => 'application/json'})
		# 	request.body = self.dataFromTask(task)
		# 	response = http.request(request)
		# 	puts "RESPUESTAAAA"

		# 	case response
		# 		when Net::HTTPSuccess, Net::HTTPRedirection
	 #  				puts "EXITO"
		# 		else
	 #  				puts "FALLO"
		# 	end
		
		# end
	end

	private 

	def self.dataFromTask(task) 
		return task.to_json
	end
end