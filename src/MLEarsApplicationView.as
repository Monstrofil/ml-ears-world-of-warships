package
{
    import flash.display.Sprite;
    import flash.text.Font;
    import MLModels.MLWebInfoHolder;
    /**
     * ...
     * @author Monstrofil
     */
    public class MLEarsApplicationView extends Sprite
    {
        [Embed(source = "WoWsSymbol.ttf", fontName = "ML_WOWSSymbol", mimeType = "application/x-font", advancedAntiAliasing = "true", embedAsCFF = "false")]
        private var ml_wowsSymbol:Class;
        
        [Embed(source = "WoTSymbol.ttf", fontName = "ML_WOTSymbol", mimeType = "application/x-font", advancedAntiAliasing = "true", embedAsCFF = "false")]
        private var ml_wotSymbol:Class;
        
        public function MLEarsApplicationView()
        {
            Font.registerFont(ml_wowsSymbol);
            Font.registerFont(ml_wotSymbol);
            
            var statsHolder:MLWebInfoHolder = MLWebInfoHolder.instance;
            
            this.addChild(new MLEarsApplication());
        }
    }
    
}

