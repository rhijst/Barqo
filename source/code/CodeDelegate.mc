import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

class CodeDelegate extends WatchUi.BehaviorDelegate {
    var view;

    function initialize(v) {
        BehaviorDelegate.initialize();
        view = v;
    }

    function onSelect() {
        view.toggleMode();
        return true;
    }

    function onSwipe(swipeEvent) {
        var direction = swipeEvent.getDirection();
        if (direction == WatchUi.SWIPE_LEFT) {
            view.toggleMode();
        } else if (direction == WatchUi.SWIPE_RIGHT) {
            WatchUi.popView(WatchUi.SLIDE_RIGHT);
        } else if (direction == WatchUi.SWIPE_UP) {
            view.toggleMode();
        } else if (direction == WatchUi.SWIPE_DOWN) {
            view.toggleMode();
        }
        WatchUi.requestUpdate();
        return true;
    }
}
