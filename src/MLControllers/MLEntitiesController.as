package MLControllers 
{
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
        
        public override function init(arg1:Vector.<IUbExpression>):void
        {
            super.init(arg1);
            var collection:Collection = MLDatahubController.xvmDataHub.getCollection(ComponentClass.avatar).child("team");
            var teamCollection:Collection = collection.child(true).child("sortedAlive");
            var enemyCollection:Collection = collection.child(false).child("sortedAlive");
            
            for each(var e:Entity in teamCollection.items) {
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
            
            for each(var e:Entity in enemyCollection.items) {
               e.addComponent(MLWebInfoHolder.instance.getStatisticsComponent(e.avatar.name)); 
               
                for each(var player:Player in GameInfoHolder.instance.listEnemyPlayers)
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
            
            scope.team = teamCollection.items;
            scope.enemy = enemyCollection.items;
            
            teamCollection.evMoved.addCallback(function():void {
                updateInScope("team");
            });
            enemyCollection.evMoved.addCallback(function():void {
                updateInScope("enemy");
            });
            
        }
    }

}