package components 
{
	import entities.Entity;
	import flash.events.KeyboardEvent;
	public class PlayerMovementComponent implements ComponentInterface
	{
		public var velocity:VelocityComponent;
		public function PlayerMovementComponent() 
		{
			
		}
		public function attached(entity:Entity):void
		{ 
			velocity = entity.getComponent(VelocityComponent) as VelocityComponent;
			entity.attachEvent('update', this.update);
		}
		
		public function update(data:Object):void
		{
			if ( Main.isKeyDown(37) ) { 
				//Left
				velocity.xVel = -3; 
			}
			else if ( Main.isKeyDown(39) ) { 
				//Right
				velocity.xVel = 3; 
			}
			else {
				//No xVel
				velocity.xVel = 0; 
			}
		}
		
	}

}