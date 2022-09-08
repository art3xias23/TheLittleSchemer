(define atom?
	(lambda(x)
		(and (not (pair? x)) (not (null? x)))))

(define lat?
	(lambda(x)
		(cond
			((null? x) #t)
			((atom? (car x)) (lat? (cdr x)))
			(else #f))))
			
(define member?
	(lambda(a lat)
		(cond
			((null? lat) #f)
			(else (or (eq? (car lat) a) 
				(member? a (cdr lat)))))))


(define rember?
  (lambda (a lat)
    (cond 
      ((null? lat) '())
      (else
        (cond 
                ((eq? a (car lat)) (cdr lat))
                (else (cons (car lat)  (rember? a (cdr lat)))))))))


(define firsts
  (lambda (lat)
    (cond
      ((null? lat) '())
      (else
        (cons (car (car lat)) (firsts(cdr lat)))))))
		
(define? insertR
         (lambda (new old lat)
           (cond
             ((null? lat) '())
           (else
             (cond
               ((eq? old (car lat)) (cons old (cons new (cdr lat))))
               (else
                 (cons (car lat) (insertRI new old (cdr lat)))))))))


(define insertL
  (lambda (new old lat)
    (cond
      ((null? lat) '())
      (else
	(cond
	  ((eq? (car lat) old) (cons new lat))
	  (else
	    (cons (car lat) (insertL new old (cdr lat)))))))))

(define subs
  (lambda (new old lat)
    (cond
      ((null? lat) '())
      (else
	(cond
	  ((eq? (car lat) old) (cons new (cdr lat)))
	  (else
	    (cons (car lat) (subs new old (cdr lat)))))))))
