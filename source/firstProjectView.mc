import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;

class firstProjectView extends WatchUi.View {
  var _qrMatrix;

  function initialize() {
    System.println("Hello Monkey C!");

    View.initialize();

    var data = "773 100 073 684 704 120";
    _qrMatrix = SimpleQR.generate(data);
    System.println("Generated QR matrix for data: " + data);
  }
  // Load your resources here
  // function onLayout(dc as Dc) as Void {
  //     setLayout(Rez.Layouts.MainLayout(dc));
  // }

  // Called when this View is brought to the foreground. Restore
  // the state of this View and prepare it to be shown. This includes
  // loading resources into memory.
  function onShow() as Void {}
  function onUpdate(dc as Dc) as Void {
    dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
    dc.clear();

    drawQR(dc, _qrMatrix);

    // // Call the parent onUpdate function to redraw the layout
    // View.onUpdate(dc);
  }

  // Called when this View is removed from the screen. Save the
  // state of this View here. This includes freeing resources from
  // memory.
  function onHide() as Void {}

  function drawQR(dc as Dc, matrix as Array<Array<Number>>) as Void {
    var size = matrix.size();  // e.g. 21
    var padding = 25;

    var available = dc.getWidth() - padding * 2;
    var moduleSize = available / size;

    var startX = (dc.getWidth() - moduleSize * size) / 2;
    var startY = (dc.getHeight() - moduleSize * size) / 2;

    for (var y = 0; y < size; y++) {
      for (var x = 0; x < size; x++) {
        if (matrix[y][x] == 1) {
          dc.fillRectangle(startX + x * moduleSize, startY + y * moduleSize,
                           moduleSize, moduleSize);
        }
      }
    }
    
  }
}