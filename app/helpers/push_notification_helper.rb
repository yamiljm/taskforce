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

		host = "http://10.0.0.5:8080"
		path = "/v1/api/devices/send/" + task.user.registration_id
		url = URI.parse(host + path)
		http = Net::HTTP.new(url.host, url.port)
		request = Net::HTTP::Put.new(url.path, {'Content-Type' => 'application/json'})
		request.add_field("x-apikey", "6a474b1c-fb09-4b5f-891f-dbf4e5135e91")
		request.body = '{"message" : "'+ task.name + '", "title" : "Nueva tarea asignada" }'
		response = http.request(request)

		case response
			when Net::HTTPSuccess, Net::HTTPRedirection
  				puts "EXITO"
			else
  				puts "FALLO"
		end
	end
end