#!/usr/bin/env ruby

#stephane adam garnier - 2012  / littleBrother

require 'fb_graph' # to use the facebook graph API
require 'googleajax' # to use googleajax rest API
#for proper syntax highlights
#require 'smart_colored/extend'
#require 'smart_colored'
require 'smart_colored/extend'
# without extend you'll need to use 'string'.colored.red

# -- APP CONFIG SETUP --
def setup_app_config()
	#fb_graph part
	#googleajax part
		GoogleAjax.referrer = "littleBrotherApp"
	#twitter part
	
	#init done
	init_done()
end

def init_done()
	puts ""
	puts ""
	puts "App successfully initiated & started".white.on_black
	
	sleep(2)
	action_request()
end

def initApp()
	puts ""
	puts ""
	puts "Little Brother App".white.on_black
	puts "v1a by StephaneAG".black.on_white
	puts ""
	print "a simple utility app to test / debug / output various results from facebook / twitter / google & other webservices APIs, thanks to all these powerfull ruby gems hanging all around us ...".black.on_white
	puts ""
	print "..feel free to contribute, help or ask , seedsodesign@gmail.com , stephaneadamgarnier.com".black.on_white
	
	setup_app_config()
	
end

def other_action_request()
	puts "Do you want to fetch something else ?"
	
	fetch_action = gets.chomp
	puts ""
	puts "You choose to #{fetch_action.white.on_white} !".white.on_cyan
	
	if fetch_action == "fetch_facebook"
		fetch_facebook()
	elsif fetch_action == "fetch_google"
		fetch_google()
	elsif fetch_action == "fetch_weed"
		puts "Sorry, not (yet?) available".white.on_cyan
	else
		puts "Ok, by!".white.on_black
	end
	
end
# end of other_action_request > end of program ()

def action_request()
		sleep(1)
		puts ""
		puts "                                    ".white.underline
		puts ""
		puts "what do you wanna fetch today ? "
		puts ""
		puts "                                    ".white.underline
		puts ""
		puts "> fetch_facebook"
		puts "> fetch_twitter"
		puts "> fetch_google"
		puts "> build_html"
		puts ""
		puts "                                    ".white.underline
		puts ""
		
		fetch_action = gets.chomp
		puts ""
		puts "You choose to #{fetch_action.white.on_white} !".white.on_cyan
	
		if fetch_action == "fetch_facebook"
			fetch_facebook()
		elsif fetch_action == "fetch_google"
			fetch_google()
		elsif fetch_action == "build_html"
			build_html()
		elsif fetch_action == "some sleep"
			puts "Ok, by!".white.on_black
		else
			puts ""
			other_action_request()
		end
	
end
# end of action_request > end of program ()

# -- FETCH FACEBOOK --
def fetch_facebook()
	puts ""
	puts ""
	puts "Please type the Facebook user ID or username below to retrieve the infos data".white.on_black
	puts ""
	fb_target_user = gets.chomp
	puts ""
	puts "Target user : #{fb_target_user.white.on_white}".white.on_cyan
	puts ""
	fetch_facebook_user("#{fb_target_user}")
end

def fetch_facebook_user(userNameOrID)
	
	puts "Data retrieved from the facebook servers:".white.on_black
	puts ""
	puts "                                    ".white.underline
	puts ""
	
	# -- USER INFOS FROM FB GRAPH GEM --
	user = FbGraph::User.fetch(userNameOrID)

	puts ''
	puts ''

	puts 'USER INFORMATIONS:'.white.on_cyan
	puts ''

	puts 'PICTURE:'.white.on_cyan
	puts user.picture.white.on_white

	puts 'PROFILE LINK:'.white.on_cyan
	
	unless user.link.nil? || user.link == 0
		puts user.link.white.on_white
	end
	
	if user.link.nil?
		puts 'N / A'.white.on_white
	end
	
	puts 'USERNAME:'.white.on_cyan
	puts user.username.white.on_white

	puts 'FULLNAME:'.white.on_cyan
	puts user.name.white.on_white

	puts 'FIRST NAME:'.white.on_cyan
	puts user.first_name.white.on_white

	puts 'LAST NAME:'.white.on_cyan
	puts user.last_name.white.on_white

	puts 'ID:'.white.on_cyan
	puts user.identifier.white.on_white

	puts 'GENDER:'.white.on_cyan
	puts user.gender.white.on_white

	puts 'LOCALE:'.white.on_cyan
	puts user.locale.white.on_white
	
	puts ""
	other_action_request()
	
	
end

# -- FETCH GOOGLE --
def fetch_google()
	puts ""
	puts ""
	puts "Please type here your search".white.on_black
	puts ""
	google_target_search = gets.chomp
	puts ""
	puts "Target search : #{google_target_search.white.on_white}".white.on_cyan
	puts ""
	google_web_search("#{google_target_search}")
end

def google_web_search(search_target)

	search_results_web = GoogleAjax::Search.web(search_target)
	search_results_blogs = GoogleAjax::Search.blogs(search_target)
	search_results_books = GoogleAjax::Search.books(search_target)
	search_results_images = GoogleAjax::Search.images(search_target)
	search_results_news = GoogleAjax::Search.news(search_target)
	search_results_videos = GoogleAjax::Search.video(search_target)
	
	search_results_feed = GoogleAjax::Feed.find(search_target)
	
	puts "Data retrieved from the google servers:".white.on_black
	puts ""
	puts "                                    ".white.underline
	puts ""

	print 'WEB SEARCH RESULTS FOR :'.white.on_cyan
	print search_target.white.on_white
	puts ""
	puts search_results_web
	puts ""
	puts "                                    ".white.underline
	puts ""
	
	print 'BLOGS SEARCH RESULTS FOR :'.white.on_cyan
	print search_target.white.on_white
	puts ""
	puts search_results_blogs
	puts ""
	puts "                                    ".white.underline
	puts ""
	
	print 'BOOKS SEARCH RESULTS FOR :'.white.on_cyan
	print search_target.white.on_white
	puts ""
	puts search_results_books
	puts ""
	puts "                                    ".white.underline
	puts ""
	
	print 'IMAGES SEARCH RESULTS FOR :'.white.on_cyan
	print search_target.white.on_white
	puts ""
	puts search_results_images
	puts ""
	puts "                                    ".white.underline
	puts ""
	
	print 'NEWS SEARCH RESULTS FOR :'.white.on_cyan
	print search_target.white.on_white
	puts ""
	puts search_results_news
	puts ""
	puts "                                    ".white.underline
	puts ""
	
	print 'VIDEOS SEARCH RESULTS FOR :'.white.on_cyan
	print search_target.white.on_white
	puts ""
	puts search_results_videos
	puts ""
	puts "                                    ".white.underline
	puts ""
	
	print 'FEED SEARCH RESULTS FOR :'.white.on_cyan
	print search_target.white.on_white
	puts ""
	puts search_results_feed
	puts ""
	puts "                                    ".white.underline
	puts ""
	
	
	puts ""
	other_action_request()
end

# -- BUILD_HTML --

def build_html()
	puts ""
	puts "Build html process initiated:".white.on_black
	puts "Please choose a name for the output file".white.on_black
	puts ""
	
	html_file_name = gets.chomp
	puts ""
	puts "HTML file name set to : #{html_file_name.white.on_white}".white.on_cyan
	puts ""
	
	puts ""
	puts "                                    ".white.underline
	puts ""
	#-- html dynamic parts --
	puts "Please type the html page title you want to set".white.on_black
	page_title = gets.chomp
	var_page_title = "#{page_title}"
	puts ""
	puts "HTML page title set to : #{page_title.white.on_white}".white.on_cyan
	puts ""
	
	puts "Please type in the page header".white.on_black
	page_h1 = gets.chomp
	var_page_h1 = "#{page_h1}"
	puts ""
	puts "The page header is now set to : #{page_h1.white.on_white}".white.on_cyan
	puts ""
	
	puts "Please type in a little paragraph".white.on_black
	page_p = gets.chomp
	var_page_p = "#{page_p}"
	puts ""
	puts "The page header is now set to : #{page_p.white.on_white}".white.on_cyan
	puts ""
	#-- end html dynamic parts --
	puts ""
	puts "                                    ".white.underline
	puts ""
	
	
	puts ""
	puts "now building html file".white.on_cyan
	
	workingDir = Dir.pwd
	Dir.chdir(workingDir)
	#Dir.chdir("./rubydev/")
	# -- debug --
	puts ""
	puts "current directory before changing dir"
	puts Dir.pwd
	
	curDir = Dir.pwd
	
	Dir.chdir("../rubyrailsdev")
	puts "after changing dir"
	puts "Dir.pwd is now :"
	puts Dir.pwd
	puts "still, curDir stays:"
	puts curDir
	
	puts "after re changing dir"
	Dir.chdir(curDir)
	puts Dir.pwd
	
		puts "list files in dir, 1st manner"
			puts Dir.entries(curDir).join(' ')
		puts ""
		
		puts "list files in dir, 2nd manner"
			Dir.foreach(curDir) do |entry|
   				puts entry
			end
		puts ""
			
		puts "list files in dir, 3rd manner"
			puts Dir["/Users/stephaneadamgarnier/rubydev/*"]
		puts ""
	# -- end debug --
	
	File.open("#{html_file_name}", "w") do |htmlFile|
	#htmlFile = File.new("#{html_file_name}", "w+")
		
		# -- hthml header --
			
			
			htmlFile.syswrite '<!DOCTYPE html>'
			htmlFile.syswrite '<html lang="en">'
				htmlFile.syswrite '<head>'
					htmlFile.syswrite '<meta charset="utf-8">'
					htmlFile.syswrite '<title>'+ var_page_title +'</title>'
					htmlFile.syswrite '<link href="./html_assets/css/bootstrap.css" rel="stylesheet">'
					htmlFile.syswrite '<link href="./html_assets/css/bootstrap-responsive.css" rel="stylesheet">'
				htmlFile.syswrite '</head>'
		
		# -- html body --
		
				htmlFile.syswrite '<body>'
					htmlFile.syswrite '<div class="container">'
						
						htmlFile.syswrite '<h1>'+ var_page_h1 +'</h1>'
						htmlFile.syswrite '<p>'+ var_page_p +'</p>'
						htmlFile.syswrite '<h3> powered by sag ! </h3>'
						
					htmlFile.syswrite '</div> <!-- /container -->'
		
		# -- scripts & html footer --
			
					htmlFile.syswrite '<script src="./html_assets/js/jquery.js"></script>'
				htmlFile.syswrite '</body>'
			htmlFile.syswrite '</html>'
		
	end
	#htmlFile.close	
	
	puts ""
	puts "html file built!".white.on_cyan
	
	puts ""
	other_action_request()
	
	
end

# ----- APP INIT -----
initApp()
