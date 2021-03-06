Feature: Displaying the current offline status

  When configuring offline mode
  I want to know the current value for it
  So that I can decide whether I want to adjust it.


  Scenario: set to "true"
    Given Git Town is in offline mode
    When I run `git-town offline`
    Then I see
      """
      true
      """


  Scenario: set to "false"
    Given Git Town is not in offline mode
    When I run `git-town offline`
    Then I see
      """
      false
      """
