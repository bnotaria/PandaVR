<%@ Page Title="" Language="C#" MasterPageFile="~/PrimaryMaster.Master" AutoEventWireup="true" CodeBehind="ProjectAlchemy.aspx.cs" Inherits="Website.tablisting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<script type="text/javascript">
		$(document).ready(function () {
			$("#PandaTabs").tabs();
		});
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

	<div id="PandaTabs" class="spacer">
		<ul>
			<li><a href="#tabsOverview">Overview</a></li>
			<li><a href="#tabsItemManager">Item Manager</a></li>
			<li><a href="#tabsRecipeManager">Recipe Manager</a></li>
			<li><a href="#tabsHarvestSpotManager">Harvest Manager</a></li>
			<li><a href="#tabsSpriteManager">Sprite Manager</a></li>
		</ul>
		<div id="tabsOverview">
			<h1>Overview</h1>
			<h3>A complex RPG Inventory</h3>
			
			<div class="well">
				<h4>All the content managers for the RPG.</h4>
                <a href="http://imgur.com/PG6dWC6"><img src="http://i.imgur.com/PG6dWC6.png" title="source: imgur.com" width="900px"/></a>
				<p>
					A collage of the content managers for my Alchemy RPG. I go into more detail about the indiviaul editors in the tabs above.
				</p>
			</div>

			<hr />
            
			<h3>Introduction</h3>

			<p>
				Role Playing Games, RPGs, can have a range of inventory systems. On the simplar end, there are games like Final Fantasy 7, FF7. On the other end, there are games like Atelier Escha & Logy, A15 (for the 15th atelier game). 
            </p><p>    
                FF7 inventory system could be largely done with an array containing item counts and a hard coded array of names. There are no interactions bewteen items and no properties that are not shared with all other instances of the object. 
            </p><p>
                A15 inventory system on the other hand is the center of them game. The game centers around alchemy and creation of unique items. As a result the item model is very complex. The items have 5 scalar values that only are used for item creation. Followed by 6 catagorical properties that are for creation and battle. As well as upto 4 emergent properties depending on the alchemy recipe. 
			</p>
			<h3>Game Design</h3>
			<p>
				My game will be of the latter variety. As such, a large proportion of development time is dedicated to extending Unity editor to facilitated the creation of content. 
            </p><p>
                The core of the game is the creation of items through a A15 inspired alchemy system. The player selections a recipe and ingreants to match. After this the elemental aspects of the recipe get added up to provide a secondary effect. 
            </p><p>
                The items for the recipe have to be retreived for the Field. They come in two forms, harvest spots and mob drops. Not all spots contain the same item and when they do, it not nessarly identical to another spot with the same item. For instance you collect "Clean Water" of 10% quality and no Effects. Latter you will find a harvest spot with "Clean Water" of 90% quality with the "Quality++" Effect. 
            </p><p>
                These harvest spots are gaurded by mobs. This is where the "Gameplay" is. Items that the player made allow them to tackle harder mobs quicker. Allowing them in turn to gather more exclusive ingredients to make stronger weapons.  
			</p>
		</div>
		<div id="tabsItemManager">
			<h1>Item Manager</h1>
			<h3></h3>
			<p>
				The Item Manager is the most importent and most complex editor extention. It controls the item's internal id, display name, rarity and inventory icon for all items. Items of different types can have different editor fields. For instance a weapon would have attack damage and speed, while a reagent would information used in alchemy.
            </p><p>
                The Items having the own editors are where the complexity sprouts up. Design wise, it make sense to have a large amount of polymorphism. That is there an <em>Itembase</em> class that all items inherite from. Such inheritors are Equipment, that needs aditional imformation for equiped slot and stats. Another would be reagents, this have information pertianing to alchemy.
            </p><p>
                However structs and serialized classes do not allow for polymorphism in Unity. The data would be deserialezed into the top most class taged with System.Serizable, or at least the type of the list. 
            </p><p>
                The solution was to write my own deserializer. I used the <em>JsonUtility</em> built into unity. This utility is very light weight and does not allow for non-structured JSON. To get it to work with my hierarchy, I created a small wrapper. This wrapper had to field a System.Type that define which type argument to pass the JSON utility and a string field with the instance data.
			</p>
			
		</div>
		<div id="tabsRecipeManager">
			<h1>Recipe Manager</h1>
			<h3></h3>
			<p>
				What is a game about weird and awesome alchemy without recipes. The most basic form of this just defines the ins and outs. There are two types of inputs. The first requires a specsific item. In addition a ingredient slot can also be catigorical. These slots allow any item of the category set in the Item Manager.
            </p><p>
                The used of different items in the same catagory will change how much of each element is present in the operation. This changes the what secondary effects get item to the final item. For instance, if you have zero fire element you might trigger no effects, but at 8 fire element you get added fire damage to your weapon. 
            </p><p>
                These effects are set in the Recipe maneger. Right below where the designer sets the ingredients, there are list fields for them to add recipe effects. These recipe effects include an EffectID and min and max level of the associated element.               

			</p>
			
		</div>
		<div id="tabsHarvestSpotManager">
			<h1>Harvest Spot Manager</h1>
			<h3></h3>
			<p>
				Later in the game's lifecycle, not all objects will be created equal, some will have special effects on otherwise identical items. This allows players to inject extra stats and effects into their weapons, by using this items. To allow the game designer to design these item drops, we create an interface that allows for creation of a harvest spots in a centeral location.
            </p><p>
                The Harvest spots in world contain a harvest ID, a string representing what database entry it links with, and harvest count. Keeping the harvest count on the spot and not in the database allows the level designer to have more freedom. For instance, they might want quick on the trail spots that are to show the player what items are advalible and deeper guarded spots for the player in need of an item to seekout.
			</p>
			
		</div>
		<div id="tabsSpriteManager">
			<h1>Sprite Manager</h1>
			<h3></h3>
			<p>
				The last interface is a specialized dictionary editor for names to sprites. A practial up shot of this custom sprite database comes in up in the Item Manager. Any time a manager needs a item sprite, it does it through a dropdown list opposed to a text feild or object field. If it used a text field, there would be a high chance of a game breaking typo. If it did it through an object field, it would be decentrialized, making it harder for the artist to replace placeholder art. How the Sprite DB facitates this is through the seperation out the item icons, but leaving behind the terrian tiles and player models. This means the list of all keys is small in functional.
			</p>
			
		</div>
		<!---        
        Skills

    --->
	</div>
</asp:Content>
