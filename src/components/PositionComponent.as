package components 
{
	import entities.Entity;
	public class PositionComponent implements ComponentInterface
	{
		public var x:int;
		public var y:int;
		
		public function PositionComponent(xStart:int = 0,yStart:int = 0) 
		{
			x = xStart;
			y = yStart;
		}
		public function attached(entity:Entity):void
		{ 
			//no need to do anything when attached
			//this component is independent.
		}
	}
}