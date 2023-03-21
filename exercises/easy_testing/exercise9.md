Write a test that will fail if `list` and the return value of `list.process` are different objects.

```ruby
assert_same list.process, list
```

```ruby
assert_equal list.process.object_id, list.object_id
```
