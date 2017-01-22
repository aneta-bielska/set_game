You can find here different implementations of set game. Available: ruby script, elixir script (wip) and react/redux (to play click [HERE](http://testingthings.herokuapp.com/)). Examples below are based on last one.

# Set Game

A card game that has 81 unique cards. The goal is to clear deck by picking valid sets.

## RULES



### Valid set

Valid set consists of 3 cards that have all features the same OR different. Available features: color, shape, texture, number.

Colors:

<img src="https://c1.staticflickr.com/1/482/32337473321_23eb6f7789_o.png" width="116" height="38" alt="sg-colors">

Shapes: ruby, react and github logos.

<img src="https://c1.staticflickr.com/1/341/32418151096_634919d8ca_o.png"  width="451" height="57" alt="v1" />

Texture means: plain filling (1), no filling (2) or pattern (3) (depending on shape - in original game it has the same pattern).

<img src="https://c1.staticflickr.com/1/506/32458154465_c2f1779f06_z.jpg" width="451" height="57" alt="v2" />

Number: one, two or three elements.

#### Examples:

Colors: all the same. Shapes: all the same. Number: all different. Texture: all different.

<p align="center">
  <img src="https://c1.staticflickr.com/1/506/32458154465_c2f1779f06_z.jpg" alt="v2" />
</p>

Colors: all different. Shapes: all different. Number: all the same. Texture: all the same.

<p align="center">
  <img src="https://c1.staticflickr.com/1/694/31615812324_d0f3d35f30_o.png" alt="sg-shapes">
</p>

Colors: all different. Shapes: all different. Number: all different. Texture: all different.

<p align="center">
  <img src="https://c1.staticflickr.com/1/313/32458154585_878ce9fe2c_o.png" alt="v3" />
</p>


### Invalid set

#### Example:

Colors: one red and two black - invalid. Shapes: one gh and two react logos - invalid. Number: 2, 1, 2 - invalid. Texture: all the same - valid.

<p align="center">
  <img src="https://c1.staticflickr.com/1/449/32418151046_1c2c6a1360_o.png" alt="inv1" />
</p>


### Fun facts

It is possible to create over one thousand unique, valid sets from the whole deck (81 cards). In one game it is up to 27 valid sets.
Amout of invalid sets is almost 85000.

### More info

For more info you can visit [wiki](https://en.wikipedia.org/wiki/Set_%28game%29) or creators' [page](http://www.setgame.com/)
