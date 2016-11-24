package MLControllers 
{
    import com.junkbyte.console.Cc;
    import lesta.components.Avatar;
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
    public class MLEntitiesController extends UbController
    {
        
        public function MLEntitiesController() 
        {
            super();
        }
        private var teamCollection:Collection = null;
        private var enemyCollection:Collection = null;
        public override function init(arg1:Vector.<IUbExpression>):void
        {
            super.init(arg1);
            var collection:Collection = MLDatahubController.xvmDataHub.getCollection(ComponentClass.avatar);
            this.teamCollection = collection.getChildByPath("team.ally.sortedAlive");
            this.enemyCollection = collection.getChildByPath("team.enemy.sortedAlive");
            
            trace(this.enemyCollection.items);
            
            
            for each(var e:Entity in this.teamCollection.items) {
               e.addComponent(MLWebInfoHolder.instance.getStatisticsComponent(e.avatar.name)); 
               for each(var player:Player in GameInfoHolder.instance.listAlliedPlayers)
               {
                    if (player.name == e.avatar.name) {
                        var shipInfo:MLShipInfo = new MLShipInfo();
                        shipInfo.setShipInfo(player.shipParams);
                        e.addComponent(shipInfo);
                        
                        var playerInfo:MLPlayerInfo = new MLPlayerInfo();
                        playerInfo.setPlayer(player);
                        e.addComponent(playerInfo);
                        break;
                    }
               }
            }
            
            for each(var e:Entity in this.enemyCollection.items) {
               e.addComponent(MLWebInfoHolder.instance.getStatisticsComponent(e.avatar.name)); 
               for each(var player:Player in GameInfoHolder.instance.listAlliedPlayers)
               {
                    if (player.name == e.avatar.name) {
                        var shipInfo:MLShipInfo = new MLShipInfo();
                        shipInfo.setShipInfo(player.shipParams);
                        e.addComponent(shipInfo);
                        
                        var playerInfo:MLPlayerInfo = new MLPlayerInfo();
                        playerInfo.setPlayer(player);
                        e.addComponent(playerInfo);
                        break;
                    }
               }
            }
        }
    }

}