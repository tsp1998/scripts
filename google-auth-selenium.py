import sys
import time
from selenium import webdriver;
from selenium.webdriver.firefox.options import Options

_, code, email, password = sys.argv 
delay = 5

url = 'https://www.google.com/device'
options = Options()
options.headless = True
if options.headless:
  driver = webdriver.Firefox(options=options)
else:
  driver = webdriver.Firefox()
try:
  driver.get(url)
  codeInput = driver.find_element_by_name("code")
  codeInput.send_keys(code)
  nextButton = driver.find_element_by_id("next")
  nextButton.click()
  time.sleep(delay)
  emailInput = driver.find_element_by_name("identifier")
  emailInput.send_keys(email)
  nextButton = driver.find_element_by_id("identifierNext")
  nextButton.click()
  time.sleep(delay)
  emailInput = driver.find_element_by_name("password")
  emailInput.send_keys(password)
  nextButton = driver.find_element_by_id("passwordNext")
  nextButton.click()
  time.sleep(delay)
  nextButton = driver.find_element_by_xpath('//button/span[text()="Continue"]')
  nextButton.click()
  time.sleep(delay)
  nextButton = driver.find_element_by_id("submit_approve_access")
  nextButton.click()
  time.sleep(delay)
except:
  print('Something went wrong')

driver.quit()