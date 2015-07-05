Feature: git rename-branch: renaming a feature branch with child branches

  As a developer renaming a feature branch that has child branches
  I want that the branch hierarchy information is updated to the new branch name
  So that my workspace is in a consistent and fully functional state after the rename.


  Background:
    Given I have a branch named "production"
    And my non-feature branches are configured as "production"
    And I have a feature branch named "child-feature" as a child of "production"
    And the following commits exist in my repository
      | BRANCH        | LOCATION         | MESSAGE              | FILE NAME          | FILE CONTENT          |
      | child-feature | local and remote | child feature commit | child_feature_file | child feature content |
      | production    | local and remote | production commit    | production_file    | production content    |
    And I am on the "production" branch
    When I run `git rename-branch production renamed-production -f`


  Scenario: result
    Then it runs the Git commands
      | BRANCH             | COMMAND                                       |
      | production         | git fetch --prune                             |
      |                    | git checkout -b renamed-production production |
      | renamed-production | git push -u origin renamed-production         |
      |                    | git push origin :production                   |
      |                    | git branch -D production                      |
    And I end up on the "renamed-production" branch
    And I have the following commits
      | BRANCH             | LOCATION         | MESSAGE              | FILE NAME          | FILE CONTENT          |
      | child-feature      | local and remote | child feature commit | child_feature_file | child feature content |
      | renamed-production | local and remote | production commit    | production_file    | production content    |
    And Git Town is now aware of this branch hierarchy
      | BRANCH             | PARENT             |
      | child-feature      | renamed-production |
      | renamed-production | main               |
