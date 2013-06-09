package components 
{
	import entities.Entity;
	public class VelocityComponent implements ComponentInterface
	{
		public var xVel:Number;
		public var yVel:Number;
		public var position:PositionComponent;
		public function VelocityComponent(xV:Number = 0, yV:Number = 0) 
		{
			xVel = xV;
			yVel = yV;
		}
		public function attached(entity:Entity):void
		{ 
			position = entity.getComponent(PositionComponent) as PositionComponent;
			entity.attachEvent('update', this.update);
		}
		public function update(data:Object):void
		{
			position.x += xVel;
			position.y += yVel;
		}
		
	}

}