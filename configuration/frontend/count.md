### Displaying Comment Count Links

You can display a count of the number of comments next to each article in your website with Commento's `count.js` feature. To do this, simply include the following snippet in your HTML:

```html
<script src="https://cdn.commento.io/js/count.js"></script>
```

On pages where you want to display comment counts, append a `#commento` to the end of the `href` attribute of links should display the number of comments. Commento will automatically look for such links and fill them with the number of comments. For example, consider the following link.

<pre class="gray">
&lt;a href="https://example.com/foo<b><code class="bold">#commento</code></b>"&gt;&lt;/a&gt;
</pre>

When the `count.js` snippet is included, Commento would automatically search for all such links ending with `#commento` and fill the inner text with the number of comments, like so:

<pre class="gray">
&lt;a href="https://example.com/foo<b><code class="bold">#commento</code></b>"&gt;<b><code class="bold">12 comments</code></b>&lt;/a&gt;
</pre>

#### Configuration settings

<div class="setting-right">Optional</div>
<div class="setting-title">data-page-id</div>

When this attribute is set on the `<a>` tag, its value will be used as the identifier when fetching the number of comments. Must be identical to the `data-page-id` mentioned in the [frontend configuration page](/configuration/frontend/).

---

<div class="setting-right">Optional</div>
<div class="setting-title">data-custom-text</div>

When this attribute is set on the `<script>` tag, its value will be evaluated using JavaScript's `eval` function. The return value will be called to set a custom text. For example, consider the example snippet below.

<pre class="gray">
&lt;a href="https://example.com/foo<b><code class="bold">#commento</code></b>"&gt;&lt;/a&gt;
</pre>

```html
<script>
window.commentCustomText = function(count) {
  if(count === 0) {
    return "No comments";
  } else if (count === 1) {
    return "1 comment";
  } else {
    return count + " comments";
  }
}
</script>
<script src="https://cdn.commento.io/js/count.js" data-custom-text="window.commentoCustomText"></script>
```
