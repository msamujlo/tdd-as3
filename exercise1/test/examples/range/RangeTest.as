package examples.range
{
	import org.flexunit.asserts.assertNotNull;
	import org.flexunit.asserts.assertTrue;

	public class RangeTest
	{		
		[Before]
		public function setUp():void
		{
		}
		
		[After]
		public function tearDown():void
		{
		}
		
		[BeforeClass]
		public static function setUpBeforeClass():void
		{
		}
		
		[AfterClass]
		public static function tearDownAfterClass():void
		{
		}
		
		[Test]
		public function single_point_range_contains_start_point():void {
			var start_point:int = 0;
			var single_point_range:Range = new Range(start_point,start_point);
			assertTrue( single_point_range.contains(start_point) );
		}
		
	}
}