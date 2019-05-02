### Embedding Commento

At this point, you should have the registered your website with Commento. Now all that's left is embedding Commento on your website. This is the step that actually allows your readers to add comments.

At the moment Commento only supports a [universal HTML tag](universal-tag.md). In the future there will be support for more publishing platforms such as Wordpress, Blogger, Wix, and Ghost. 

If your Commento instance is available at `commento.example.com`, embed the following piece of HTML in your website wherever you want Commento to load. You may want to do this at the bottom of each post.

```html
<div id="commento"></div>
<script defer
  src="http://commento.example.com/js/commento.js">
</script>
```

{% hint style='tip' %}
Commento uses JavaScript to dynamically fetch and display comments. You may want to add a `<noscript>` tag in case the user has disabled JavaScript in their web browser to let them know that. For example, add the following after the `<script>` snippet.

```html
<noscript>Please enable JavaScript to load the comments.</noscript>
```
{% endhint %}
