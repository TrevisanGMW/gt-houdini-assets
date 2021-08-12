<!-- GT Houdini Assets Docs -->

<body>

<p></p>
<!-- Table of Contents -->
<div>
<h1> Table of Contents </h1>
<a href="https://github.com/TrevisanGMW/gt-tools"><img src="./media/gt_hda_logo.png" align="right" alt="GT Tools Logo" width="400"></a>
<h3><b>General:</b></h3>
<ul>
  <li><a href="#installation">Installation</a></li>
</ul>
<h3><b>Geometry Operators:</b></h3>
<ul>
  <li><a href="#-gt-transfer-deformation-">GT Transfer Deformation</a></li>
  <li><a href="#-gt-snowy-geometry-">GT Snowy Geometry</a></li>
</ul>
<h3><b>Test Geometry:</b></h3>
<ul>
  <li><a href="#-gt-test-geometry-tree-">GT Test Geometry Tree</a></li>
  <li><a href="#-gt-test-geometry-rocket-">GT Test Geometry Rocket</a></li>
</ul>
</div>
<br>
</div>

<!-- Installation -->

<h1>Installation</h1>

<h3>🧰 Make Assets Always Available:</h3>
<ol>
	<li>Move your assets to a permanent safe location. (e.g. "Documents > my-houdini-assets")</li>
	<li>Open your "houdini.env" file (Located in "Documents > houdini##.#") using a text editor.</li>
	<li>Add a line defining a variable called "HOUDINI_OTLSCAN_PATH" pointing to the assets folder.<br> For example: <code>HOUDINI_OTLSCAN_PATH = C:/my-houdini-assets;&</code> (Use forward slashes)</li>
	<li>Restart Houdini.</li>
    <li>Enjoy!</li>
</ol>

<h3>🪓 One Time Use:</h3>
<ol>
	<li>Open your Houdini file.</li>
	<li>Go to "Assets > Install Asset Library..."</li>
	<li>Select which asset you want to load using the load dialog <img src="./media/load_asset_button.jpg" alt="Houdini Load Asset Button" width="15"> (top right corner)</li>
	<li>Click on "Install" or "Install and Create"</li>
    <li>Enjoy!</li>
</ol>

<h3>📲 Using Houdini Engine (Maya):</h3>
<ol>
	<li>Load Houdini Engine.</li>
	<li>Go to "Houdini Engine > Load Asset..."</li>
	<li>Select the asset you want to load.</li>
	<li>Enjoy!</li>
</ol>
<br>


<!-- GT Transfer Deformation -->
<div>
<h1> GT Transfer Deformation </h1>
<img src="./media/gt_transfer_deformation.jpg" align="right"
     alt="GT Transfer Deformation Node">

<p>This node transfers deformation from one geometry to another even when their topologies are different.<br>
Plug your retopologized geometry on the left (first input) and the deforming geometry (usually bad topology) on the right (second input)<br>
In case the transfer was not 100% successful tweak the amount of sample points to fix it.<br> (more is better, but slower)</p>

<p><b>Setup Example:</b>
<br>Both tube are identical, but the second one was remeshed and deformed.</p>
<img src="./media/gt_transfer_deformation_sample.gif"
     alt="GT Transfer Deformation Sample Animated" height="300">
<img src="./media/gt_transfer_deformation_use.jpg"
     alt="GT Transfer Deformation Use Example" height="300">

<br><br>
</div>

<!-- GT Snowy Geometry -->
<div>
<h1> GT Snowy Geometry </h1>
<img src="./media/gt_snowy_geometry.jpg" align="right"
     alt="GT Snowy Geometry Node">

<p>Makes input geometry look like it's covered in snow. 
<br>It uses the normal of your input to determine what direction it should place points, and convert this points into a mesh that resembles snow.</p>
<img src="./media/gt_snowy_geometry_sample.jpg"
     alt="GT Snowy Geometry Sample">
<br>
</div>

<!-- GT Test Geometry Tree -->
<div>
<h1> GT Test Geometry Tree </h1>
<img src="./media/gt_test_geometry_tree.jpg" align="right"
     alt="GT Test Geometry Tree Node">

<p>Creates a stylized cartoon tree as a test geometry.</p>

<br>
</div>

<!-- GT Test Geometry Rocket -->
<div>
<h1> GT Test Geometry Rocket </h1>
<img src="./media/gt_test_geometry_rocket.jpg" align="right"
     alt="GT Test Geometry Rocket Node">

<p>Creates a stylized rocket as a test geometry.</p>

<br>
</div>

</body>
