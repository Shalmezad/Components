package components 
{
	import entities.Entity;
	public class PositionTraceComponent implements ComponentInterface
	{
		public var position:PositionComponent;
		public function PositionTraceComponent() 
		{
			
		}
		
		public function attached(entity:Entity):void
		{ 
			position = entity.getComponent(PositionComponent) as PositionComponent;
			entity.attachEvent('tracePosition', this.tracePosition);
		}
		public function tracePosition():void
		{
			trace("Position x: " + position.x.toString());
			trace("Position y: " + position.y.toString());
		}
	}

}