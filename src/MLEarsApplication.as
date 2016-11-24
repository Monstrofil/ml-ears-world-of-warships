package 
{
	import flash.display.Stage;
    import flash.text.Font;
	import com.monstrofil.unbound.MLUnboundApplication;
	
	/**
     * ...
     * @author Monstrofil
     */
    public class MLEarsApplication extends MLUnboundApplication 
    {
        
        public function MLEarsApplication() 
        {
            super("root_block", "ml-ears-world-of-warships");
        }
        
        private function get folderName():String {
            var urlTokens:Array = this.loaderInfo.url.split('/').join('\\').split("\\");
			return urlTokens[urlTokens.length - 2]; 
        }
        
        private function get folderPath():String {
            var normalisedUrl:String = this.loaderInfo.url.split('/').join('\\');
			return normalisedUrl.substr(0, normalisedUrl.lastIndexOf('\\')); // FIXME: remove in future
        }
        
        private function get configPath():String {
            return [this.folderPath, this.folderName].join('\\') + '.xml';
        }
        
        var __global:__Global;
    }

}