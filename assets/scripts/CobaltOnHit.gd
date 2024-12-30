extends onhitplayer
class_name CobaltOnHit

func OnHit():
	#particles
	if SignalingSingleton.playing == false:
		return
	SignalingSingleton.ScoreIncrease()
	pass
