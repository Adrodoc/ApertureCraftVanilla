This repository has moved to https://codeberg.org/Adrodoc/ApertureCraftVanilla to avoid GitHubs two factor authentication (2FA) requirement. We believe that Microsofts decision to force all code contributors to use 2FA is very problematic for the following reasons:

1. 2FA significantly increases the risk of irreversible account loss. This is very different to 2FA for something like online banking where in the worst case you can contact your bank and verify your identity to regain access. With GitHub however, if you loose your phone and backup codes (both of which is possible), you will never gain access to your account again.
2. The decision to require 2FA for every code contributor seems very needless. Yes software supply chain attacks are a thing, but not every code contributor on GitHub is responsible for widely used libraries. It's quite the opposite: most code contributors are not responsible for widely used libraries and their code is reviewed and merged by those that are. Also, the details of the 2FA requirement seem arbitrary. Why for example is email not accepted as a second factor or why can WebAuth only be a second second factor and not a primary second factor? Just to make it really hard to not use a phone for 2FA? It feels like a "trust us, we know what's good for you" attitude from Microsoft and it is scary to think what arbitrary decision could come next.
3. Depending on how you use passwords the account security is not necessary improved that much by using 2FA, especially if it is forced onto people that don't want to use it. So why is there no opt out?
4. Many other developers publicly stated that they are leaving GitHub because of this, so staying on GitHub would prevent any code contributions from these people. This makes finding good contributors even harder than before. By moving to https://codeberg.org everyone can continue to contribute to this project.
5. Unfortunately Microsoft does not allow mail as a second factor and some companies do not allow you to bring your private phone to work or install proprietary software (such authenticators) for security reasons. This means 2FA can actually completely prevent you from logging into the website in some circumstances. This is really sad, because it can make it harder for professional developers at companies that use free and open source software to return something to the community.
6. Not everyone owns/can afford a smartphone or dedicated authenticator hardware and Microsoft makes it very inconvenient to use 2FA without that by requiring you to install authenticator software on every development machine. This discourages code contributions from poor people.

2FA is a good technology, but it should be up to repository owners to decide whether it is appropriate for the project at hand. Requiring 2FA for all code contributions, even for code that is reviewed and merged by other people, is completely unnecessary and discourages contributions.

# Aperturecraft Vanilla
Aperturecraft Vanilla is a command block system that implements almost all elements of the game Portal 2 in vanilla Minecraft. Currently this includes:
* Four Portals
* Light Bridges
* Laser
* Weighted Storage Cubes
* Discouragement Redirection Cubes
* Material Emancipation Grills
* Repulsion, Propulsion and Cleansing Gel

You can find more detailed information in the [wiki](https://github.com/Adrodoc55/ApertureCraftVanilla/wiki).

If you want to build a map with Aperturecraft Vanilla you can find a lot of helpful templates in the [Mapmaker Helper](https://github.com/Adrodoc55/MapmakerHelper) wich is also included in the demo world.

Aperturecraft Vanilla is written in [MPL](https://github.com/Adrodoc55/MPL).
To build this project you have to compile the file [ApertureCraft Vanilla.mpl](https://github.com/Adrodoc55/ApertureCraftVanilla/tree/master/src/main/mpl/ApertureCraft%20Vanilla.mpl).

<a rel="license" href="http://creativecommons.org/licenses/by/4.0/"><img alt="Creative Commons License Agreement" style="border-width:0" src="https://i.creativecommons.org/l/by/4.0/88x31.png" /></a><br /><span xmlns:dct="http://purl.org/dc/terms/" href="http://purl.org/dc/dcmitype/Dataset" property="dct:title" rel="dct:type">ApertureCraft Vanilla</span> by <a xmlns:cc="http://creativecommons.org/ns#" href="https://github.com/Adrodoc55/ApertureCraftVanilla" property="cc:attributionName" rel="cc:attributionURL">Adrodoc55</a> is licensed under <a rel="license" href="http://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution 4.0 International</a>.

## Trailer

<p align="center">
  <a href="https://www.youtube.com/watch?v=NlvAQi_-9uw">
    <img src="https://img.youtube.com/vi/NlvAQi_-9uw/0.jpg" alt="Trailer for ApertureCraft Vanilla">
  </a>
</p>
