package examples.range {
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertFalse;
	import org.flexunit.asserts.assertNotNull;
	import org.flexunit.asserts.assertTrue;

	public class RangeTest {

		private var single_point_range:Range;

		private var start_point:int;

		[Before]
		public function setUp():void {
			start_point = 0;
			single_point_range=new Range(start_point, start_point);
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

		[Test]
		public function single_point_range_contains_start_point():void {
			assertTrue(single_point_range.contains(start_point));
		}

		[Test]
		public function single_point_range_doesnt_contain_nearest_points():void {
			assertFalse(single_point_range.contains(start_point - 1));
			assertFalse(single_point_range.contains(start_point + 1));
		}
		
		[Test]
		public function range_contains_all_expected_points():void {
			var range:Range = new Range(0,10);
			for (var i:uint=0;i<11;i++) {
				assertTrue( range.contains(i));
			}
		}
		
		[Ignore]
		[Test]
		public function arguments_order_is_not_important():void {
			var range1:Range = new Range(0,10);
			var range2:Range = new Range(10,0);
			// FIXME
			assertEquals( range1, range2 );
		}
		
		[Test]
		public function correctly_calculates_intersection_with_included_range():void {
			var range1:Range = new Range(0,10);
			var range2:Range = new Range(2,4);
			// FIXME
			assertEquals( range2, range1.intersection(range2) );
		}

	}
}
