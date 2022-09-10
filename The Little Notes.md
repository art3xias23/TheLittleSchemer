The Law of Car
	The primitive car is defined
	only for non-empty lists.
	Prints the first item from the list.

The Law of Cdr
	The primitive cdr is defined only for
	non-empty lists. The cdr of any nonempty
	list is always another list.
	Prints the rest after the first element from the list

The Law of Cons
	The primitive cons takes two arguments.
	The second argument to cons must be a
	list. The result is a list.	
	Puts an item at the front of a list

The Law of Null?
	The primitive null ? is defined
	only for lists.
	Returns #t or #f if the list is empty

The Law of Eq?
	The primitive eq? takes two arguments.
	Each must be a nonnumeric
	atom.
	Returns #f ot #t if both items are equal or not)
	
The FIRST Commandment
	Always ask null? as the first question in expressing any function

The SECOND Commandment
	Use cons to build lists

The THIRD Commandment
	When building a list, describe the first typical element, 
	and then cons it onto the natural recursion.

The FOURTH Commandment 
	Always change at least one argument while recurring. 
	It must be changed to be closer to termination.
	The changing argument must be tested in the termination:
	when using cdr, change termination with null?

