Feature: DemoBlaze signup and login API

  Background:
    * url 'https://api.demoblaze.com'
    * def UUID = Java.type('java.util.UUID')
    * def newUsername = function(){ return 'karate_' + UUID.randomUUID().toString() }
    * def password = 'KaratePass123!'

  Scenario: Create a new signup user
    * def username = newUsername()
    * def signupRequest = { username: '#(username)', password: '#(password)' }
    * print 'INPUT signup:', signupRequest
    Given path 'signup'
    And request signupRequest
    When method post
    Then status 200
    And match response.trim() == '""'
    * print 'OUTPUT signup:', response

  Scenario: Signup rejects an existing user
    * def username = newUsername()
    * def signupRequest = { username: '#(username)', password: '#(password)' }
    Given path 'signup'
    And request signupRequest
    When method post
    Then status 200
    And match response.trim() == '""'
    * print 'INPUT signup (existing user):', signupRequest
    Given path 'signup'
    And request signupRequest
    When method post
    Then status 200
    And match response == { errorMessage: 'This user already exist.' }
    * print 'OUTPUT signup (existing user):', response

  Scenario: Login with a valid user and password
    * def username = newUsername()
    * def signupRequest = { username: '#(username)', password: '#(password)' }
    Given path 'signup'
    And request signupRequest
    When method post
    Then status 200
    And match response.trim() == '""'
    * def loginRequest = { username: '#(username)', password: '#(password)' }
    * print 'INPUT login (valid credentials):', loginRequest
    Given path 'login'
    And request loginRequest
    When method post
    Then status 200
    And match response contains 'Auth_token: '
    And match response != ''
    * print 'OUTPUT login (valid credentials):', response

  Scenario: Login rejects incorrect credentials
    * def loginRequest = { username: '#(newUsername())', password: 'IncorrectPass123!' }
    * print 'INPUT login (incorrect credentials):', loginRequest
    Given path 'login'
    And request loginRequest
    When method post
    Then status 200
    And match response == { errorMessage: 'User does not exist.' }
    * print 'OUTPUT login (incorrect credentials):', response
