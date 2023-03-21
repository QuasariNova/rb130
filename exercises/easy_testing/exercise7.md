Write a minitest assertion that will fail if `value` is not an instance of the `Numeric` class exactly. value may not be an instance of one of `Numeric`'s superclasses.

```ruby
assert_instance_of Numeric, value
```

```ruby
assert_equal Numeric, value.class
```

```ruby
assert value.instance_of?(Numeric), 'value is not an instance of Numeric'
```
