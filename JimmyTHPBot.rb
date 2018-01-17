require 'twitter'
require 'pry'

# Lignes d'authentification du Bot avec les différentes ley et token 
client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "" #ici on doit normalement mettre les Keys et Tokens d'authentification, mais on été supprimés pour des raisons de sécurité avec githu
  config.consumer_secret     = "" #ici on doit normalement mettre les Keys et Tokens d'authentification, mais on été supprimés pour des raisons de sécurité avec githu
  config.access_token        = "" #ici on doit normalement mettre les Keys et Tokens d'authentification, mais on été supprimés pour des raisons de sécurité avec githu
  config.access_token_secret = "" #ici on doit normalement mettre les Keys et Tokens d'authentification, mais on été supprimés pour des raisons de sécurité avec githu
end
p client

#client.update("Hello, I'm a Bot and this is my first Tweet!") Première partie du code à rendre / Le bot qui twwet son premier tweet.


#Fonction pour Favorite (Liker) les recents tweet d'une liste de journaliste,
list_journalist = ["@LColcomb","@Zlauwereys","@MeLonguet","@DorotheeLN","@NolwennCosson","@ADaboval","@Remibaldy","@bderveaux","@amandechap","@ELODIESOULIE"] #Ici, j'ai préféré ne pas trop mettre de journalistes, 10 pour éviter les bans et autres

list_journalist.each do |x|		#On sait comment chercher les dernier Tweets d'un utilisateur, ainsi on va appliquer un each sur la liste pour chaque 
	tweet_id = client.user_timeline(x) #Fetch les tweet les plus recent (par IDs) d'un user en utilisant la methode user.timeline
	puts (tweet_id) #Affiche les IDs des tweets, afin de pouvoir vérifier si notre code s'execute bien dans le bash
	client.favorite(tweet_id) #Like les tweets qui ont le tweed_id avec la methode client.favorite.
end

#Petit code sympa, qui follow une liste de personne, ici quelque jorunalistes

list = ["LColcomb","Zlauwereys","MeLonguet","DorotheeLN","NolwennCosson","@ADaboval","Remibaldy","bderveaux","amandechap","ELODIESOULIE"]
list.each do |x|
	client.follow(x)
end

=begin
Ceci est un code qui ne marche pas 
Supposé Liker tout les tweet d'une liste prédéfinie 

#Ici on a utilisé le code donné par le gitbub proposé lors du cours : https://github.com/sferik/twitter/blob/master/examples/AllTweets.md
def collect_with_max_id(collection=[], max_id=nil, &block)
  response = yield(max_id)
  collection += response
  response.empty? ? collection.flatten : collect_with_max_id(collection, response.last.id - 1, &block)
end

def client.get_all_tweets(user)
  collect_with_max_id do |max_id|
    options = {count: 200, include_rts: true}
    options[:max_id] = max_id unless max_id.nil?
    user_timeline(user, options)
  end
end

#Comme le code s'applique à un user, on fait un array.each pour itérer sur toute une liste prédéfinie
list_journalist = ["LColcomb","Zlauwereys","MeLonguet","DorotheeLN","NolwennCosson","@ADaboval","Remibaldy","bderveaux","amandechap","ELODIESOULIE"]
	Twts = Array.new
	list_journalist.each do |x|
		Twts << client.get_all_tweets(x)
		puts Twts
end

client.favorite(Twts)
=end

#LAuthentification avec les Keys et les token pour les fonctions Streaming
client = Twitter::Streaming::Client.new do |config|
  config.consumer_key        = "" #ici on doit normalement mettre les Keys et Tokens d'authentification, mais on été supprimés pour des raisons de sécurité avec githu
  config.consumer_secret     = "" #ici on doit normalement mettre les Keys et Tokens d'authentification, mais on été supprimés pour des raisons de sécurité avec githu
  config.access_token        = "" #ici on doit normalement mettre les Keys et Tokens d'authentification, mais on été supprimés pour des raisons de sécurité avec githu
  config.access_token_secret = "" #ici on doit normalement mettre les Keys et Tokens d'authentification, mais on été supprimés pour des raisons de sécurité avec githu
end
