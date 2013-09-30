package com.metodowhite.components
{
	import flash.events.Event;
	
	import mx.events.FlexEvent;
	
	import org.osmf.net.StreamingURLResource;
	
	import spark.components.VideoDisplay;
	import spark.components.VideoPlayer;
	import spark.components.mediaClasses.DynamicStreamingVideoSource;
	
	
	public class VVideoPlayer extends VideoPlayer
	{		
		public var scrub:Boolean;
		
		//----------------------------------------------------------------------
		//
		//  Constructor
		//
		//----------------------------------------------------------------------
		
		/**
		 *  Constructor.
		 */
		public function VVideoPlayer()
		{
			super();
			super.videoDisplay = VVideoDisplay as VideoDisplay;
		}
		
		/*public function get forceScrub():Object
		{
		if (videoDisplay)
		{
		return videoDisplay.forceScrub;
		}
		}*/
		
		
		//----------------------------------------------------------------------
		//
		//  Overridden methods
		//
		//----------------------------------------------------------------------
		
		/**
		 *  @private
		 */
		override protected function partAdded(partName:String,
											  instance:Object):void
		{
			super.partAdded(partName, instance);
			
			
			
			if (instance == this.scrubBar) {
				if (this.source is String &&
					this.source.indexOf('rtmp://') == 0 ||
					this.source.indexOf('http://') == 0) {
					this.scrubBar.visible = false;
				}
				
				
				this.scrubBar.addEventListener(
					Event.CHANGE,
					scrubBar_changeHandler,
					false,
					100,
					true
				);
				
				this.scrubBar.addEventListener(
					FlexEvent.CHANGE_END,
					scrubBar_changeEndHandler,
					false,
					100,
					true
				);
				
				if (this.scrub == false){
					this.scrubBar.visible = false;
				}else{
					this.scrubBar.visible = true;
				}
			}
		}
		
		
		/**
		 *  @private
		 */
		override protected function partRemoved(partName:String,
												instance:Object):void
		{
			super.partRemoved(partName, instance);
			
			if (instance == this.scrubBar) {
				this.removeEventListener(Event.CHANGE, scrubBar_changeHandler);
				this.removeEventListener(FlexEvent.CHANGE_END, scrubBar_changeEndHandler);
			}
		}
		
		
		//----------------------------------------------------------------------
		//
		//  Event handlers
		//
		//----------------------------------------------------------------------
		
		private function scrubBar_changeHandler(event:Event):void
		{
			if (this.source is DynamicStreamingVideoSource ||
				this.source is StreamingURLResource) {
				event.stopImmediatePropagation();
				return;
			}
			
			if (this.source is String &&
				this.source.indexOf('rtmp://') == 0 ||
				this.source.indexOf('http://') == 0) {
				event.stopImmediatePropagation();
				return;
			}
		}
		
		
		private function scrubBar_changeEndHandler(event:FlexEvent):void
		{
			this.seek(scrubBar.value);    
		}
	}
}