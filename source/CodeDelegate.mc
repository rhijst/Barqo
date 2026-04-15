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
        view.nextCode();
        return true;
    }

    function onSwipe(swipeEvent) {
        var direction = swipeEvent.getDirection();
        if (direction == WatchUi.SWIPE_LEFT) {
            System.println(view.nextCode());
        } else if (direction == WatchUi.SWIPE_RIGHT) {
            WatchUi.popView(view);
        }
        WatchUi.requestUpdate();
        return true;
    }
}
