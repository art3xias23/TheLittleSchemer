(define rember*
  (lambda (a l)
    (cond
      ((null? lat) '())
      ((atom? (car lat))
       (cond
	 ((eq? (car lat) a)
	  (rember* a (cdr lat)))
	 (else
	   (cons (car l) (rember* a (cdr l))))))
      (else
	(cons (rember* a (car l)
		       (rember* a (cdr lat))))))))
a = cup
l = ((coffee) cup ((tea) cup) (and (hick)) cup)

(rember* a l)
(cons (rember* a (tea)) (rember* a (cup ((tea) cup) (and (hick)) cup)))
(cons (cons coffee '()) (rember* a (((tea) cup) (and (hick)) cup)))
(cons  coffee (cons (rember* a ((tea) cup) (rember* a ((and (hick)) cup)))))
(cons  coffee (cons (cons (rember* a (tea)) (rember* a cup)) (cons (rember* and (hick)) (rember* a cup))))
(cons coffee (cons tea (cons and (hick))


