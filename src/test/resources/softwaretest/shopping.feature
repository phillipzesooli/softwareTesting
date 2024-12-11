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


  Scenario: Empty cart price
    Given the 'Cart' button is clicked
    And the 'Checkout' button is clicked
    And the 'First Name' field is filled with 'firstName'
    And the 'Last Name' field is filled with 'lastName'
    And the 'Zip Code' field is filled with '4000'
    And the 'Continue' button is clicked
    When the total price after tax reads 'Total: $0.00'
    Then the 'Finish' button is clicked

    Scenario: Navigating to all items
      Given the 'Sauce Labs Bike Light' is clicked
      When the 'Menu' button is clicked
      And the 'All items' button is clicked
      Then the 'https://www.saucedemo.com/inventory.html' page is opened

    Scenario: Finding the description of an item
      Given the 'Sauce Labs Backpack' is clicked
      Then the description of the product should read 'carry.allTheThings() with the sleek, streamlined Sly Pack that melds uncompromising style with unequaled laptop and tablet protection.'

  Scenario Outline: Getting the tax for different items
    Given the '<item>' is added to the cart
    And the 'Cart' button is clicked
    And the 'Checkout' button is clicked
    And the 'First Name' field is filled with 'firstName'
    And the 'Last Name' field is filled with 'lastName'
    And the 'Zip Code' field is filled with '4000'
    And the 'Continue' button is clicked
    When the tax is '<tax>'
    Then the 'Finish' button is clicked
    Examples:
      | item | tax |
      | Sauce Labs Backpack | Tax: $2.40 |
      | Sauce Labs Bike Light | Tax: $0.80 |
      | Sauce Labs Bolt T-Shirt| Tax: $1.28|
      | Sauce Labs Fleece Jacket | Tax: $4.00|
      | Sauce Labs Onesie | Tax: $0.64       |
      | Test.allTheThings() T-Shirt (Red) | Tax: $1.28|




