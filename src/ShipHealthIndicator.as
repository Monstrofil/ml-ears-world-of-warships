package 
{
    import flash.display.Loader;
    import flash.display.MovieClip;
    import flash.events.ErrorEvent;
    import flash.events.TimerEvent;
    import flash.events.UncaughtErrorEvent;
    import flash.events.Event;
    import flash.utils.Timer;

    import flash.net.URLRequest;
    import lesta.dialogs.battle_window._modules_panel.HPData;
	import lesta.dialogs.battle_window._modules_panel.ShipStatusIndicator;
	
	/**
     * ...
     * @author Monstrofil
     */
    public class ShipHealthIndicator extends MovieClip 
    {
        var _hpData:HPData = new HPData();
        private var shipHealthIndicator:ShipStatusIndicator = null;
        
        public function ShipHealthIndicator() 
        {
           super();
           
            var loader:Loader = new Loader();
            var req:URLRequest = new URLRequest("ship_state.swf");
            loader.contentLoaderInfo.addEventListener(Event.COMPLETE, this.fooLoadComplete);
            loader.load(req);
            
            this._hpData.hp = 200;
            this._hpData.regValue = 200;
            this._hpData.maximum = 200;
        }
        
        private function fooLoadComplete(e:Event):void
        {
            var ClassDefinition:Class = e.target.applicationDomain.getDefinition("CustomBar") as Class;
            shipHealthIndicator = new ClassDefinition();
                
            shipHealthIndicator.type = "health";
            shipHealthIndicator.isAlive = true;
            shipHealthIndicator.shipName = "PASC007";
            shipHealthIndicator.updateHP(_hpData);
            
            //shipHealthIndicator.scaleX = shipHealthIndicator.scaleY = 0.4;

            this.addChild(shipHealthIndicator);
        }
        
        public function get health() {
           return this._hpData.hp; 
        }
        
        public function set health(value:int) {
           this._hpData.hp = value;
           
           trace(value);

           if(shipHealthIndicator)
            shipHealthIndicator.updateHP(_hpData);
        }
        
        public function get regen() {
           return this._hpData.regValue; 
        }
        
        public function set regen(value:int) {
           this._hpData.regValue = value; 

           if(shipHealthIndicator)
            shipHealthIndicator.updateHP(_hpData);        
        }
        
        public function get maxhealth() {
           return this._hpData.maximum; 
        }
        
        public function set maxhealth(value:int) {
           this._hpData.maximum = value; 
           
           if(shipHealthIndicator)
            shipHealthIndicator.updateHP(_hpData);
        }
        
    }

}