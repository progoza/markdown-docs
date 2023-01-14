# Moq

1. Arrange 
 
Create mock 

```csharp
var engineMock = new Mock<IEngine>();
```

Setup

```csharp
engineMock.Setup(e => e.IsOilOk()).Returns(false);
engineMock.Setup(e => e.GetRevsPerMin()).Returns(5000);
```

Or do both at once, the "functional" way:

```csharp
var engineMock = Mock.Of<IEngine>(l =>
			l.IsOilOk() == false &&
			l.GetRevsPerMin() == 5000;
);
```

2. Act 

Get the instance of object to use them with testObj:

```csharp
var engine = engineMock.Object;
```

3. Assert

Verify interactions with mock:

```csharp
engineMock.Verify(x => x.IsOilOk(), Times.AtLeastOnce());
```

## Argument matching

For arranging mocks and/or asserting we can use argument matching:

```csharp
var engineMock = Mock.Of<IEngine>(l =>
			l.CoolerFanRpm(It.IsAny<int>())) == 1500
);
```

Other matchers:

```csharp
It.Is<int>(x => x % 2 == 0)
It.IsInRange<int>(0, 10, Range.Inclusive)
It.IsRegex("\[a-d\]+")
```

## Mocking classes vs interfaces

If we decide to mock classes instead of interfaces.. restrictions:

- static classes can be mocked
- static methods can be mocked
- mocked method must be virtual

...mocking interfaces is better idea anyhow.
