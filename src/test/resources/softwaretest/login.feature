Feature: Saucedemo User Login

  Background:
    Given the home page is opened

  Scenario Outline: Incorrect login attempts
    Given the 'Username' field is filled with '<username>'
    And the 'Password' field is filled with '<password>'
    When the 'Login' button is clicked
    Then the '<errorMessage>' message is shown
    Examples:
      | username        | password       | errorMessage                                                              |
      |                 |                | Epic sadface: Username is required                                        |
      | standard_user   |                | Epic sadface: Password is required                                        |
      |                 | secret_sauce   | Epic sadface: Username is required                                        |
      | standard_user   | password       | Epic sadface: Username and password do not match any user in this service |
      | error_user      | password1      | Epic sadface: Username and password do not match any user in this service |
      | visual_user     | password2      |Epic sadface: Username and password do not match any user in this service |
      | problem_user    | password3      | Epic sadface: Username and password do not match any user in this service |
      |performance_glitch_user | password4 | Epic sadface: Username and password do not match any user in this service |
      | locked_out_user | secret_sauce   | Epic sadface: Sorry, this user has been locked out.                       |

  Scenario Outline: Correct login
    Given  the 'Username' field is filled with '<username>'
    And  the 'Password' field is filled with '<password>'
    Then the 'Login' button is clicked
    Examples:
      | username                       | password       |
      | standard_user                   | secret_sauce   |
      | error_user                    | secret_sauce   |
      | visual_user                    | secret_sauce   |
      | problem_user                   | secret_sauce   |
      | performance_glitch_user        | secret_sauce   |

  Scenario: user logs out
    Given the home page is opened
    And the 'Username' field is filled with 'standard_user'
    And the 'Password' field is filled with 'secret_sauce'
    And the 'Login' button is clicked
    When the 'Menu' button is clicked
    Then the 'Logout' button is clicked


  Scenario Outline: Switching users
    Given  the 'Username' field is filled with '<username>'
    And  the 'Password' field is filled with '<password>'
    And the 'Login' button is clicked
    When the 'Menu' button is clicked
    Then the 'Logout' button is clicked
    Examples:
      | username                       | password       |
      | standard_user                   | secret_sauce   |
      | error_user                    | secret_sauce   |
      | visual_user                    | secret_sauce   |
      | problem_user                   | secret_sauce   |
      | performance_glitch_user        | secret_sauce   |

