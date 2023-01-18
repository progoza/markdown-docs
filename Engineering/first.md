# F.I.R.S.T.

## Fast

Time of test execution should not discourage from runnig them.

## Independent

One test should not influence the result of another test (ie. sequence of runnign the test should not matter, each test can be run separately, when needed).

## Repeatable

There should be no random factor in the test results - test fail shall not be result of some random event. 

## Self-validating

Test should unambiguously and automatically provide the result - whether it passed or not. No manual evaluations should be practiced. 

## Timely

Test should be written at the time of writing the production code (in case of TDD - just before, or - if TDD is not appied - right after production code part). Deffering of writing the tests to "after production code is ready" should not be practiced.  
