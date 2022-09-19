(define insertR*
  (lambda (new old l)
      (cond
	((null? l) '())
	((atom? (car l))
	 (cond
	   ((eq? (car l) old) (cons (car l) (cons new  (insertR* new old (cdr l)))))
	   (else
	     (cons (car l) (insertR* new old (cdr l))))))
	(else
	  (cons (insertR* new old (car l)) (insertR* new old (cdr l)))))))

(define occur*
  (lambda(a l)
    (cond
      ((null? l) 0)
      ((atom? (car l))
       (cond
	 ((eq? (car l) a) (add1 (occur* a (cdr l))))
	 (else
	   (occur* a (cdr l)))))
      (else
	(+ (occur* a (car l)) (occur* a (cdr l)))))))

(define subst* 
  (lambda (new old l)
    (cond
      ((null? l) '())
      ((atom? (car l))
       (cond
	 ((eq? (car l) old) (cons new (subst* new old (cdr l))))
	 (else
	   (cons (car l) (subst* new old (cdr l))))))
      (else
	(cons (subst* new old (car l)) (subst* new old (cdr l)))))))


'(("how much" '("wood")) "could" '('("a" '("wood") "chuck")) '('('("chuck"))) '("if" '("a") '('("wood chuck"))) "could chuck wood")

'('("banana") '("split" '('('('("banana ice"))) '("cream" '("banana")) "sherbet")) '("banana") '("bread") '("banana brandy"))
