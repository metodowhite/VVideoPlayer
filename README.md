# VVideoPlayer
---


Flex streaming video player component for "Visualmente"

Programado para poder usar los mismos parametros que el componente spark de video por defecto, utilizando "**mw**" como namespace, por ejemplo:

	<mw:VVideoPlayer source="http://streamya.live.cdn.bitgravity.com/streamya/live/feed01"/>


o en el caso de disponibilidad de multiples fuentes dinámicas:

	<mw:VVideoPlayer>
		<mw:source>
			<s:DynamicStreamingVideoSource id="mySVS"
										   host="rtmp://fmsexamples.adobe.com/vod/">
				<s:DynamicStreamingVideoItem id="dreamgirl150"
											 streamName="MP4:_PS_dreamgirl_150.f4v"
											 bitrate="150" />
				<s:DynamicStreamingVideoItem id="dreamgirl500"
											 streamName="MP4:_PS_dreamgirl_500.f4v"
											 bitrate="500" />
				<s:DynamicStreamingVideoItem id="dreamgirl1000"
											 streamName="MP4:_PS_dreamgirl_1000.f4v"
											 bitrate="1000" />
			</s:DynamicStreamingVideoSource>
		</mw:source>
	</mw:VVideoPlayer>

Para activar/desactivar monitoreo de performance se ha utilizado:
	
	<debugger:FlexFPSMonitor/>
