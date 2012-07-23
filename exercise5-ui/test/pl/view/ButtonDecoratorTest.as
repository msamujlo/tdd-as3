package pl.view {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.system.Capabilities;
	import flash.system.System;
	import flash.utils.Dictionary;

	import mx.core.UIComponent;

	import org.flexunit.asserts.assertFalse;
	import org.flexunit.asserts.assertTrue;
	import org.flexunit.async.Async;
	import org.fluint.uiImpersonation.UIImpersonator;

	public class ButtonDecoratorTest {

		private var valueHolder:Dictionary=new Dictionary(true);

		[Before]
		public function setUp():void {
		}

		[After]
		public function tearDown():void {
		}

		[BeforeClass]
		public static function setUpBeforeClass():void {
		}

		[AfterClass]
		public static function tearDownAfterClass():void {
		}

		[Test(ui, async)]
		public function decorator_doesnt_respond_to_events_when_decorated_object_is_removed_from_stage():void {
			var decorated:MovieClip=new MovieClip();
			var wrapper:UIComponent=new UIComponent();
			UIImpersonator.addChild(wrapper);
			wrapper.addChild(decorated);
			var buttonDeco:ButtonDecorator=new ButtonDecorator(decorated);
			UIImpersonator.removeAllChildren();
			System.gc();
			Async.failOnEvent(this, buttonDeco, ButtonDecorator.DOWN);
			decorated.dispatchEvent(new MouseEvent(MouseEvent.MOUSE_DOWN));
		}

		[Test(async)]
		public function is_garbage_collected_after_cleanup():void {
			traceMem();
			var decorated:MovieClip=new MovieClip();
			var buttonDeco:ButtonDecorator=new ButtonDecorator(decorated);
			valueHolder[buttonDeco]=true;
			buttonDeco.cleanup();
			buttonDeco=null;

			trace("isDebugger:", Capabilities.isDebugger)
			System.gc();
			System.gc();
			traceMem()

			Async.delayCall(this, check_if_is_garbage_collected_after_cleanup, 500);


		}

		private function check_if_is_garbage_collected_after_cleanup():void {
			var found:Boolean=false;
			for (var key:Object in valueHolder) {
				trace(key,valueHolder[key]);
				if (key is ButtonDecorator) {
					found=true;
					break;
				}
			}
			traceMem();
			assertFalse("ButtonDecorator is garbage collected", found);
		}

		private function traceMem():void {
			trace(System.totalMemory, System.freeMemory);
		}

	}
}
