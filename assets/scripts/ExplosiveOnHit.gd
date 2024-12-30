extends onhitplayer
class_name ExplosiveOnHit



func OnHit():
	#player boom anim / particles
	SignalingSingleton.DmgPlayer()
	print(SignalingSingleton.Health)
	pass
