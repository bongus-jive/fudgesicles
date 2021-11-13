function init()
  Time = effect.getParameter("timer", 6)
	timer = 0
	
	animator.playSound("start")
	animator.setParticleEmitterOffsetRegion("blood", mcontroller.boundBox())
end

function update(dt)
	if timer < 1 then
		timer = math.min(1, timer + (dt / Time))
		
		mcontroller.translate{rand(0.05 * timer), rand(0.025 * timer)}
		
		effect.setParentDirectives("fade=805933="..timer * 0.8)
		
		if timer == 1 then
			animator.burstParticleEmitter("blood")
			animator.playSound("kill")
		end
	else
		effect.addStatModifierGroup{{stat = "invisible", amount = 1}, {stat = "maxHealth", effectiveMultiplier = 0}}
	end
end

function rand(r) return -r + math.random() * 2 * r end
