package pl.view {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	
	/**
	 * Adds button behavior to movie clip
	 * Movie clip should have 3 frames - normal,over,down
	 */
	public class ButtonDecorator extends EventDispatcher {
		public static const CLICK = "click";
		public static const OVER = "over";
		public static const DOWN = "down";
		public static const OUT = "out";
		
		public var clip:MovieClip;
		
		//private var _depth:Number;
		private var _wasDown:Boolean;
		protected var _enabled:Boolean = true;
		
		// TODO Decorator powinien dodać skinMc do swojej display listy i dodawać się do parenta skinMc
		public function ButtonDecorator( skinMc:MovieClip ) {
			super();
			if (!(skinMc is MovieClip)) {
				throw new ArgumentError("parameter is not a MovieClip")
			}
			
			clip = skinMc;
			
			clip.gotoAndStop(1);
			clip.buttonMode = true;
			clip.useHandCursor = true;
			clip.mouseChildren = false;
			clip.tabEnabled = false;
			clip.addEventListener(MouseEvent.ROLL_OVER,mOver);
			clip.addEventListener(MouseEvent.ROLL_OUT,mOut);
			clip.addEventListener(MouseEvent.MOUSE_DOWN,mDown);			
			clip.addEventListener(MouseEvent.MOUSE_UP, mUp);
		}
		
		public function mOver(event:MouseEvent):void {
			if (!_enabled) return;
			clip.gotoAndStop(2);
			dispatchEvent( new Event(OVER) );
		}
		
		public function mOut(event:MouseEvent):void {
			if (!_enabled) return;
			clip.gotoAndStop(1);
			dispatchEvent( new Event(OUT) );
		}
		
		public function mDown(event:MouseEvent):void {
			if (!_enabled) return;
			_wasDown = true;
			clip.gotoAndStop(3);
			event.updateAfterEvent();
			dispatchEvent( new Event(DOWN) );
		}
		
		public function mUp(event:MouseEvent):void {
			if (!_wasDown || !_enabled) return;
			_wasDown = false;			
			clip.gotoAndStop(2);
			event.updateAfterEvent();
			dispatchEvent( new Event(CLICK) );
		}
		
		public function set enabled(st:Boolean):void {
			var fr:int = st? 1 : 4;
			if (fr > clip.totalFrames) {
				fr = 1;
			}
			clip.gotoAndStop( fr );
			_enabled = st;
			clip.enabled = st;
			clip.mouseEnabled = st;
			clip.useHandCursor = st;
		}
		
		public function get enabled():Boolean {
			return _enabled;
		}
		
		public function show():void {
			enabled = true;
			clip.visible = true;
		}
		
		public function hide():void {
			enabled = false;
			clip.visible = false;
		}
		
		public function cleanup():void {
			clip.removeEventListener(MouseEvent.ROLL_OVER,mOver);
			clip.removeEventListener(MouseEvent.ROLL_OUT,mOut);
			clip.removeEventListener(MouseEvent.MOUSE_DOWN,mDown);			
			clip.removeEventListener(MouseEvent.MOUSE_UP, mUp);
			clip = null;
		}
	}
}
