import requests,os,wget
api = os.getenv('API')
key = os.getenv('API_KEY')
response = requests.get(api+'?action=save&key='+key)
file_list = response.text.split('<br>')[1:]
for i in file_list:
    wget.download('https://'+i[i.find(api.replace('https://','')[:api.replace('https://','').find('/')]):], out='source/_posts')
requests.get(api+'?action=del&key='+key)
