import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;

module SimpleQR {
  function generate(data as String) as Array<Array<Number>> {
    // Simplified fixed demo QR matrix (Version 1, 21x21)
    // Demo creates a placeholder QR-like matrix.

    var size = 21;
    var matrix = [];

    for (var y = 0; y < size; y++) {
      var row = [];
      for (var x = 0; x < size; x++) {
        // Simple pseudo pattern based on hash
        var val = (x * y + data.hashCode()) % 2;
        row.add(val == 0 ? 1 : 0);
      }
      matrix.add(row);
    }

    return matrix;
  }
}
