### Embedding Commento

#### Introduction

Embedding Commento in your blog (or anywhere you want your readers to leave feedback) is pretty easy. All it takes is two HTML tags wherever you want Commento to load.

#### Creating an account

For the rest of this guide, we'll assume you have [installed the backend](installation.md) and that it's accessible at `commento.example.com`. Open `commento.example.com` in your browser will direct you to the login page. Create an account, and verify your email address if you have set up SMTP.

#### Registering your website

For the sake of explanation, say your blog is available at `blog.example.com`. You will need to register your domain with Commento before you can embed comments (so that someone you don't know doesn't use your server to store comments). Log into the dashboard at `commento.example.com` and register your `blog.example.com` website.

#### Embedding HTML

Finally, embed the following piece of HTML in your website wherever you want Commento to load.

```html
<div id="commento"></div>
<script defer
  src="http://commento.example.com/js/commento.js">
</script>
```
