require 'net/http'

module PushNotificationHelper

	def self.shouldSendNotification(agent)
		return agent == 'yes'
	end

	def self.sendNotification(task)

		Thread.new do
			puts "--- POR MANDAR NOTIFICACION ---"

			host = "http://catbag.herokuapp.com"
			path = "/v1/api/devices/send/" + task.user.registration_id
			url = URI.parse(host + path)
			http = Net::HTTP.new(url.host, url.port)
			request = Net::HTTP::Put.new(url.path, {'Content-Type' => 'application/json'})
			request.add_field("x-apikey", "6a474b1c-fb09-4b5f-891f-dbf4e5135e91")
			request.body = '{"message" : "'+ task.name + '", "title" : "Nueva tarea asignada" }'
			response = http.request(request)

			case response
				when Net::HTTPSuccess, Net::HTTPRedirection
	  				puts "--- Notificacion enviada ---"
				else
	  				puts "--- Notificacion enviada pero se recibió error---"
	  				puts "REQUEST: " 
					puts request.to_json
					puts "RESPONSE. CODE: " + response.code
					puts response.to_json
					puts response.body
			end
		end
	end
end

