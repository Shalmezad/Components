package 
{
	import components.BitmapComponent;
	import components.PositionComponent;
	import components.PositionTraceComponent;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
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
			//addEventListener(Event.ENTER_FRAME, enterFrame);
			Screen.screen = this;
			
			// entry point
			var entity:Entity;
			entity = new Entity();
			entity.attachComponent(new PositionComponent(2,3));
			entity.attachComponent(new PositionTraceComponent());
			var bm:Bitmap = (new Assets.SMILEY as Bitmap);
			entity.attachComponent(new BitmapComponent(bm));
			entity.dispatchEvent('tracePosition', null);
			entity.dispatchEvent('draw', null);
		}
		
		private function enterFrame(e:Event = null):void
		{
			
		}
	}
	
}