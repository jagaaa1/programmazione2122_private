;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname shared) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

; verifica se un numero è presente in una lista
(define is-in?
	(lambda (n s)
		(cond
			((null? s) false)
			((= n (car s)) true)
			(else 
				(is-in? n (cdr s))
			)
		)
	)
)

; datre due liste ORDINATE restituisce una lista ORDINATA dei numeri in comune
(define shared
	(lambda (s1 s2)
		(cond
			((or (null? s1) (null? s2)) null)
			((is-in? (car s1) s2) (cons (car s1) (shared (cdr s1) s2)))
			(else (shared (cdr s1) s2))
		)
	)
)