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
		private var player:Entity;
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
			player = new Entity();
			player.attachComponent(new PositionComponent(100,100));
			player.attachComponent(new PositionTraceComponent());
			var bm:Bitmap = (new Assets.G_SMILEY as Bitmap);
			player.attachComponent(new BitmapComponent(bm));
			player.attachComponent(new VelocityComponent());
			player.attachComponent(new PlayerMovementComponent());
			player.dispatchEvent('tracePosition', null);
			player.dispatchEvent('draw', null);
			player.dispatchEvent('update', null);
			addEventListener(Event.ENTER_FRAME, enterFrame);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyHandleUp);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyHandleDown);
		}
		
		private function enterFrame(e:Event = null):void
		{
			player.dispatchEvent('update', null);
			player.dispatchEvent('draw', null);
			player.dispatchEvent('tracePosition', null);
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