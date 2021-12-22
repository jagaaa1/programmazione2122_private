;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname r-val) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

(define val
	(lambda (x)
		(if (char=? x #\0)
			0
			1
		)
	)
)

; parte frazionaria base2 --> base10 : risulato = risultato / 2 + nuova cifra
; si parte dall'ultima cifra a destra
(define r-val
	(lambda (num)
		(cond
			((char=? #\. (string-ref num 0)) (r-val (substring num 1)))
			((= (string-length num) 0) 0)
			((= (string-length num) 1) (exact->inexact (/ (val (string-ref num 0)) 2)))
			(else
				(exact->inexact
					(/ (+ 
						(val (string-ref num 0)) 
						(r-val (substring num 1))
					) 2)
				)				
			)
		)
	)
)