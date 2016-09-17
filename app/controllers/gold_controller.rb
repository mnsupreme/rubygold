class GoldController < ApplicationController

	def index
		if !session[:total]
			session[:total] = 0
		end

		if !session[:results]
			session[:results] = []
		end

	end

	def farm
		amount = Random.rand(11) + 10
		session[:total] += amount
		session[:results]<<{:text => "Earned " + amount.to_s + " from the farm!", :date =>  Time.now.localtime.strftime("(%m/%d/%Y %I:%M%p)"), :color => "green"}
		redirect_to '/'
	end

	def cave
		amount = Random.rand(6) + 5
		session[:total] += amount
		session[:results]<<{:text => "Earned " + amount.to_s + " from the cave!", :date =>  Time.now.localtime.strftime("(%m/%d/%Y %I:%M%p)"), :color => "green"}
		redirect_to '/'
	end

	def house
		amount = Random.rand(4) + 2
		session[:total] += amount
		session[:results]<<{:text => "Earned " + amount.to_s + " from the house!", :date =>  Time.now.localtime.strftime("(%m/%d/%Y %I:%M%p)"), :color=> "green"}
		redirect_to '/'
	end

	def casino
		amount = Random.rand(-50..50)
		if amount > 0
			session[:total] += amount
			session[:results]<<{:text => "Went to a casino and earned " + amount.to_s, :date =>  Time.now.localtime.strftime("(%m/%d/%Y %I:%M%p)"), :color => "green"}
		else
			session[:total] += amount
			session[:results]<<{:text => "Went to a casino and lost " + amount.to_s + " ...Ouch", :date =>  Time.now.localtime.strftime("(%m/%d/%Y %I:%M%p)"), :color => "red"}
		end
		redirect_to '/'
	end

end
