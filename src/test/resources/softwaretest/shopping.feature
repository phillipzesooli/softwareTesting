Feature: Saucedemo Shopping

  Background:
    Given the home page is opened
    And the 'Username' field is filled with 'standard_user'
    And the 'Password' field is filled with 'secret_sauce'
    And the 'Login' button is clicked

  Scenario: Buying a onesie and jacket
    Given the 'Sauce Labs Onesie' is added to the cart
    And the 'Sauce Labs Fleece Jacket' is added to the cart
    And the 'Cart' button is clicked
    And the 'Checkout' button is clicked
    And the 'First Name' field is filled with 'firstName'
    And the 'Last Name' field is filled with 'lastName'
    And the 'Zip Code' field is filled with '4000'
    And the 'Continue' button is clicked
    And the subtotal reads 'Item total: $57.980000000000004'
    When the total price after tax reads 'Total: $62.62'
    Then the 'Finish' button is clicked

