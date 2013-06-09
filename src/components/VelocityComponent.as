package components 
{
	import entities.Entity;
	public class VelocityComponent implements ComponentInterface
	{
		public var xVel:Number;
		public var yVel:Number;
		private var _entity:Entity;
		public function VelocityComponent(xV:Number = 0, yV:Number = 0) 
		{
			xVel = xV;
			yVel = yV;
		}
		public function attached(entity:Entity):void
		{ 
			entity.attachEvent('update', this.update);
			_entity = entity;
		}
		public function update(data:Object):void
		{
			_entity.dispatchEvent('move', { dx:xVel, dy:yVel } );
		}
		
	}

}