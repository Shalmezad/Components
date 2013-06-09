package 
{
	import components.BitmapComponent;
	import components.PlayerMovementComponent;
	import components.PositionComponent;
	import components.PositionTraceComponent;
	import components.VelocityComponent;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	
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
			entity.attachComponent(new VelocityComponent());
			entity.attachComponent(new PlayerMovementComponent());
			entity.dispatchEvent('tracePosition', null);
			entity.dispatchEvent('draw', null);
			entity.dispatchEvent('update', null);
			addEventListener(Event.ENTER_FRAME, enterFrame);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyHandleUp);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyHandleDown);
		}
		
		private function enterFrame(e:Event = null):void
		{
			entity.dispatchEvent('update', null);
			entity.dispatchEvent('draw', null);
			entity.dispatchEvent('tracePosition', null);
		}

		public static var hash:Object = {};

		private function keyHandleUp(ev:KeyboardEvent):void {
			delete hash[ev.keyCode];
		}

		private function keyHandleDown(ev:KeyboardEvent):void {
			hash[ev.keyCode] = 1;
		}

		public static function isKeyDown(code:int):Boolean {
			return hash[code] !== undefined;
		}
		
	}
	
}