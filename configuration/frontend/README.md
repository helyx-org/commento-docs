### Configuring the frontend

#### Introduction

Commento's frontend configuration allows you to modify the appearance of the embedded comments box. For example, you can specifying a custom CSS stylesheet to override Commento's default appearance to match the look and feel of your website. In this page, we document how to embed Commento in your website and the exhaustive list of frontend settings you can configure.

You can configure additional frontend settings by adding `data` attributes to the `<script>` tag. For example, to specify custom CSS styling, you can add the `data-css-override` and `data-auto-init` attributes as follows:

```
<script defer
  src="http://commento.example.com/js/commento.js"
  data-css-override="http://example.com/my-custom-styling.css"
  data-auto-init="true">
</script>
<div id="commento"></div>
```

#### Configuration settings

<div class="setting-right">Optional</div>
<div class="setting-title">data-css-override</div>

An URL to a CSS file with overriding styles. Defaults to no override and uses Commento's default theme.

<div class="setting-example">data-css-override="http://example.com/my-custom-styling.css"</div>

---

<div class="setting-right">Optional</div>
<div class="setting-title">data-auto-init</div>

Commento automatically initialises itself when the page is loaded. If you prefer to load Commento dynamically (for example, after the user clicks a button), you can disable this. You will be required to call `window.commento.main()` when you want to load Commento. By default, this is true.

<div class="setting-possible">true, false</div>

---

<div class="setting-right">Optional</div>
<div class="setting-title">data-id-root</div>

By default, Commento looks for a `<div>` with `id="commento"`. If you want to load Commento in a different element, you can set this attribute to the ID of that element.

<div class="setting-example">data-id-root="different-element"</div>

---

<div class="setting-right">Optional</div>
<div class="setting-title">data-no-fonts</div>

By default, Commento uses the Source Sans Pro font to present a good design out-of-the-box. If you'd like to disable this so that Commento never loads the font files, you can set this to true. By default, this is true.

<div class="setting-possible">true, false</div>

---

<div class="setting-right">Optional</div>
<div class="setting-title">data-hide-deleted</div>

By default, deleted comments with undeleted replies are shown with a "[deleted]" tag. If you'd like to disable this, setting this to true will hide deleted comments even if there are legitimate replies underneath. Deleted comments without any undeleted comments underneath are hidden irrespective of the value of this function. By default, this is false.

<div class="setting-possible">true, false</div>

---

<div class="setting-right">Optional</div>
<div class="setting-title">data-page-id</div>

By default, Commento will use the browser URL to determine which page's comments should be served. If you changed the URL of a page or if you'd like to use a dynamically set custom ID for each page, use this option. Note that the value need not be a URL path; whatever you set as the value here will be used to uniquely identify your page.

<div class="setting-example">data-page-id="/path/to/older/post.html"</div>
