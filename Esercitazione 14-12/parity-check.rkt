;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname parity-check) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

; restituisce il numero di 1 in una stringa
(define ones
	(lambda (str)
		(cond
			((string=? str "0") 0)
			((string=? str "1") 1)
			(else 
				(+ 
					(ones (substring str 0 1))
					(ones (substring str 1))
				)
			)
		)
	)
)

; data una lista di numeri restituisce una lista con la posizione dei numeri dispari
(define parity-rec
	(lambda (s pos)
		(cond
			((null? s) null)
			((odd? (car s)) (cons pos (parity-rec (cdr s) (+ pos 1))))
			(else (parity-rec (cdr s) (+ pos 1)))
		)
	)
)

; data una lista di parole binarie restituisce in una lista le posizioni di quelle che
; non superano il controllo di parità
(define parity-check-failures
	(lambda (s)
		(parity-rec (map ones s) 0)
	)
)