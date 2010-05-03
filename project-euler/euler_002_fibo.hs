fiboRec 0 = 0
fiboRec 1 = 1
fiboRec x = fiboRec (x - 1) + fiboRec (x - 2)

fiboFrom f1 f2 = f1 : f2 : fiboFrom (f1+f2) (f1+f2+f2)
fiboSequence = fiboFrom 0 1