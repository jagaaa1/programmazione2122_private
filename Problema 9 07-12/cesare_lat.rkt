;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname cesare_lat) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

(define alfabeto
	"ABCDEFGHILMNOPQRSTVX"
)

(define position
	(lambda (lett str)
		(if	(equal? lett (string-ref str 0))
			0
			(+ 1 (position lett (substring str 1)))
		)
	)
)

(define encrypt
	(lambda (msg reg)
		(if (string=? msg "")
			""
			(string-append
				(string (reg (string-ref msg 0)))
				(encrypt (substring msg 1) reg)
			)
		)
	)
)

(define caesar
	(lambda (rot)
		(lambda (x)
			(string-ref
				alfabeto 
				(let ((i (+ rot (position x alfabeto))))
					(cond
						((> i (position #\X alfabeto)) (- i 20))
						((< i (position #\A alfabeto)) (+ i 20))
						(else i)
					)
				)
				
			)
		)
	)
)

(define decrypt
	(lambda (msg reg)
		(let ((rot (- (position #\A alfabeto) (position (reg #\A) alfabeto))))
			(encrypt msg (caesar rot))
		)
	)
)