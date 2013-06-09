package 
{
	import components.PositionComponent;
	import components.PositionTraceComponent;
	import flash.display.Sprite;
	import flash.events.Event;
	
	import entities.Entity;
	
	
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			
			var entity:Entity;
			entity = new Entity();
			entity.attachComponent(new PositionComponent(2,3));
			entity.attachComponent(new PositionTraceComponent());
		}
		
	}
	
}