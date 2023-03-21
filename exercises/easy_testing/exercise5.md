Write a minitest assertion that will fail if the `'xyz'` is not in the Array `list`.

```ruby
assert_includes list, 'xyz'
```

```ruby
assert_equal true, list.include?('xyz')
```

```ruby
assert list.include?('xyz'), 'list does not contain "xyz"'
```
