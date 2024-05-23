# Salt <!-- omit in toc -->

- [How to get any documentation from the command line](#how-to-get-any-documentation-from-the-command-line)
- [How to troubleshoot rendering a map file](#how-to-troubleshoot-rendering-a-map-file)

## How to get any documentation from the command line

Sometimes, we want to go wild and get everything from the command line. The single command that you need to remember is the following:

```bash
sudo salt-call sys.list_functions sys
```

You might ask that this command won't answer what you need. Yes, you are right. But it has all the functions that might answer anything you want from Salt, including your custom modules and states.

```bash
# entire module documentation
sudo salt-call sys.doc jinja

# just one function from the module
sudo salt-call sys.doc jinja.load_map

# info from a state function
sudo salt-call sys.state_doc service.running

# meta documentation getting info even from the sys module
sudo salt-call sys.doc sys.state_doc
```

## How to troubleshoot rendering a map file

A quick way to check your map file's behavior even before using it under a state file is to use the module and function `jinja.load_map`. Here is an example based on this project:

```bash
# personal/map.jinja = relative path from salt folder
# account = existing variable from the map we want to check the value
sudo salt-call jinja.load_map personal/map.jinja account
```

Reference:
- [Salt user guide - Map files](https://docs.saltproject.io/salt/user-guide/en/latest/topics/map-files.html#troubleshoot-rendering)
