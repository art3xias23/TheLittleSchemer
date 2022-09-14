(define no-nums
  (lambda (lat)
    (cond
      ((null? lat) '())
      ((number? (car lat)) (no-nums (cdr lat)))
	(else
	  (cons (car lat) (no-nums (cdr lat)))))))

(define all-nums
  (lambda (lat)
    (cond
      ((null? lat) '())
      (else
	(cond
	  ((number? (car lat)) (cons (car lat) (all-nums (cdr lat))))
	  (else
	    (all-nums (cdr lat))))))))

(define equan? 
  (lambda (a b)
    (cond
      ((and (number? a) (number? b)) (= a b))
      ((or (number? a) (number? b)) #f)
      (else
	(eq? a b)))))


			      
