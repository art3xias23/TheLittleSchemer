(define equal?
  (lambda (s1 s2)
    (cond
      ((and (atom? (car l1)) (atom? (car l2)))
	 (equan? s1 s2))
      ((or (atom? s1) (atom? s2)) #f)
      (else (eqlist s1 s2)))))

(define eqlistEqual?
  (lambda (l1 l2)
    (cond
      ((and (null? l1) (null? l2)) #t)
      ((or (null? l1) (null? l2)) #f)
      (else 
	(and (equal? (car l1)) (equal? (car l2))
	     (and (eqlist? (cdr l1)) (eqlist? (cdr l2))))))))


