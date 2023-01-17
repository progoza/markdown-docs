# NUnit

NUnit is probably the most used testing framework in .NET. Although there are alternatives like xUnit (which is a newer, more modern implementation of testing framework - done by the same developers like NUnit). 
I am used to NUnit framework (these habbists come from old good times when I was in java world using jUnit) and not switch to xUnit as of now. 

Anyways, the impoerant attributes:

`[TestFixture]` - mark the class as the class containing tests. In most cases not needed any more (it is sufficient to have some methods with `[Test]` or `[TestCase]` attributes ). Still need to use it if we need to use parametrized Fixture (then the parameter will be applied in test constructor)

`[OneTimeSetup]` / `[SetUp]` Run before test (one time for all or before each test)

`[Test]` USe it for non-parametrized test

`[TestCase]` Use it for parametrized test:

```csharp
[TestCase(1, 1, 2)]
[TestCase(1, 2, 3)]
[TestCase(2, 3, 5)]
public void DivideTest(int n, int d, int q)
{
    Assert.That(n + d, Is.EqualTo(q));
}
```

`[TearDown]` / `[OneTimeTearDown]` Run after test (after all the tests or each test)

There is a lot of [other attributes](https://docs.nunit.org/articles/nunit/writing-tests/attributes.html) but those above are most frequently used 

### AAA 

3xA (Arrange, Act, Assert) - the patter to be appied for unit tests, separate the part of code for:

 - Arrange - setting up test data (e.g. using  [Bogus Faker](./bogus%20faker.md) and [Moq](moq.md))
 - Act - ie. running the test method
 - Assert - check the results (e.g. using [Fluent Assertions](fluent%20assertions.md))

## F.I.R.S.T.

The principle for actual unit test - [FIRST](../Engineering/first.md).

## Integration test

It is also ok to implement integration test (i.e. where instead of mocks we use actual implementation of depending services). But there should be not that much of such tests as they are usually slow and hard to maintain (not according to FIRST). 

