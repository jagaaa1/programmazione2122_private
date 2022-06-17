;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname pattern) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

; restituisci una stringa con lunghezza len in cui si ripete un pattern eventualmente troncato
(define cycling-string
	(lambda (pattern len)
		(cond
			((= len 0) "")
			(
				(< (string-length pattern) len)
				(cycling-string (string-append pattern pattern) len)
			)
			(else
				(substring pattern 0 len)
			)
		)
	)
)