package entities 
{
	import components.ComponentInterface;
	public class Entity 
	{
		public var activeComponents:Array; 
		public var eventListeners:Array;
		public function Entity()
		{
			activeComponents = new Array();
			eventListeners = new Array();
		}
		public function attachComponent(component:ComponentInterface):void
		{
			//add the component to the list
			activeComponents.push(component);
			//call the components attached() 
			component.attached(this);
		}
		public function getComponent(type:Class):ComponentInterface
		{
			for each (var component:ComponentInterface in activeComponents) {
				if (component as type) {
					return component;
				}
			}
			return null;
		}
		public function dispatchEvent(keyword:String, data:Object):void
		{
			for each (var cel:ComponentEventListener in eventListeners) {
				if (cel.keyword == keyword) {
					cel.callback(data);
				}
			}
		}
		public function attachEvent(keyword:String, callback:Function, priority:int = 0):void
		{
			var cel:ComponentEventListener;
			cel = new ComponentEventListener();
			cel.keyword = keyword;
			cel.callback = callback;
			eventListeners.push(cel);
		}
	}
	


}