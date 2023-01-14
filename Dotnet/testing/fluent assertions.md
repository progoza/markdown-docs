# Fluent Assertions

Thanks to fluent assertions we can create much more readable code of unit tests. 
After instlling the Fluent Assertions nuget, it is enought to add:

```csharp
using FluentAssertions;
```

And we have access to the API. Following the official documentation example:

```csharp
string actual = "ABCDEFGHI";
actual.Should().StartWith("AB").And.EndWith("HI").And.Contain("EF").And.HaveLength(9);
```

The documentation is huge, there are a lot of possible usages: https://fluentassertions.com/introduction

## Most used and most handy features

### Basic assertions

```csharp
result.Should().BeOneOf(expected1, expected2);
result.Should().BeNull();
```

for strings:

```csharp
theString.Should().StartWith("This");
theString.Should().Contain("word");
emailAddress.Should().Match("*@*.com");
```

### Numeric types

Probably, most commonly used assertions

```csharp
result.Should().Be(5);
result.Should().BeGreaterThan(5);
result.Should().BeInRange(5, 10);
result.Should().Match(x => x % 2 == 0);
```

### Should().BeEquivalentTo()

We can check whether objects of similar classes are equivalent (e.g. Order can OrderDto) - so called object graph comparision.

```csharp
orderDto.Should().BeEquivalentTo(order);
```

### Collections

A lot of handy assertions

```csharp
collection.Should().Contain(3);
collection.Should().Contain(x => x > 3);
collection.Should().OnlyContain(x => x > 4);
collection.Should().HaveCountGreaterThan(3);
```

For Dictionaries

```csharp
dictionary.Should().ContainKey(1);
dictionary.Should().ContainValue("bbb");
dictionary.Should().Contain(new KeyValuePaid<int,string>(1,"bbb"));
dictionary.Should().Contain(1,"bbb");
```

### Validating exceptions

```csharp
Action act = () => testObj.DoSomething("abc");

act.Should().Throw<InvalidOperationException>()
	.WithMessage("Invalid *"); // * - any string, ? - any character
```

### Execution time

```csharp
Action someAction = () => Thread.Sleep(100);
someAction.ExecutionTime().Should().BeLessThanOrEqualTo(200.Milliseconds());
```

For Tasks

```csharp
Func<Task> someAsyncWork = () => SomethingReturningATask();
await someAsyncWork.Should().CompleteWithinAsync(100.Milliseconds());
```
