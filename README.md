# Site builder

This templates set is used for quick integration. Allowing to load assets (css / js) from /files of the site. 

## Usage

Create a site with this templates set
Use the `htmlComponent` to target a fragment of html file that has been previously uploaded to your site.
This file has to contain (or not) an area tag: `<AREA nameOfTheCreatedArea/>`

Example:
```html
This is before area one<br/>

<AREA one/>

This is before area two<br/>

<AREA two/>

This is the end!
```
will generate
![](./siteBuilderReadme.png?raw=true "site builder")
