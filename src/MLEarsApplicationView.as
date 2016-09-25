package
{
    import com.adobe.images.PNGEncoder;
    import com.junkbyte.console.Cc;
    import flash.display.BitmapData;
    import flash.display.BlendMode;
    import flash.display.DisplayObjectContainer;
    import flash.display.PNGEncoderOptions;
    import flash.display.Shape;
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.TimerEvent;
    import flash.geom.Matrix;
    import flash.geom.Rectangle;
    import flash.text.Font;
    import flash.text.TextField;
    import flash.utils.ByteArray;
    import flash.utils.Timer;
    import lesta.data.GameDelegate;
    import lesta.utils.DisplayObjectUtils;
    import MLModels.MLWebInfoHolder;
    import mx.utils.Base64Encoder;
    
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

