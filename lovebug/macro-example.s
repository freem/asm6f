;-----------------------------------------------------------------
; macro for defining zero page variables
;-----------------------------------------------------------------

		rezPtr = 0			; variables start at $0000

macro		rez rezSize, rezLabel

		~rezLabel = rezPtr
		rezPtr = rezPtr + rezSize
endm



;-----------------------------------------------------------------
; define memory
;-----------------------------------------------------------------
	
		rez 2, randomSeed		; random seed

		rez 1, vblank			; != 0 vblank has occured

