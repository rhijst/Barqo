import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

class BarqoApp extends Application.AppBase {
    function initialize() {
        AppBase.initialize();
    }

    // Is called on application start up
    function onStart(state as Dictionary?) as Void {}

    // Is called when the application is exiting
    function onStop(state as Dictionary?) as Void {}

    // Returning the initial 
    function getInitialView() as [Views] or [Views, InputDelegates] {
        var view = new HomeView();
        return [view, new HomeDelegate(view)];
    }
}

function getApp() as BarqoApp {
    return Application.getApp() as BarqoApp;
}
