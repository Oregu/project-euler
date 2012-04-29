{-
In England the currency is made up of pound, £, and pence, p, and there are eight coins in general circulation:

1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).
It is possible to make £2 in the following way:

1x£1 + 1x50p + 2x20p + 1x5p + 1x2p + 3x1p
How many different ways can £2 be made using any number of coins?
-}

main = putStrLn $ show solve

solve = 1 + length [(p5, p2) | -- one for £2
	p100<-[0..2],
	p50<-[0..4],
	p20<-[0..10],
	p10<-[0..20],
	p5<-[0..40],
	p2<-[0..100],
	p100*100+p50*50+p20*20+p10*10+p5*5+p2*2 <= 200]
