import requests
pga = requests.get("http://www.espn.com/golf/statistics/_/year/2019")
pga

pga.status_code

from bs4 import BeautifulSoup
page = (pga.content, 'html.parser')

print(soup.prettify())

trElements = soup.find_all('tr')
for i in trElements:
    print(i.get_text())
