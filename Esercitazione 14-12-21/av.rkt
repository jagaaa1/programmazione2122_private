;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname av) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

(define av
	(lambda (s)
		(if (or (null? s) (null? (cdr s)))
			null
			(let
				(
					(y
						(cond
							((< (+ (car s) (cadr s)) 0) -1) ; x + x1
							((= (+ (car s) (cadr s)) 0) 0)
							((> (+ (car s) (cadr s)) 0) 1)
						)
					)
				)
				(cons y (av (cdr s)))	
			)		
		)
	)
)