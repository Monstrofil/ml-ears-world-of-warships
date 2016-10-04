package MLControllers 
{
    import flash.events.Event;
    import flash.events.TimerEvent;
    import flash.utils.Timer;
    import lesta.components.Avatar;
    import lesta.components.Target;
    import lesta.constants.ComponentClass;
    import lesta.datahub.Collection;
    import lesta.datahub.Entity;
    import lesta.datahub.SortedCollection;
    import lesta.structs.Player;
    import lesta.structs.ShipInfo;
    import lesta.unbound.core.UbController;
    import lesta.unbound.expression.IUbExpression;
    import lesta.utils.GameInfoHolder;
    import MLModels.MLWebInfoHolder;
    import MLModels.MLPlayerInfo;
    import MLModels.MLShipInfo;
    import MLModels.MLStatistics;
    import MLModels.MLShipInfo;
	/**
     * ...
     * @author Monstrofil
     */
    public class TargetController extends UbController
    {
        private var timer:Timer = new Timer(30);
        public function TargetController() 
        {
            super();
            timer.addEventListener(TimerEvent.TIMER, this.onTick);
        }
        
        public override function init(arg1:Vector.<IUbExpression>):void
        {
            super.init(arg1);
            timer.start();
        }
        
        public override function free():void {
            timer.stop();
        }
        
        private function onTick(...rest):void {
            scope.target = GameInfoHolder.instance.selfPlayer.currentAttackedTarget;
        }
    }

}