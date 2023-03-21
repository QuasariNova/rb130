Write a minitest assertion that will fail if the class of `value` is not `Numeric` or one of `Numeric`'s subclasses (e.g., `Integer`, `Float`, etc).

```ruby
assert_kind_of Numeric, value
```

```ruby
assert value.kind_of?(Numeric), 'value is not a kind of Numeric'
```
