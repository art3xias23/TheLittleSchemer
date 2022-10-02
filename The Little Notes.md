# Lisp Laws
## The Law of Car
- The primitive car is defined
only for non-empty lists.
- Prints the first item from the list.

## The Law of Cdr
- The primitive cdr is defined only for
non-empty lists. The cdr of any nonempty
list is always another list.
- Prints the rest after the first element from the list

## The Law of Cons
- The primitive cons takes two arguments.
- The second argument to cons must be a
list. The result is a list.	
- Puts an item at the front of a list

## The Law of Null?
- The primitive null ? is defined
only for lists.
- Returns #t or #f if the list is empty

## The Law of Eq?
- The primitive eq? takes two arguments.
- Each must be a nonnumeric
atom.
- Returns #f ot #t if both items are equal or not)

# Lisp Commandments	
## The FIRST Commandment
- Always ask null? as the first question in expressing any function
	- When recurring on a list of atoms, lat, ask two questions about it
		- (null? lat)
		-  else
	- When recurring on a  number, ask two questions
		- (zero? n) 
		-  else	
	- When recorrung on a list of S-expressions, l, ask three questions about it:
		- (null? l)
		- (atom? (car l)) 
		- else

## The SECOND Commandment
- Use cons to build lists

## The THIRD Commandment
- When building a list, describe the first typical element, 
and then cons it onto the natural recursion.

## The FOURTH Commandment 
- Always change at least one argument while recurring. 
	- When recurring on a list of atoms, lat, use (cdr lat). 
	- When recurring on a number n, use (sub1 n). 
	- And when recuurring on a list of S-expressions, l, use (car l) and (cdr l) 
if neither (null? nor (atom? (car l)) are true.
	- It must be changed to be closer to termination.
	- The changing argument must be tested in the termination:
		- when using cdr, test termination with null?
		- when using sub1, test termination with zero?

## The FIFTH Commandment 
- When building a value with + 
	- always use 0 as a terminating condition as adding 0 
to an existing value does not change the outcome
- When building a value with cons
	- always use () as a terminating condition as adding ()
	 to a list does not change the value outcome
- When building a value with x
	- always use 1 as a terminating condition
	as multiplying by 1 does not change the outcome
## The Sixth Commandment
- Simplify only after the function is correct

## The Seventh Commandment
- Recur on the subparts that are of the same nature:
	- On the sublist of a list
	- On the subexpression of an arithmetic expression
## The Eight Commandment 
- Use help functions to hide representation

# TERMINOLOGY
### S-expression
- An S-expression is either an atom or a (possibly empty) list of S-expressions
### Arithmetic Expression
- Either an atom (including numbers) or two arithmetic expressions combined by +, -, ^ or x
