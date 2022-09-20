(define insertL*
  (lambda(new old l)
    (cond
      ((null? l) '())
      ((atom? (car l))
       (cond
	 ((eq? (car l) old) (cons new (cons (car l) (insertL* new old (cdr l)))))
	 (else
	   (cons (car l) (insertL* new old (cdr l))))))
      (else
	(cons (insertL* new old (car l)) (insertL* new old (cdr l)))))))

(define member* 
  (lambda (a l)
    (cond
      ((null? l) #f)
      ((atom? (car l)) (or (eq? (car l) a) (member* a (cdr l)))) 
      (else
	(or (member* a (car l)) (member* a (cdr l)))))))

(define leftmost
  (lambda (l)
    (cond
      ((null? l) '())
      ((atom? (car l)) (car l))
      (else
	(leftmost (car l))))))
(define eqlist?
  (lambda (l1 l2)
    (cond

((potato) (chips ((with) fish) (chips)))

