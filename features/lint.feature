Feature: lint

  Scenario: multiple issues
    Given a file named "foo/multiple_issues.feature" with:
      """
       Feature: multiple issues

        Scenario: correctly indented

         Scenario: poorly indented
          Then nothing
      """
    When I run `greener`
    Then the output should contain:
      """
      F

      foo/multiple_issues.feature:1
       Feature: multiple issues
       ^^^ inconsistent indentation detected

      foo/multiple_issues.feature:5
         Scenario: poorly indented
         ^^^ inconsistent indentation detected

      1 file(s) inspected, 2 offense(s) detected\n
      """
