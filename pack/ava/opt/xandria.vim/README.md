# xandria.vim

This vim plugin is a set of tools for working with dokuwiki files in vim. Note that these tools were designed around bootstrap-based sites, specifically those using Guiseppe Di Terlizzi's [Bootstrap 3 template](www.dokuwiki.org/template:bootstrap3) + [Bootstrap Wrapper Plugin](www.dokuwiki.org/plugin:bootswrapper)

NOTE: this is part of a larger project that will eventually become a dokuwiki template (see roadmap below) and therefore contains references to syntax elements, e.g. the `<kw>...</kw>`, `<cmd>...</cmd>`, and so on, that rely on custom dokuwiki plugin which have not been published to work (if you want them message me I'll be glad to share them with you).

## files
 * `ftdetect/dokuwiki.vim` - sets filetype to `dokuwiki` when opening files matching the pattern `*.txt` who contain a dokuwiki header in the first 20 lines, e.g. `====== xandria.vim ======`
 * `ftplugin/dokuwiki.vim`
  - creates keyboard shortcuts for creating bootstrap elements in addition to dokuwiki formatting elements in normal, insert, and visual mode (where appropriate)
  - based on the keybindings found [here](https://dokuwiki.org/tips:vimkeys)
 * `after/syntax/dokuwiki.vim`
  - provides syntax highlighting for the `dokuwiki` vim filetype for both:
    - dokuwiki formatting elements, e.g. bold, italic, header (this part of the file is almost fully identical to the dokuwiki syntax file created by [nblock](https://github.com/nblock/vim-dokuwiki)
    - Bootstrap elements are displayed in a way that makes them easier to read UNLESS the cursor is on the line(s) that contain them while in edit mode , e.g. in normal mode you will see 
      - `label` elements like `<label>TCP/49</label>` appear as `TCP/49` with the foreground white and the background _the color associated with the label type_
      - `[[..networking:IEEE8021Xi | 802.1x ]]` appear as `[802.1x]`
    - hiding of certain custom syntax tags I've created and highlighting the associated text in between them with an appropriate color
      - `<kw>keyword</kw>` becomes `keyword` highlighted in one color
      - `<path>/usr/share/vim/vimfiles</path>` becomes `/usr/share/vim/vimfiles` highlighted in another color
      - `<cmd># systemctl reload nginx</cmd>` becomes `# systemctl reload nginx` highlighted in another color
      - `<txt>AllowRootLogin=no</txt>` becomes `AllowRootLogin=no` highlighted another color
 * `ctags/dokuwiki_ctags.sh`
  - generates ctags for headers & `<kw>..</kw>` tags to allow for easy navigation between files in vim

## installation
using Vundle, add the following line to your vimrc in the appropriate place:
`Plugin 'l0xy/xandria.vim'`
 
## roadmap
The goal of this project is to evolve into a proper dokuwiki template that will, among other things, replace the default dokuwiki section/page editor with a [vim accessible in your browser](https://github.com/rhysd/vim.wasm) that will enable vim savy people to create a personal knowledge database.
