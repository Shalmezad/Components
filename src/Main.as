package 
{
	import components.BitmapComponent;
	import components.PositionComponent;
	import components.PositionTraceComponent;
	import components.VelocityComponent;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;
	
	import entities.Entity;
	
	
	public class Main extends Sprite 
	{
		private var entity:Entity;
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			Screen.screen = this;
			
			// entry point
			entity = new Entity();
			entity.attachComponent(new PositionComponent(100,100));
			entity.attachComponent(new PositionTraceComponent());
			var bm:Bitmap = (new Assets.SMILEY as Bitmap);
			entity.attachComponent(new BitmapComponent(bm));
			entity.attachComponent(new VelocityComponent(.5, .5));
			entity.dispatchEvent('tracePosition', null);
			entity.dispatchEvent('draw', null);
			entity.dispatchEvent('update', null);
			addEventListener(Event.ENTER_FRAME, enterFrame);
		}
		
		private function enterFrame(e:Event = null):void
		{
			entity.dispatchEvent('update', null);
			entity.dispatchEvent('draw', null);
			entity.dispatchEvent('tracePosition', null);
		}
	}
	
}