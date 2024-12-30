extends onhitplayer
class_name CobaltOnHit

func OnHit():
	#particles
	SignalingSingleton.ScoreIncrease()
	pass
