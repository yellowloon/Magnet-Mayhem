extends onhitplayer
class_name CobaltOnHit

func OnHit():
	#particles
	SignalingSingleton.Cobalt += 1
	pass
