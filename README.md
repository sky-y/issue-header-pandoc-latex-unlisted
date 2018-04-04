This is example for [Issue #1 · chdemko/pandoc-latex-unlisted](https://github.com/chdemko/pandoc-latex-unlisted/issues/1#issuecomment-378639894)

To run:

```
$ make
```

`pandoc.log` is log of Pandoc with `--verbose`.

## branches

- master
    - Example that pandoc fails
- fixed
    - Example that pandoc works

Edit `header.tex` to fix:

```
% pandoc-latex-unlisted: bug workaround
% https://github.com/chdemko/pandoc-latex-unlisted/issues/1

% UNCOMMENT BELOW TO FIX
\let\oldaddcontentsline\addcontentsline
```

## Example of Generated PDF

![Example of PDF](https://raw.githubusercontent.com/sky-y/issue-header-pandoc-latex-unlisted/master/book.jpg)
