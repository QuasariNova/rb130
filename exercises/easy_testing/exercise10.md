Write a test that will fail if `'xyz'` is one of the elements in the Array `list`:

```ruby
refute_includes list, 'xyz'
```

```ruby
assert_equal false, list.include?('xyz')
```

```ruby
refute_equal true, list.include?('xyz')
```
