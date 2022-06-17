;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname add-mul-pow) (read-case-sensitive #t) (teachpacks ((lib "drawings.ss" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "drawings.ss" "installed-teachpacks")) #f)))


(define succ
	(lambda (y x)
		(+ x 1)
	)
)

(define H
	(lambda (lett funz)
		(lambda (m n)
			(if (= n 0)
				(lett m)
				(funz m ((H lett funz) m (- n 1)))
			)	
		)
	)
)

(define add
	(H (lambda (x) x) succ)
)

(define mul
	(H (lambda (x) 0) add)
)

(define pow
	(H (lambda (x) 1) mul)
)