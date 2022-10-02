(define numbered? 
  (lambda (aexp)
    (cond
      ((atom? aexp) (number? aexp))
      ((eq? (car (cdr aexp)) '(+))
       (and (number? (car aexp) ) (number? (car (cdr (cdr aexp))))))
      ((eq? (car (cdr aexp)) '(x)
       (and (number? (car aexp) ) (number? (car (cdr (cdr aexp))))))
      ((eq? (car (cdr aexp)) '(^)
       (and (number? (car aexp) ) (number? (car (cdr (cdr aexp)))))) 
