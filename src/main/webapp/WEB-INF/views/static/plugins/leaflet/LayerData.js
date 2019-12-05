// 以百度地图为底图
var crs = new L.Proj.CRS(
		'EPSG:900913',
		'+proj=merc +a=6378206 +b=6356584.314245179 +lat_ts=0.0 +lon_0=0.0 +x_0=0 +y_0=0 +k=1.0 +units=m +nadgrids=@null +wktext  +no_defs',
		{
			resolutions : function() {
				level = 19
				var res = [];
				res[0] = Math.pow(2, 18);
				for (var i = 1; i < level; i++) {
					res[i] = Math.pow(2, (18 - i))
				}
				return res;
			}(),
			origin : [ 0, 0 ],
			bounds : L.bounds([ 20037508.342789244, 0 ], [ 0,
					20037508.342789244 ])
		});

function initMap(mapId) {
	var map = L.map(mapId, {
		crs : crs,
		zoomControl : false,
		attributionControl : false
	});

	new L.TileLayer(
			'http://online{s}.map.bdimg.com/tile/?qt=tile&x={x}&y={y}&z={z}&styles=pl&udt=20150518',
			{
				maxZoom : 18,
				minZoom : 3,
				subdomains : [ 0, 1, 2 ],
				tms : true
	}).addTo(map);
	return map;

}
