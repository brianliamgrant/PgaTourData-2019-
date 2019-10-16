#use get request method to obtain html from the url
import requests
pga = requests.get("http://www.espn.com/golf/statistics/_/year/2019")
pga

#check to see if status code = 200
pga.status_code

#import the BeautifulSoup library to parse through the HTML
from bs4 import BeautifulSoup
page = (pga.content, 'html.parser')

#re-format the HTML to see the content better
print(soup.prettify())

#earnings and player data contained in a table in the HTML file and parsed through to get the information in each row
trElements = soup.find_all('tr')
for i in trElements:
    print(i.get_text())
