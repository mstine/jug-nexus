class GoogleMapsTagLib {

  static namespace = "gmap"

  def apiKey = "ABQIAAAACh6QoGMH5jXrbrlXKcLtrxT2yXp_ZAY8_ufC3CFXhHIE1NvwkxQvaCSS6JrjL8_wrwpfs3Wtrb0q-w";

  def resources = {attrs, body ->

    out << """
<script src="http://maps.google.com/maps?file=api&amp;v=2&amp;key=${apiKey}&sensor=false"
          type="text/javascript"></script>
<script type="text/javascript">

    var geocoder = new GClientGeocoder();

    function initialize() {
      if (GBrowserIsCompatible()) {
        var map = new GMap2(document.getElementById("map_canvas"));
        map.setUIToDefault();
        map.setMapType(G_HYBRID_MAP);

        var address = '${attrs.location}';

        geocoder.getLatLng(address, function(point) {
          map.setCenter(point, 19);

          var marker = new GMarker(point);
          map.addOverlay(marker);
        });
      }
    }

    window.onload = initialize;
    window.unload = GUnload();
</script>
"""
  }

  def map = { attrs, body ->
    out << """
  <div id="map_canvas" style="width:${attrs.width}; height:${attrs.height}"></div>

"""
  }

}
