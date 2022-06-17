;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname basi) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

; restituisce parte intera di un numero togliendo eventuale segno
(define parte_intera
    (lambda (str)
        (if (string=? (substring str (- (string-length str) 1))".")
            (if (or (string=? (substring str 0 1) "+") (string=? (substring str 0 1) "-"))
                (substring str 1 (- (string-length str) 1))
                (substring str 0 (- (string-length str) 1))
            )
            (parte_intera (substring str 0 (- (string-length str) 1) ))
        )
    )
)

; restituisce parte dopo la virgola di un numero
(define parte_fraz
    (lambda (str)
        (if (string=? (substring str 0 1)".")
            (substring str 1)
            (parte_fraz (substring str 1))
        )  
    )
)

; conversione numero intero da bin a dec ---------------

(define val
	(lambda (str)
		(if (string=? str "0") 
            0
            1
        )
	)
)

(define bin-dec
    (lambda (str)
        (let ((k (- (string-length str) 1)))
            (if (= k 0)
                (val str)
                (+ 
                    (* 2 (bin-dec (substring str 0 k)))
                    (val (substring str k))
                )
            )
        )
    )
)

; -------------------------------------------------------------
(define contiene?
	(lambda (str ch)
		(cond
			((string=? str "") false)
			((string=? ch (substring str 0 1)) true)
			(else (contiene? (substring str 1) ch))
		)
	)
)


; converte in base 10 il numero str (con eventuale segno +- e/o virgola .) da base 2
(define bin-rep->number
    (lambda (str)
        (if (contiene? str ".")
            ; per convertire un numero bin con virgola si può anche convertire il numero ottenuto ignorando la virgola 
            ; e dividendolo successivamente per una potenza di 2 con all'esponente il numero di cifre dopo la virgola 
            ; es. 10.1 bin = 2.5 dec --> 10.1 bin = 101 bin / 2^1 = 5/2 = 2.5 dec
            (cond ; (exact->inexact) trasforma una frazione in numero con virgola es. 5/2 -> 2.5
                ((string=? (substring str 0 1) "+")
                    (exact->inexact
                        (/
                            (bin-dec (string-append (parte_intera str) (parte_fraz str)))
                            (expt 2 (string-length (parte_fraz str)))
                        )
                    
                    )
                )
                ((string=? (substring str 0 1) "-")
                    (exact->inexact
                        (* (/
                                (bin-dec (string-append (parte_intera str) (parte_fraz str)))
                                (expt 2 (string-length (parte_fraz str)))
                            ) -1)
                    )
                )
                (else (exact->inexact
                            (/
                                (bin-dec (string-append (parte_intera str) (parte_fraz str)))
                                (expt 2 (string-length (parte_fraz str)))
                            )
                        )
                )
            )
            (cond ; se nella stringa passata non è presente la virgola si converte normalmente (togliendo solo il + o -)
                ((string=? (substring str 0 1) "+") (bin-dec (substring str 1)))
                ((string=? (substring str 0 1) "-") (* (bin-dec (substring str 1)) -1))
                (else (bin-dec str))
            )
        )
    )
)
; restituisce il valore di val nella base numerica base
(define valore
    (lambda (val base)
        (if (string=? val (substring base 0 1)) 
            0
            (+ (valore val (substring base 1)) 1)
        )
    )
)

; converte un numero intero da una base fornita a base 10
(define b-dec 
    (lambda (base str)
        (let ((k (- (string-length str) 1)))
            (if (= k 0)
                (valore str base)
                (+ 
                    (* (string-length base) (b-dec base (substring str 0 k)))
                    (valore (substring str k) base)
                )
            )
        )
    )
)

; converte in base 10 il numero str (con eventuale segno +- e/o virgola .) da base base
(define rep->number
    (lambda (base str)
        (if (contiene? str ".")
                    ; se un numero da convertire contiene la virgola si può procedere convertendo invece
                    ; il numero ottenuto ignorando la virgola e dividendo poi il risultato per una potenza 
                    ; della base di partenza (es. base 2 -> 2, base H -> 16) con esponente il numero di cifre dopo la virgola
                    ; es. 10.1 in base 2 --> 101 base 2 / 2^1 = 5/2 = 2.5
            (cond
                ((string=? (substring str 0 1) "+")
                    (exact->inexact 
                        (/ 
                            (b-dec base (string-append (parte_intera str) (parte_fraz str))) 
                            (expt (string-length base) (string-length (parte_fraz str)))
                        )
                    )
                )
                ((string=? (substring str 0 1) "-")
                    (exact->inexact
                        (* (/ 
                                (b-dec base (string-append (parte_intera str) (parte_fraz str)))
                                (expt (string-length base) (string-length (parte_fraz str)))
                            ) -1)
                    )
                )
                (else (exact->inexact
                            (/
                                (b-dec base (string-append (parte_intera str) (parte_fraz str)))
                                (expt (string-length base) (string-length (parte_fraz str)))
                            )
                        )
                
                )
            )
            (cond ; se il numero fornito non ha la virgola si converte normalmente, togliendo prima eventuale segno (+ o -)
                ((string=? (substring str 0 1) "+") (b-dec base (substring str 1)))
                ((string=? (substring str 0 1) "-") (* (b-dec base (substring str 1)) -1))
                (else (b-dec base str))
            )
        )
    )
)