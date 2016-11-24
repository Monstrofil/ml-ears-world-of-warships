package com.monstrofil.unbound
{
   import lesta.managers.windows.Overlay;
   import lesta.unbound.core.UbCentral;
   import flash.display.Stage;
   import lesta.unbound.layout.measure.nextgen.NewLayout;
   import lesta.unbound.layout.measure.nextgen.NewLayoutManager;
   import lesta.unbound.layout.UbBlock;
   import com.monstrofil.unbound.MLUbBlockFactory;
   import flash.geom.Point;
   import lesta.utils.Invoker;
   import flash.events.Event;
   import com.monstrofil.XMLProcessor;
   import scaleform.gfx.Extensions;
   import scaleform.clik.managers.FocusHandler;
   import lesta.managers.GameInputHandler;
   import lesta.managers.HotKeyManager;
   import lesta.managers.CapsLockManager;
   import lesta.data.GameDelegate;
   import lesta.constants.Calls;
   import com.junkbyte.console.Cc;
   import lesta.unbound.core.UbGlobalDefinitions;
   import lesta.unbound.core.UbRootScope;
   import lesta.unbound.style.UbStyle;
   import lesta.unbound.core.UbScope;
   import lesta.managers.windows.WindowStates;
   import lesta.unbound.layout.UbRootBlock;
   import lesta.unbound.core.UbInjector;
   import lesta.managers.TooltipManager;
   import lesta.managers.FocusWindowsManager;
   import lesta.managers.DragAndDropManager;
   import lesta.managers.AccountLevelingManager;
   import lesta.utils.GameInfoHolder;
   import lesta.cpp.Translator;
   import lesta.utils.StringUtils;
   import lesta.utils.DateTime;
   import flash.display.DisplayObject;
   import lesta.utils.DisplayObjectUtils;
   import flash.display.DisplayObjectContainer;
   import lesta.structs.PriceInfoSet;
   import lesta.constants.URL;
   import lesta.constants.Path;
   import lesta.structs.ExteriorConfig;
   import lesta.constants.AccountLevelConstants;
   import lesta.dialogs.dock.constants.LobbyConstants;
   import lesta.constants.BattleTypes;
   import lesta.constants.GameMode;
   import lesta.constants.EvaluationType;
   import lesta.constants.EvaluationTopic;
   import lesta.utils.UIStrings;
   import lesta.constants.RankedBattleStatus;
   import lesta.constants.RBDeny;
   import lesta.constants.RewardReason;
   import lesta.constants.RankBattlesStages;
   import lesta.constants.ObjectTypes;
   import lesta.constants.ExteriorTypes;
   import lesta.constants.SSETypes;
   import lesta.structs.CapturePointType;
   import lesta.constants.ShipTypes;
   import lesta.constants.Country;
   import lesta.constants.ShipLevels;
   import lesta.constants.BuildingType;
   import lesta.constants.ComponentClass;
   import lesta.constants.VoteConstants;
   import lesta.constants.USSConstants;
   import lesta.constants.UssMath;
   import lesta.managers.constants.WindowTooltipState;
   import MLBindings.SFMCallBinding;
   import lesta.unbound.bindings.UbChildBinding;
   import lesta.unbound.bindings.UbInstanceBinding;
   import lesta.unbound.bindings.UbEventBinding;
   import lesta.unbound.bindings.UbDispatchBinding;
   import lesta.unbound.bindings.UbStyleBinding;
   import lesta.unbound.bindings.UbStyleClassBinding;
   import lesta.unbound.bindings.UbSyncBinding;
   import lesta.unbound.bindings.UbRepeatBinding;
   import lesta.libs.unbound.DHDataRefBinding;
   import lesta.libs.unbound.DHWatchBinding;
   import lesta.libs.unbound.DHEntityBinding;
   import lesta.libs.unbound.DHFirstEntityBinding;
   import lesta.libs.unbound.DHHandleEventBinding;
   import lesta.libs.unbound.DHCollectionBinding;
   import lesta.libs.unbound.DHCollectionRepeatBinding;
   import lesta.libs.unbound.DHComponentBinding;
   import lesta.unbound.bindings.UbClikListBinding;
   import lesta.libs.unbound.WowsDraggableBinding;
   import lesta.libs.unbound.WowsResizeBinding;
   import lesta.unbound.bindings.UbAppearBinding;
   import lesta.unbound.bindings.UbFadeBinding;
   import lesta.unbound.bindings.UbTransitionBinding;
   import lesta.unbound.bindings.UbPluralTextBinding;
   import lesta.unbound.bindings.UbTooltipBinding;
   import lesta.unbound.bindings.UbContextMenuBinding;
   import lesta.unbound.bindings.UbBlurLayerBinding;
   import lesta.unbound.bindings.UbBlurMapBinding;
   import lesta.libs.unbound.InputMappingBinding;
   import lesta.libs.unbound.SFMRequestBinding;
   import lesta.libs.unbound.SFMActionBinding;
   import lesta.libs.unbound.FocusBinding;
   import lesta.unbound.bindings.UbSequenceBinding;
   import lesta.libs.unbound.UBAccountLevelBinding;
   import lesta.unbound.bindings.UbCatchEventBinding;
   import lesta.unbound.bindings.UBVariablesBinding;
   import lesta.unbound.bindings.UbWatchBinding;
   import lesta.libs.unbound.ActionIsDisplayBinding;
   import lesta.unbound.bindings.UbRepeatWithScopeHoldBinding;
   import lesta.unbound.bindings.UbStageSizeBinding;
   import lesta.unbound.bindings.UBClickSplitBinding;
   import lesta.unbound.bindings.UbSubstituteBinding;
   import lesta.unbound.bindings.UbScopeTraceBinding;
   import lesta.unbound.bindings.UbChangeDispatchBinding;
   import lesta.unbound.bindings.UbCountdownBinding;
   import lesta.unbound.bindings.UbFileBinding;
   import lesta.unbound.bindings.UbIMEEnableBinding;
   import lesta.unbound.bindings.UbLinearChartBinding;
   import lesta.unbound.bindings.UbEventSequenceBinding;
   import lesta.unbound.bindings.UbContainsBinding;
   import lesta.libs.unbound.UbFeatureCheckBinding;
   import lesta.unbound.bindings.UbTimeFormatBinding;
   import lesta.unbound.bindings.UBServerTimeBinding;
   import lesta.unbound.bindings.UbGeneratorBinding;
   import lesta.libs.unbound.DHCollectionGeneratorBinding;
   import lesta.unbound.bindings.UbClockBinding;
   import lesta.libs.unbound.UbInOutActionBinding;
   import lesta.libs.unbound.UbEventPlaySoundBinding;
   import lesta.unbound.bindings.UbVTileHackBinding;
   
   public class MLUnboundApplication extends Overlay
   {
       
      private var proto_central:UbCentral;
      
      private var root_stage:Stage;
      
      private var root_block:String;
      
      private var modification_name:String;
      
      private var _root:UbBlock;
      
      private var blockFactory:MLUbBlockFactory;
      
      private var mSizeStage:Point;
      
      private var layoutTooltips:UbBlock;
      
      private var layoutWindows:UbBlock;
      
      public var evComplete:Invoker;
      
      public var isReady:Boolean = false;
      
      public var _layoutManager:NewLayoutManager;
      
      public function MLUnboundApplication(root_block:String, modification_name:String)
      {
          this._layoutManager = new NewLayoutManager(this);
          this._layoutManager.enable();
         this.mSizeStage = new Point(0,0);
         this.evComplete = new Invoker();
         super(null,false,0,-1);
         this.root_block = root_block;
         this.modification_name = modification_name;
         if(stage)
         {
            this.init();
         }
         else
         {
            addEventListener(Event.ADDED_TO_STAGE,this.init);
         }
      }
      
      static function __indexOf(arg1:Object, arg2:Object) : int
      {
         if(arg2)
         {
            if(arg2 is Array || arg2 is String || arg2 is Vector.<Object>)
            {
               return arg2.indexOf(arg1);
            }
         }
         return -1;
      }
      
      static function __isIn(arg1:Object, arg2:Object) : Boolean
      {
         if(arg2)
         {
            if(arg2 is Array || arg2 is String || arg2 is Vector.<Object>)
            {
               return arg2.indexOf(arg1) >= 0;
            }
            return arg1 in arg2;
         }
         return false;
      }
      
      private function init(e:Event = null) : void
      {
         removeEventListener(Event.ADDED_TO_STAGE,this.init);
         this.root_stage = this.stage;
         var xmlProcessor:XMLProcessor = new XMLProcessor();
         xmlProcessor.addEventListener(Event.COMPLETE,this.onConfigLoaded);
         xmlProcessor.loadXML(this.modification_name + "/__root.xml");
         Extensions.enabled = true;
         Extensions.noInvisibleAdvance = true;
         FocusHandler.init(this.root_stage,null);
         GameInputHandler.instance.initialize();
         HotKeyManager.instance.init();
         CapsLockManager.instance.init();
         GameDelegate.addCallBack(Calls.MainScene_updateStage,this,this.updateStage);
      }
      
      public function fini() : void
      {
         this.proto_central.free();
         this.blockFactory.fini();
      }
      
      private function updateStage(arg1:Number, arg2:Number) : void
      {
         this.mSizeStage.x = arg1;
         this.mSizeStage.y = arg2;
         Cc.info(arg1,arg2);
         if(this.root_block)
         {
            this._root.style.width = arg1;
            this._root.style.height = arg2;
            this._root.invalidateChildren();
            this._root.invalidateStageRelativeChildren();
            this._root.update(true);
         }
      }
      
      private function onConfigLoaded(e:Event) : void
      {
         this.makeBlocks(e.target.data);
      }
      
      private function onConfigFail(e:Event) : void
      {
         Cc.log("Loading unbound failed...");
      }
      
      private function makeBlocks(xml:XML) : void
      {
         var ubGlobal:UbGlobalDefinitions = new UbGlobalDefinitions();
         this.setupUnbound(ubGlobal);
         Extensions.enabled = true;
         Extensions.noInvisibleAdvance = true;
         FocusHandler.init(this.root_stage,null);
         this.blockFactory = new MLUbBlockFactory(this.proto_central, this._layoutManager);
         this.blockFactory.loadPlansFromXml(xml);
         var ubScope:UbRootScope = new UbRootScope(ubGlobal);
         this._root = this.blockFactory.constructAsRoot(this.root_block);
         this.proto_central.forceUpdate();
         this._root.update(true);
         this._root.style.widthMode = UbStyle.DIMENSION_ABSOLUTE;
         this._root.style.heightMode = UbStyle.DIMENSION_ABSOLUTE;
         this._root.style.width = this.mSizeStage.x;
         this._root.style.height = this.mSizeStage.y;
         this.addChild(this._root);
         this._root.addChildProperly(this.layoutWindows);
         this._root.addChildProperly(this.layoutTooltips);
         this.proto_central.onEvent("startShow",null,UbScope.EVENT_DIRECTION_DOWN);
         this.proto_central.start();
         this.proto_central.onEvent("onBecomeTop",null,UbScope.EVENT_DIRECTION_DOWN);
         dispatchState(WindowStates.READY_FOR_DATA);
         this.evComplete.invoke();
         this.isReady = true;
         super.beforeOpen({});
         this.onBecomeTop({});
         Cc.log(this.overlayBackground,this.overlayCenterWidget,this.overlaySize);
      }
      
      public function makeRootBlock(id:String) : UbRootBlock
      {
         var _root:UbRootBlock = this.blockFactory.constructAsRoot(id);
         _root.update(true);
         return _root;
      }
      
      protected function setupUnbound(globalDefinitions:UbGlobalDefinitions) : void
      {
         var injector:UbInjector = null;
         var ChannelGroup:Object = null;
         var InviteType:Object = null;
         var WindowTooltipStateDict:Object = null;
         var wowsBindingsSet:Object = null;
         var loc1:* = undefined;
         var i:String = null;
         injector = new UbInjector();
         var tooltipManager:TooltipManager = new TooltipManager(this);
         Cc.log(tooltipManager.mapBehavioursIdsByName);
         injector.addPreconstructed(tooltipManager);
         injector.addPreconstructed(new FocusWindowsManager());
         injector.addPreconstructed(MLDatahubController.xvmDataHub);
         injector.addPreconstructed(new DragAndDropManager(this.stage,this));
         injector.addPreconstructed(AccountLevelingManager.instance);
         injector.addPreconstructed(GameInfoHolder.instance);
         injector.addPreconstructed(injector);
         this.proto_central = new UbCentral(this.root_stage, injector, globalDefinitions);
         var lay:NewLayoutManager = new NewLayoutManager(this);
         this.layoutWindows = new UbBlock(this._layoutManager);
         this.layoutWindows.style.widthMode = UbStyle.DIMENSION_ABSOLUTE;
         this.layoutWindows.style.heightMode = UbStyle.DIMENSION_ABSOLUTE;
         this.layoutWindows.style.position = UbStyle.POSITION_ABSOLUTE;
         this.layoutTooltips = new UbBlock(this._layoutManager);
         this.layoutTooltips.style.widthMode = UbStyle.DIMENSION_ABSOLUTE;
         this.layoutTooltips.style.heightMode = UbStyle.DIMENSION_ABSOLUTE;
         this.layoutTooltips.style.position = UbStyle.POSITION_ABSOLUTE;
         this.proto_central.setGlobalDefinition("layoutTooltips",this.layoutTooltips);
         this.proto_central.setGlobalDefinition("layoutWindows",this.layoutWindows);
         this.proto_central.setGlobalDefinition("tr",function(arg1:String):String
         {
            return !!arg1?Translator.translate(arg1):"";
         });
         this.proto_central.setGlobalDefinition("subst",StringUtils.asprintf);
         this.proto_central.setGlobalDefinition("toUpperCase",function(arg1:String):String
         {
            return String(arg1).toUpperCase();
         });
         this.proto_central.setGlobalDefinition("toLowerCase",function(arg1:String):String
         {
            return String(arg1).toLowerCase();
         });
         this.proto_central.setGlobalDefinition("indexOf",__indexOf);
         this.proto_central.setGlobalDefinition("isIn",__isIn);
         this.proto_central.setGlobalDefinition("format",StringUtils.format);
         this.proto_central.setGlobalDefinition("timestampToHourMinSec",DateTime.timestampToHourMinSec);
         this.proto_central.setGlobalDefinition("getDescendantByName",function(arg1:String):DisplayObject
         {
            return DisplayObjectUtils.getDescendantByName(root_stage as DisplayObjectContainer,arg1);
         });
         this.proto_central.setGlobalDefinition("TooltipBehaviour",tooltipManager.mapBehavioursIdsByName);
         this.proto_central.setGlobalDefinition("PriceInfoSet",PriceInfoSet);
         this.proto_central.setGlobalDefinition("URL",URL);
         this.proto_central.setGlobalDefinition("Path",Path);
         this.proto_central.setGlobalDefinition("ExteriorConfig",ExteriorConfig);
         this.proto_central.setGlobalDefinition("AccountLevelConstants",AccountLevelConstants);
         this.proto_central.setGlobalDefinition("LobbyConstants",LobbyConstants);
         this.proto_central.setGlobalDefinition("BattleTypes",BattleTypes);
         this.proto_central.setGlobalDefinition("GameMode",GameMode);
         this.proto_central.setGlobalDefinition("EvaluationType",EvaluationType);
         this.proto_central.setGlobalDefinition("EvaluationTopic",EvaluationTopic);
         this.proto_central.setGlobalDefinition("UIStrings",UIStrings);
         this.proto_central.setGlobalDefinition("RankedBattleStatus",RankedBattleStatus);
         this.proto_central.setGlobalDefinition("RBDeny",RBDeny);
         this.proto_central.setGlobalDefinition("RewardReason",RewardReason);
         this.proto_central.setGlobalDefinition("RankBattlesStages",RankBattlesStages);
         this.proto_central.setGlobalDefinition("ObjectTypes",ObjectTypes);
         this.proto_central.setGlobalDefinition("ExteriorTypes",ExteriorTypes);
         this.proto_central.setGlobalDefinition("SSETypes",SSETypes);
         this.proto_central.setGlobalDefinition("CapturePointType",CapturePointType);
         this.proto_central.setGlobalDefinition("ShipTypes",ShipTypes);
         this.proto_central.setGlobalDefinition("Country",Country);
         this.proto_central.setGlobalDefinition("ShipLevels",ShipLevels);
         this.proto_central.setGlobalDefinition("BuildingType",BuildingType);
         this.proto_central.setGlobalDefinition("dataHub",MLDatahubController.xvmDataHub);
         this.mSizeStage.x = this.stage.stageWidth;
         this.mSizeStage.y = this.stage.stageHeight;
         this.proto_central.setGlobalDefinition("stageSize",this.mSizeStage);
         this.proto_central.setGlobalDefinition("CC",ComponentClass);
         this.proto_central.setGlobalDefinition("VoteTypes",VoteConstants);
         this.proto_central.setGlobalDefinition("varChanged",UbScope.CHANGED);
         this.proto_central.setGlobalDefinition("USSConstants",USSConstants);
         this.proto_central.setGlobalDefinition("math",UssMath);
         ChannelGroup = {
            "UNKNOWN":0,
            "SHARED":1,
            "MYCHANNELS":2,
            "HISTORY":3,
            "SEARCHRESULT":4,
            "FAVORITES":5
         };
         this.proto_central.setGlobalDefinition("ChannelGroup",ChannelGroup);
         InviteType = {
            "COMMON":1,
            "SEEKER_ONLY":2
         };
         this.proto_central.setGlobalDefinition("InviteType",InviteType);
         WindowTooltipStateDict = {
            "pinned":WindowTooltipState.pinned,
            "dragging":WindowTooltipState.dragging,
            "free":WindowTooltipState.free
         };
         this.proto_central.setGlobalDefinition("WindowTooltipState",WindowTooltipStateDict);
         wowsBindingsSet = {
            "call":SFMCallBinding,
            "child":UbChildBinding,
            "instance":UbInstanceBinding,
            "event":UbEventBinding,
            "dispatch":UbDispatchBinding,
            "style":UbStyleBinding,
            "class":UbStyleClassBinding,
            "sync":UbSyncBinding,
            "repeat":UbRepeatBinding,
            "dataRefDH":DHDataRefBinding,
            "watchDH":DHWatchBinding,
            "entityDH":DHEntityBinding,
            "firstEntityDH":DHFirstEntityBinding,
            "handleEventDH":DHHandleEventBinding,
            "collectionDH":DHCollectionBinding,
            "collectionRepeatDH":DHCollectionRepeatBinding,
            "componentDH":DHComponentBinding,
            "clikList":UbClikListBinding,
            "draggable":WowsDraggableBinding,
            "resize":WowsResizeBinding,
            "appear":UbAppearBinding,
            "fade":UbFadeBinding,
            "transition":UbTransitionBinding,
            "pluralText":UbPluralTextBinding,
            "tooltip":UbTooltipBinding,
            "menu":UbContextMenuBinding,
            "blurLayer":UbBlurLayerBinding,
            "blurMap":UbBlurMapBinding,
            "input":InputMappingBinding,
            "request":SFMRequestBinding,
            "action":SFMActionBinding,
            "focus":FocusBinding,
            "sequence":UbSequenceBinding,
            "feature":UBAccountLevelBinding,
            "catch":UbCatchEventBinding,
            "var":UBVariablesBinding,
            "watch":UbWatchBinding,
            "actionIsDisplay":ActionIsDisplayBinding,
            "scopeHoldRepeat":UbRepeatWithScopeHoldBinding,
            "stageSize":UbStageSizeBinding,
            "clickSplit":UBClickSplitBinding,
            "substitute":UbSubstituteBinding,
            "scopeTrace":UbScopeTraceBinding,
            "changeDispatch":UbChangeDispatchBinding,
            "countdown":UbCountdownBinding,
            "file":UbFileBinding,
            "imeEnable":UbIMEEnableBinding,
            "linearChart":UbLinearChartBinding,
            "eventSequence":UbEventSequenceBinding,
            "contains":UbContainsBinding,
            "levelToFeature":UbFeatureCheckBinding,
            "timeFormat":UbTimeFormatBinding,
            "serverTime":UBServerTimeBinding,
            "generator":UbGeneratorBinding,
            "generatorDH":DHCollectionGeneratorBinding,
            "clock":UbClockBinding,
            "inoutAction":UbInOutActionBinding,
            "soundOn":UbEventPlaySoundBinding,
            "vTileHack":UbVTileHackBinding
         };
         var loc2:* = 0;
         var loc3:* = wowsBindingsSet;
         for(i in loc3)
         {
            this.proto_central.registerBindingType(i,wowsBindingsSet[i]);
         }
      }
      
      function setLocalizations(arg1:Object) : void
      {
         Translator.localizations = arg1;
      }
      
      function logObject(arg1:Object) : String
      {
         Cc.info(arg1);
         return "Object logged to Cc";
      }
   }
}
