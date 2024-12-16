Feature: Saucedemo Shopping

  Background:
    Given the home page is opened
    And the 'Username' field is filled with 'problem_user'
    And the 'Password' field is filled with 'secret_sauce'
    And the 'Login' button is clicked


  Scenario: Trying to buy a bike light
    Given the 'Sauce Labs Bike Light' is added to the cart
    And the 'Cart' button is clicked
    And the 'Checkout' button is clicked
    And the 'First Name' field is filled with 'first_test'
    And the 'Last Name' field is filled with 'last_test'
    And the 'Zip Code' field is filled with '4001'
    When the 'Continue' button is clicked
    Then the error message should read 'Error: Last Name is required'
    And the page is reset

  Scenario: Navigating to the About page
    Given the 'Menu' button is clicked
    And the 'About' button is clicked
    When the 'https://saucelabs.com/error/404' page is opened
    Then the about page error message should read '404 Not Found'


