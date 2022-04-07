require "uri"
require "net/http"
require "json"

def request(url)
    url = URI(url)

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)

    response = https.request(request)
    results = JSON.parse(response.read_body)
end

data = request("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=e2XZ7TPwxsLJZbfSCHVXpkxOGbwcXIG6cjZx71Oz")

#recorremos el array de datos
data["photos"].map do |photo|
    #imprimimos el titulo de la foto
    puts photo["img_src"]
end

#Crear un método llamado buid_web_page que reciba el hash de respuesta con todoslos datos y construya una página web. 
 
html = ""
    html += "<html>\n"
    html += "<head>\n"
    html += "<title>Fotos Curiosity</title>\n"
    html += "</head>\n"    
    html += "<body>\n"
    html += "<h1>Fotos Curiosity</h1>\n"
    html += "<ul>\n"
    html += "<li><img src='#{data["photos"][0]["img_src"]}'></li>\n"
    html += "<li><img src='#{data["photos"][1]["img_src"]}'></li>\n"
    html += "<li><img src='#{data["photos"][2]["img_src"]}'></li>\n"
    html += "<li><img src='#{data["photos"][3]["img_src"]}'></li>\n"
    html += "<li><img src='#{data["photos"][4]["img_src"]}'></li>\n"
    html += "<li><img src='#{data["photos"][5]["img_src"]}'></li>\n"
    html += "<li><img src='#{data["photos"][6]["img_src"]}'></li>\n"
    html += "<li><img src='#{data["photos"][7]["img_src"]}'></li>\n"
    html += "<li><img src='#{data["photos"][8]["img_src"]}'></li>\n"
    html += "<li><img src='#{data["photos"][9]["img_src"]}'></li>\n"
    html += "</ul>\n"
    html += "</body>\n"
    html += "</html>\n"
    data["photos"].map do |photo|
end

File.write('prueba.html', html)

