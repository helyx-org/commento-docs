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
