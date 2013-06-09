package components 
{
	import entities.Entity;
	public class PositionComponent implements ComponentInterface
	{
		public var x:Number;
		public var y:Number;
		
		public function PositionComponent(xStart:Number = 0,yStart:Number = 0) 
		{
			x = xStart;
			y = yStart;
		}
		public function attached(entity:Entity):void
		{ 
			entity.attachEvent('move', this.move);
		}
		public function move(data:Object):void
		{
			x += data.dx;
			y += data.dy;
		}
	}
}