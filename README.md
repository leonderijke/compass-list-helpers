# Compass List Helpers

List Helpers is a Compass extension providing useful list helper functions
like: map, filter, reduce, every and some.

The List Helpers are based on JavaScript's Array.prototype functions, but of
course, adapted to Sass. Instead of passing in a function object in JS, in Sass
you'd just pass in a function name, that will be called for each item in the
list.

## Installation

Install List Helpers by:

```bash
$ gem install compass-list-helpers
```

Tell Compass you want to use List Helpers in your project's `config.rb`:

```ruby
require "list-helpers"
```

And import List Helpers into your stylesheet:

```scss
@import "list-helpers";
```

Not using Compass? Just copy and paste the contents of the `stylesheets` dir
into your project.

## Example usage

As always, simple (silly) examples explain the rationale the best. It all
starts with a list:

```scss
$my-awesome-colors: red, green, blue, yellow, blue, brown;
$my-awesome-numbers: 1, 2, 3, 4, 10, 20, 30;
```

Then, we would define some functions to test each item against:

```scss
// `is-blue` returns true if $item is blue, else it returns false.
@function is-blue($item) {
	@if $item == blue {
		@return true;
	}
	@return false;
}

// `add-numbers` adds two numbers, rocket science!
@function add-numbers($a, $b) {
	@return $a + $b;
}

// `double-up` doubles a number.
@function double-up($a) {
	@return $a * 2;
}

// `is-big-enough` returns true if $item is >= 10, else it returns false.
@function is-big-enough($item) {
	@if $item >= 10 {
		@return true;
	}
	@return false;
}
```

Now, if your using Sass 3.2 or lower, you need to define a `call` function. In
Sass 3.3 a native `call` function is built-in, so there's no need for this poor
man's solution:

```scss
// Note: only do this in Sass 3.2 or lower, in Sass 3.3 and higher there's no need for this.
@function call($function, $arguments...) {
	@if $function == 'is-blue' {
		@return is-blue($arguments...);
	}
	@if $function == 'add-numbers' {
		@return add-numbers($arguments...);
	}
	@if $function == 'double-up' {
		@return double-up($arguments...);
	}
	@if $function == 'is-big-enough' {
		@return is-big-enough($arguments...);
	}
}
```

Here comes the meat: now we can use the list helpers:

```scss
$the-blues: filter($my-awesome-colors, 'is-blue'); // Returns (blue, blue)
$big-is-better: filter($my-awesome-numbers, 'is-big-enough'); // Returns (10, 20, 30)
$all-blue: every($my-awesome-colors, 'is-blue'); // Returns false (not all items are blue)
$some-blue: some($my-awesome-colors, 'is-blue'); // Returns true (at least one item is blue)
$doubled: map($my-awesome-numbers, 'double-up'); // Returns (2, 4, 6, 8, 20, 40, 60)
$grand-total: reduce($my-awesome-numbers, 'add-numbers'); // Returns 70
```

## List Helpers Functions

List Helpers provides some useful functions:

### `every($list, $callback)`

Tests whether all items in the list pass the test implemented by the provided
callback function.

Every executes the provided callback function once for each item present in
the list until it finds one where callback returns false. If such an item is
found, the every method immediately returns false. Otherwise, if callback
returned a true value for all items, every will return true.

See the `every` [test cases](test/scss/tests/_every.scss) for more examples.

### `filter($list, $callback)`

Creates a new list with all items that pass the test implemented by the
provided function.

Filter calls a provided callback function once for each item in a list, and
constructs a new list of all the values for which callback returns true.

See the `filter` [test cases](test/scss/tests/_filter.scss) for more examples.

### `map($list, $callback)`

Creates a new list with the results of calling a provided function on every
item in this list.

Map calls a provided callback function once for each item in a list, in order,
and constructs a new list from the results.

See the `map` [test cases](test/scss/tests/_map.scss) for more examples.

### `reduce($list, $callback, $initial: 0)`

Apply a function against an accumulator and each item of the list (from
left-to-right) as to reduce it to a single value.

Reduce executes the callback function once for each item present in the list,
passing it the result up until then and the current item in the list.

The `$initial` argument is the value to use as the first argument to the first
call of the callback. For example, if you're adding up the $my-awesome-numbers
list of numbers from above, you can $initial to 10 in order to start adding at
10 (so it will return 80).  
In another example, if you're dealing with a list of lists you want to flatten,
passing in an empty list as `$initial` will make sure the callback is properly
called.  

See the `reduce` [test cases](test/scss/tests/_reduce.scss) for more examples.

### `some($list, $callback)`

Tests whether some item in the list passes the test implemented by the provided
callback function.

Some executes the callback function once for each item present in the list
until it finds one where callback returns a true value. If such an item is
found, some immediately returns true. Otherwise, some returns false.

See the `some` [test cases](test/scss/tests/_some.scss) for more examples.

## License

MIT License, see [LICENSE.txt](LICENSE.txt).