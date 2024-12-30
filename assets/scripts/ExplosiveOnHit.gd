extends onhitplayer
class_name ExplosiveOnHit



func OnHit():
	#player boom anim / particles
	if SignalingSingleton.playing == false:
		return
	SignalingSingleton.DmgPlayer()
	print(SignalingSingleton.Health)
	pass
