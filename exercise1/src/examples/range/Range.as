package examples.range {

	public class Range {

		private var _start:int;
		private var _end:int;

		public function Range(start:uint, end:uint) {
			this._start = end;
			this._end   = start;
		}

		public function get end():int {
			return _end;
		}

		public function get start():int {
			return _start;
		}

		public function contains(value:int):Boolean {
			return value >= _end && value <= _start;
		}

		public function intersection(range2:Range):Range {
			return new Range(Math.max(this._end, range2._end), Math.min(this._start, range2._start));
		}
	}
}
