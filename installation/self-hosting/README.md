### Self-hosting Commento

{% hint style='tip' %}
If you're a [Commento.io](https://commento.io) user, these steps aren't needed. Follow [these instructions](/installation/cloud-service/embed-on-your-website/) instead.
{% endhint %}

Installing a **self-hosted instance** of Commento can be divided into three logical steps:

 - [On your server](on-your-server): The first step deals with installing Commento's binary and files on your server and involves getting the backend running. This may be done with [release binaries](on-your-server/release-binaries.md), [Docker](on-your-server/docker.md), or by [compiling from source](on-your-server/compiling-source.md).

 - [Register your website](register-your-website): Once you've installed an instance of Commento on your server, you must create an account to register the website where your readers will be adding comments. This step lets the Commento server know about your website so that it can serve requests.

 - [Embed on your website](embed-on-your-website): Finally, after registering your website, you can install Commento on your website to let your readers interact with your Commento instance. For now, Commento supports just one method of embedding: a [universal tag](embed-on-your-website/README.md) that requires you to embed a `<script>` tag in your HTML. In the future, there will be direct plugin support for common platforms such as Wordpress, Blogger, Wix, and Ghost.

#### An Example

Here's an example to clear things up. Let's say your blog is `blog.example.com` and you want to add Commento to this website. Let's say `commento.example.com` is the address of the server where you'll be hosting the Commento server.
 
1. First, you'd [install Commento](on-your-server) on the `commento.example.com` server.
 
1. Then you'd open `commento.example.com` on your browser to create an account and log in.
 
1. Once you're logged into the admin interface, you need to [register your website](register-your-website) `blog.example.com` so that Commento can serve requests.
 
1. Finally, you can to [embed Commento](embed-on-your-website) on `blog.example.com` with the universal tag. You can do this by pasting the provided HTML snippet after each blog post, for example.

And that's it! You can [configure Commento](/configuration) to suit your needs; add moderators, change the appearance, configure email settings, set up OAuth providers, and more!
