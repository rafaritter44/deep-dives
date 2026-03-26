# Expecto POC

## Filtering

### Example

```
dotnet run --filter "All tests.A test list.A test with"
```

### Result

```
[14:06:45 INF] EXPECTO? Running tests... <Expecto>
[14:06:45 INF] EXPECTO! 1 tests run in 00:00:00.0365456 for All tests.A test list.A test with many expectations – 1 passed, 0 ignored, 0 failed, 0 errored. Success! <Expecto>
```