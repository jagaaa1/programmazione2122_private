;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname tasselli) (read-case-sensitive #t) (teachpacks ((lib "drawings.ss" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "drawings.ss" "installed-teachpacks")) #f)))

; controlla se un numero è una potenza di 2
(define potenza-di2?
    (lambda (n)
        (if (integer? (log n 2))
            true
            false
        )
    )
)

; crea un'immagine con il pattern di (L-tesselation 2)
(define L-2
    (lambda (l shift) ; l: tassello, shift: quanto shiftare i tasselli = (lato lungo / 2)
        (glue-tiles
            (glue-tiles
                l
                (shift-down (quarter-turn-left l) shift)
            )
            (glue-tiles
                (shift-right (shift-down l (/ shift 2)) (/ shift 2))
                (shift-right (quarter-turn-right l) shift)
            )
        )
    )
)

; crea l'immagine del problema a partire dalla lunghezza n del lato più corto
(define L-tesselation
    (lambda (n)
        (if (potenza-di2? n)
            (cond
                ((= n 1) L-tile)
                ((= n 2) (L-2 L-tile 1))
                ; per lato n >2 si usa ricorsivamente il pattern di lato 2 utilizzando come
                ; tassello l'immagine corrispondente alla potenza di 2 precedente
                (else (L-2 (L-tesselation (/ n 2)) (/ n 2)))
            )
            "Il numero fornito deve essere una potenza di 2"
        )
    )
)