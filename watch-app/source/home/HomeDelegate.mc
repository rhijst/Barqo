import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class HomeDelegate extends WatchUi.BehaviorDelegate {
    var view;

    function initialize(v) {
        BehaviorDelegate.initialize();
        view = v;
    }

    function onSelect() {
        var card = view.getSelectedCard();

        var codeView = new CodeView(card);
        var codeDelegate = new CodeDelegate(codeView);

        WatchUi.pushView(codeView, codeDelegate, WatchUi.SLIDE_LEFT);

        return true;
    }

    function onSwipe(e) {
        var dir = e.getDirection();

        if (dir == WatchUi.SWIPE_UP) {
            view.moveUp();
        } else if (dir == WatchUi.SWIPE_DOWN) {
            view.moveDown();
        }

        return true;
    }

    function onBack() {
        return false; // exit app
    }
}
