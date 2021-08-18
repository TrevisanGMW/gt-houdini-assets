<!-- GT Houdini Assets README.md file -->
<p></p>

<img src="./docs/media/gt_hda_logo.png">

<p></p>
<p align="center"> 
<a href="https://github.com/TrevisanGMW/gt-houdini-assets/graphs/contributors">
<img alt="GitHub contributors" src="https://img.shields.io/github/contributors/TrevisanGMW/gt-houdini-assets.svg?style=flat-square" ></a>
<!--<img alt="GitHub language count" src="https://img.shields.io/github/languages/count/TrevisanGMW/gt-houdini-assets?style=flat-square">-->
<img alt="GitHub last commit" src="https://img.shields.io/github/last-commit/TrevisanGMW/gt-houdini-assets?style=flat-square">

<a href="https://github.com/TrevisanGMW/gt-houdini-assets/network/members">
<img alt="GitHub forks" src="https://img.shields.io/github/forks/TrevisanGMW/gt-houdini-assets.svg?style=flat-square" ></a>

<a href="https://github.com/TrevisanGMW/gt-houdini-assets/stargazers">
<img alt="GitHub stars" src="https://img.shields.io/github/stars/TrevisanGMW/gt-houdini-assets.svg?style=flat-square" ></a>

<a href="https://github.com/TrevisanGMW/gt-houdini-assets/issues">
<img alt="GitHub issues" src="https://img.shields.io/github/issues/TrevisanGMW/gt-houdini-assets.svg?style=flat-square" ></a>

<a href="https://github.com/TrevisanGMW/gt-houdini-assets/blob/master/LICENSE">
<img alt="GitHub license" src="https://img.shields.io/github/license/TrevisanGMW/gt-houdini-assets.svg?style=flat-square" ></a>

<a href="https://www.paypal.me/TrevisanGMW"> 
<img src="https://img.shields.io/badge/$-donate-blue.svg?maxAge=2592000&amp;style=flat-square">

<a href="https://www.linkedin.com/in/trevisangmw/">
<img alt="GitHub stars" src="https://img.shields.io/badge/-LinkedIn-black.svg?style=flat-square&logo=linkedin&colorB=555" ></a>

</p>

<h1> Description </h1>
<p>This is my collection of houdini digital assets (HDAs) for SideFX Houdini or Houdini Engine – These assets were created with the aim of automating, simplifying or to be used as a learning tool. None of them are encrypted (black boxes), so you can deconstruct and so you can learn from them or change them in whatever way necessary.
</p>
<p>After installing the asset collection, you’ll find a submenu containing all the new assets. If you can't find it, make sure you're under the correct context (for example SOP, or DOP)
</p>
<p>
For help on how to use these assets, check the documentation by going to the <a href="./docs">"docs"</a> folder. For changelog read the text under help.
All of these items are supplied as is. You alone are solely responsible for any issues. Use at your own risk. 
Hopefully these assets are helpful to you as they are to me.
</p>
<p><b>Tested using SideFX Houdini 18.5 (Windows 10)</b></p>

<h1> Organization </h1>
<p><code>assets</code>: contains houdini digital asset (HDA) files</p>
<p><code>docs</code>: contains documentation about the assets</p>

<h1> Installation </h1>
<h3>🧰 Make Assets Always Available:</h3>

<h4>Auto Installation</h4>

This asset collection comes with an auto installer (setup.bat) you can simply download it, run the setup and reopen Houdini.
Here is how you do it in more details:
<ol>
	<li>Close Houdini (in case it's opened).</li>
	<li>Download the latest release (or clone this repository).</li>
	<li>Un-zip (Decompress) the file you downloaded. (the setup won't work if it's still compressed)</li>
	<li>Open "setup.bat". (It will show you the options - "Install, Uninstall and About")</li>
	<li>Type "1" to "Install", then press enter.</li>
	<li>Open Houdini.</li>
	<li>Enjoy!</li>
</ol>

If you want, you can now delete the downloaded/extracted files (as they have already been installed)

<h4>Manual Installation</h4>

<ol>
	<li>Move your assets to a safe location. (e.g. "Documents > houdini#.# > gt-houdini-assets")</li>
	<li>Move the folder (or just the file) "packages" to "Documents/houdini#.#".</li>
	<li>Open the "gt-houdini-assets.json" file (Located in "Documents > houdini##.#" > packages) using a text editor.</li>
	<li>Edit the GTLIB variable to point to your assets folder.<br> For example: <code>"GTLIB": "C:/Users/USERNAME/Documents/houdini18.5/gt-houdini-assets",</code> (Use forward slashes)</li>
	<li>Restart Houdini.</li>
    <li>Enjoy!</li>
</ol>

<h3>🪓 One Time Use:</h3>
<ol>
	<li>Open your Houdini file.</li>
	<li>Go to "Assets > Install Asset Library..."</li>
	<li>Select which asset you want to load using the load dialog (top right corner)</li>
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

<h1> Licensing </h1>
The MIT License 2021 - Guilherme Trevisan