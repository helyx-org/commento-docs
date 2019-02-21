### Using Release Binaries

#### Download and Install

Installing using release binaries can be done in two ways &ndash; using your operating system's package manager or downloading the release binary archive. If available, the former is recommended because it allows for cleaner updates and removal.

##### Using Your Package Manager

With this approach, your package manager will take care of downloading and installing Commento's files on your system. The Commento binary will be installed to a standard path, so launching Commento is as simple as executing `commento` from a shell. Read the [next section](#launching-commento) on launching Commento to learn more about setting up some non-optional environment variables.

Unfortunately, Commento is not currently available on some distributions; in the event this applies to you, use the [second method](#using-release-binary-archives). If you would like to help package and maintain the package for your favourite distribution, please feel free to do so. Here are the documented installation steps for some distributions.

<!-- Unfortunately, gitbook does not render markdown inside HTML !-->
<details><summary><h6>Arch Linux</h6></summary>
<p>
You should install the <a href="https://aur.archlinux.org/packages/commento/"><code>commento</code></a> package from AUR. You can use an AUR-helper like <a href="https://aur.archlinux.org/packages/yay/"><code>yay</code></a> to make installation and future updates streamlined. Alternatively, you can use plain ol' <code>makepkg</code> as well.
</p>
</details>

<details><summary><h6>CentOS / Fedora</h6></summary>
<p>
You should use this <a href="https://copr.fedorainfracloud.org/coprs/daftaupe/commento/"><code>repository</code></a>. Then download the appropriate ".repo" file depending on your distribution.
</p>
</details>

##### Using Release Binary Archives

Find the latest release archive for your operating system from the [releases page](/getting-started/self-hosting/releases.md). For example, if you were using Linux on an `amd64` processor (also known as `x86-64`) and wanted to download the `v1.4.0` release, you would download the `commento-linux-amd64-v1.4.0.tar.gz` file.

```bash
$ wget https://commento-release.s3.amazonaws.com/commento-linux-amd64-v1.4.0.tar.gz
$ tar xvf commento-linux-amd64-v1.4.0.tar.gz -C /path/to/installation/
```

To launch Commento, you need to execute the binary available at `/path/to/installation/commento`. Read the next section on how to set up some non-optional environment variables.

#### Launching Commento

{% include "launching-commento-pre.md" %}

```bash
$ /path/to/installation/commento
```

{% include "launching-commento-post.md" %}
