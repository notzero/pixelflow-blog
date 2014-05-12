PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE `blog_posts` (`id` integer PRIMARY KEY AUTOINCREMENT, `title` varchar(255), `body` text, `created_at` timestamp, `updated_at` timestamp, "url" varchar(255));
INSERT INTO "blog_posts" VALUES(1,'SVG hexagon logo','The logo for this site was made by dumping some numbers out of ruby (For coordinates on a unit circle), and crafting this SVG file by hand.

<script src="https://gist.github.com/783821.js"> </script>

The result can be rendered as an image using:

* librsvg''s command line `rsvg`
* ImageMagick''s command line `convert`','2011-02-10 07:04:09.018638+0000','2014-01-20 03:14:59.232949','svg-hexagon-logo');
INSERT INTO "blog_posts" VALUES(2,'To Infinity and beyond!','To raise, or not to raise
-------------------------

When working with float values, it''s good to get familiar with how Ruby deals with them. When using division, what you can end up with is a Float, that is NaN or Infinity

Luckily you can use some helper functions to determine what kind of number it is!

<script src="https://gist.github.com/820792.js"> </script>

As well as working with invalid numbers

<script src="https://gist.github.com/820795.js"> </script>

Pay attention to the subtle differences between `infinite?` returning 1,-1, nil and `finite?` returning true/false.

Home, home on the range
-----------------------

Infinity is also quite useful for representing numbers without a bounds.

<script src="https://gist.github.com/820811.js"> </script>

Great for that ''Ultra Mega Robo Deathstar'' hosting plan you offer.


    ','2011-02-10 16:15:11.197851+0000','2014-01-20 03:14:59.246790','to-infinity-and-beyond');
INSERT INTO "blog_posts" VALUES(3,'MagicRuby Roundup','You can catch some videos of the conference over at [Viddler]( http://viddler.com/magicruby)

The conference had a great turnout. Fellow ruby nerds came from Texas, and as far as Chicago! A welcome change of pace, since Acts_as_conference stopped 2 years ago.

Two of my favorite talks were:

### Exceptional Ruby

Given by Avdi, [Avdi Devblog](http://avdi.org/devblog/) and going over all the subtle nuances about exception bubbling, re-raising, exit codes, and threads.

### Intro to Spatial Programming

Given by Pete, [PeteOnRails Blog](http://blog.peteonrails.com/?p=253) he shows several tools available for ruby to deal with geographic data, and map projections.
','2011-02-10 16:39:00.964381+0000','2014-01-20 03:14:59.252740','magicruby-roundup');
INSERT INTO "blog_posts" VALUES(4,'Chingu makes game programming fun.','[Chingu](https://github.com/ippa/chingu) is a library for ruby that wraps up common functions for displaying game sprites, playing music and sound, and handling input from the user. It''s based on [Gosu](http://code.google.com/p/gosu/).

It is seriously addicting. By exposing common game object features through ''traits'', you can quickly get off the ground by mixing in modules into your game objects.

Just to get an idea of how simple it is, check out the `examples` folder or give my asteroids-like game a download [nfgrebvqf](https://github.com/zeroeth/nfgrebvqf)

10 points if you can decipher the title =)','2011-02-10 16:48:28.358110+0000','2014-01-20 03:14:59.257826','chingu-makes-game-programming-fun');
INSERT INTO "blog_posts" VALUES(5,'Vim Text Alignment','A lot of times, a little white-space can improve readability of a series of function calls, or a data structure, such as a hash.

If you are vimpire, check out [tabular](https://github.com/godlygeek/tabular) it can do things like:

<script src="https://gist.github.com/821044.js"> </script>

and for your Cucumber steps you can turn

<script src="https://gist.github.com/821058.js"> </script>

Into!

<script src="https://gist.github.com/821066.js"> </script>

I won''t reinvent the wheel, so give this vimcasts.org [screen cast](http://vimcasts.org/episodes/aligning-text-with-tabular-vim/) a watch!','2011-02-10 18:36:56.154989+0000','2014-01-20 03:14:59.261864','vim-text-alignment');
INSERT INTO "blog_posts" VALUES(6,'Reading Binary Files','Pack dat up!
------------
If you find yourself dealing with explicit data from binary files in ruby, you may end up writing something like this.

<script src="https://gist.github.com/832858.js"> </script>

`pack` and `unpack` work great, and have a wealth of ways to get at the data [String#unpack rdoc](http://www.ruby-doc.org/core/classes/String.html#M001112). But after using nice DSLs like ActiveRecord and DataMapper, we can do better!

<script src="https://gist.github.com/832865.js"> </script>

The BinData gem
-----------

[BinData](http://bindata.rubyforge.org/) has patterns for cleanly describing how to access the data structures found in binary files. Data can be nested inside other types, including ones you define yourself.

I''m using it to read a [Minecraft](http://www.minecraft.net) map file and manipulate shapes with ruby. Here are some of the highlights of what BinData can do!

### Strings

<script src="https://gist.github.com/832881.js"> </script>

### Arrays

<script src="https://gist.github.com/832896.js"> </script>

### Choice

<script src="https://gist.github.com/832908.js"> </script>

Go check it out over at [Rubyforge](http://bindata.rubyforge.org/)

','2011-02-17 22:40:09.535384+0000','2014-01-20 03:14:59.265683','reading-binary-files');
INSERT INTO "blog_posts" VALUES(7,'Arduino Rotary Encoder','Noisy!
------

When using mechanical buttons to trigger events on a micro-controller there can be some voltage spikes that can re-trigger whatever logic you have for that button.

The same goes for rotary encoders, which in case of [this one at sparkfun](http://www.sparkfun.com/products/9117) is two ''buttons'' 90'' out of phase from one another, thus allowing you to detect clockwise or counter clockwise movement.

We can tune it out
------------------

There are a few ways to filter out unwanted mechanical noise. Using capacitors to react to the sudden spikes, or in software. In software you can check the values in your main loop, but that can be troublesome if your loop includes a lot of logic.

The other two approaches involve interrupts. You can use a timer to poll the pins at a regular interval, or you can attach an interrupt to the change of each pin.

Lets do it!
-----------

[Arduino cooking timer](http://www.pavius.net/2010/02/rotary-encoder-based-cooking-timer/) has a great example of polling based matching. I really liked his code but wanted to try to code my own since this is a learning experience for me.

By looking at the value of both pins when one of them changes, you can predict the next valid value. By ignoring any other values, you do a good job of filtering out any noisy values that happen during one turn of the knob.

Check out the source over at [my git hub](http://gist.github.com/1103653)

Here''s a video of it in action!

<object width="425" height="349"><param name="movie" value="http://www.youtube.com/v/RPAOOMD-qi8?version=3&amp;hl=en_US"></param><param name="allowFullScreen" value="true"></param><param name="allowscriptaccess" value="always"></param><embed src="http://www.youtube.com/v/RPAOOMD-qi8?version=3&amp;hl=en_US" type="application/x-shockwave-flash" width="425" height="349" allowscriptaccess="always" allowfullscreen="true"></embed></object>
','2011-07-25 06:41:17.461008+0000','2014-01-20 03:14:59.269372','arduino-rotary-encoder');
INSERT INTO "blog_posts" VALUES(8,'Ruby Module Descendants','I want to track who included me
---------------------------

Module has a built in callback for when it is included in a class. `self.included(klass)` is called on the module directly after a class declaration which includes it.

<script src="https://gist.github.com/1607559.js"> </script>

But what about sub-classes?
------------------------

Ruby has `ancestors` but not a direct way to look at descendant classes. However you can use `ObjectSpace` to iterate over classes, and use the `<` comparison to see if a class has your module as an ancestor.

<script src="https://gist.github.com/1607440.js"> </script>

You could also use `ancestors.include?(MyModule)` to be more concise.

','2012-01-13 17:14:25.523623+0000','2014-01-20 03:14:59.274144','ruby-module-descendants');
INSERT INTO "blog_posts" VALUES(9,'The colors Duke, the colors!','I''m Basically Obsessed with Graphs
=====================

I''ve always enjoyed oggling charts and visualizations. With the maturing of Javascript, SVG, and Canvas in the browsers there are now some great libraries out there. Github just started using [D3](http://mbostock.github.com/d3/) for all of their graphs.

Perceived Color INTENSITY
----------------------

Color schemes for graphs out of excel can be pretty bland, and there are ways to get aesthetically pleasing color sets with predefined palettes like [Tango](http://tango.freedesktop.org/Tango_Icon_Theme_Guidelines#Color_Palette) or [COLOURlovers](http://www.colourlovers.com/palettes) which is a huge repository of color schemes.

However these, or just using linear interpolation between two colors or a color and white don''t do your data justice.

The gist is, colorspace doesn''t match your eyeballs, and equidistance colors in HSL don''t have the same lightness intensity. As best explained in [this post](http://vis4.net/blog/posts/avoid-equidistant-hsv-colors/) over at vis4.

The best color system for this was originally the [Munsell color system](http://en.wikipedia.org/wiki/Munsell_color_system) but [CIELAB](http://en.wikipedia.org/wiki/CIELAB) is now much more widely used.

Show me the benefits of the science
---------------------------

You can jump right in to some color palettes (which are also GIS friendly) at [Color Brewer](http://colorbrewer2.com/)

Shiny things
----------

Here are some more graph libraries worth investigating:
* [Flare](http://flare.prefuse.org/)
* [raphael.js](http://raphaeljs.com/)
* [InfoVis Toolkit](http://thejit.org/demos/)
* [envision](http://www.humblesoftware.com/envision)
* [cubism](http://square.github.com/cubism/)
* [rickshaw](http://code.shutterstock.com/rickshaw/)

And a bunch of random tools [here](http://www.readwriteweb.com/archives/the_best_tools_for_visualization.php)

And this guy does beautiful things in [flash](http://levitated.net/daily/index.html)


Also. What you really came looking for: 

<object width="420" height="315"><param name="movie" value="http://www.youtube.com/v/VwlMHJE82Mk?version=3&amp;hl=en_US"></param><param name="allowFullScreen" value="true"></param><param name="allowscriptaccess" value="always"></param><embed src="http://www.youtube.com/v/VwlMHJE82Mk?version=3&amp;hl=en_US" type="application/x-shockwave-flash" width="420" height="315" allowscriptaccess="always" allowfullscreen="true"></embed></object>','2012-04-26 05:05:19.597092+0000','2014-01-20 03:14:59.278110','the-colors-duke-the-colors');
INSERT INTO "blog_posts" VALUES(10,'Rails Security Updates','H4x
---

To avoid ''l33t hax0rs'', and generally keep your app purdy like its nice to know when you''ve got a vulnerability.

It''s also super nice when fixes are back ported, so that you can apply fixes without bumping major/minor version numbers.

I had to do so with Rails 3.1.x and all the application specific gems.

Fix
--

Since all my apps are on github, I used [gemnasium.com](//gemnasium.com) which shows all out of date, and at risk gems in your Gemfile, and which versions contain fixes so you can estimate how much time needs to be spent updating.

Joy
--

Go do it. It''s **easy**','2013-05-23 20:24:35.203890+0000','2014-01-20 03:14:59.281891','rails-security-updates');
INSERT INTO "blog_posts" VALUES(11,'Parsley.js Error Box','I am Error
--------

Recently while attempting to style a Google Form I needed to do some javascript validations before submission. I came across [Parsley.js](//parsleyjs.org/) which makes it super easy, they even work with some standard html5 attributes like `type=email` and `required`

Radio Head
----------

The default behavior of Parsley.js is to create a div with a list beneath each item with a validation error. This is fine except for a series of check boxes or radio boxes that are each padded by divs.

Magic Divs
---------

Here is a slight modification of the stock Parsley error wrapper to search up the dom until it finds a parent which has an error div.


<script src="https://gist.github.com/zeroeth/5680855.js"> </script>','2013-05-30 20:22:43.968259+0000','2014-01-20 03:14:59.285678','parsley-dot-js-error-box');
INSERT INTO "blog_posts" VALUES(12,'Arduino Burning Man Goggles','My eyes the goggles do nothing
------------------------------

Ever since Arduino came about and serially addressable RGB LED''s showed up I''ve loved messing around with them. Adafruit came out with these rings that you can string together conveniently to fit in a pair of welders or similar goggles. [Pichurs](http://www.flickr.com/photos/pixelflow_/sets/72157636409953334/)

Burn
----

Burning Man is an awesome time to relax, think, and invent things. This year there was a steam punk camp and I decided to use some goggles we had and my NeoPixel rings (originally for a clock pendant idea) some pink duct tape and have at it!

See Plus Plus
-------------

I want every project to be a new challenge, so this time I decided to take all of the MVC patterns of the web development world and try them on some LED''s. So each pattern is a model that updates its data, and a view renders all of them to the led strip. The plus of this is it would be easy to render to different LED strips using different libraries under the hood. Grab the [CODE](//zeroeth.github.io/oculus_aethereum/)

Vidya
-----

<object width="420" height="315"><param name="movie" value="//www.youtube.com/v/w8Tyc3dmfSE?version=3&amp;hl=en_US"></param><param name="allowFullScreen" value="true"></param><param name="allowscriptaccess" value="always"></param><embed src="//www.youtube.com/v/w8Tyc3dmfSE?version=3&amp;hl=en_US" type="application/x-shockwave-flash" width="420" height="315" allowscriptaccess="always" allowfullscreen="true"></embed></object>','2013-10-11 01:15:03.806182+0000','2014-01-20 03:14:59.289402','arduino-burning-man-goggles');
INSERT INTO "blog_posts" VALUES(13,'LDAP tears',':(
==

So its come to that point in your life where a project is using LDAP. In my case, it was a php Laravel app.

What''chu Talkin About
-------------------

The environment: Mac OSX 10.8.5 with MAMP and openldap. The error? Can''t bind to server.

Sanity Check
----------

Use something like Apache Directory Studio with the same settings as your app is configured to use. If it works, your issue lies in self-signed certificates and connecting over secure `ldaps://` protocol.

Amends
-------

On OSX, edit your `/etc/openldap/ldap.conf` and change `TLS_REQCERT` from `demand` to  `never`

Your hazing is now complete.','2013-11-20 20:36:29.242373+0000','2014-01-20 03:14:59.293094','ldap-tears');
INSERT INTO "blog_posts" VALUES(14,'Backbone.js Catch Missing Routes','So Silent
=====

You know the drill. Click button, nothing happens.

- Is my event firing in the view?
- Is my route triggering?

Make it so #1
========

By having * as a route you can catch spelling errors and other mismatched route errors. **The catch** an asterisk causes a regex error in the router, so we place any alpha characters after it to appease the regex gods. In this case ''nomatch''


<script src="https://gist.github.com/zeroeth/7914290.js">
</script>','2013-12-11 17:02:19.545063+0000','2014-01-20 03:14:59.296907','backbone-dot-js-catch-missing-routes');
INSERT INTO "blog_posts" VALUES(15,'Git Svn Branches','Flirtation
======

gits series of svn commands makes it appealing to use with an svn repository. One can easily make local branches, pull down svn, dcommit back up to svn. Filling in that gap of easily throw away feature branches.

Git + Svn sitting in a tree
---------------------

You can also work with svn branches (create and push to them) with a few wizard incantations. While reciting these spells be sure to use:

* `git svn info` to make sure you are not pointing at `TRUNK`
* Doing a dry run with `-n` or `--dry-run` to `svn dcommit` to make sure it will end in up the right place.

Spells
-----

Cast them.

<script src="https://gist.github.com/zeroeth/7951969.js">
</script>','2013-12-13 22:20:04.925619+0000','2014-01-20 03:21:48.587892','git-svn-branches');
CREATE TABLE `schema_migrations` (`version` varchar(255) NOT NULL);
INSERT INTO "schema_migrations" VALUES('20110209202214');
INSERT INTO "schema_migrations" VALUES('20140119235728');
DELETE FROM sqlite_sequence;
INSERT INTO "sqlite_sequence" VALUES('blog_posts',19);
CREATE UNIQUE INDEX `unique_schema_migrations` ON `schema_migrations` (`version`);
COMMIT;
