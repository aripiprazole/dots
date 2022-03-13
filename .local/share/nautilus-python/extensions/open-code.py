import os
try:
  from urllib import unquote
except ImportError:
  from urllib.parse import unquote
import gi
gi.require_version('GConf', '2.0')
from gi.repository import Nautilus, GObject, GConf

class OpenCodeExtension(Nautilus.MenuProvider, GObject.GObject):
  def __init__(self):
    self.client = GConf.Client.get_default()
      
  def _open_code(self, file):
    filename = unquote(file.get_uri()[7:])

    os.chdir(filename)
    os.system('code .')
      
  def menu_activate_cb(self, menu, file):
    self._open_code(file)
      
  def menu_background_activate_cb(self, menu, file): 
    self._open_code(file)
     
  def get_file_items(self, window, files):
    if len(files) != 1:
      return
    
    file = files[0]
    if not file.is_directory() or file.get_uri_scheme() != 'file':
      return
    
    item = Nautilus.MenuItem(
      name='CodeTerminal::open_code_for_dir',
      label='Open in Code',
      tip='Open Code in %s' % file.get_name()
    )
    item.connect('activate', self.menu_activate_cb, file)
    return item,

  def get_background_items(self, window, file):
    item = Nautilus.MenuItem(
      name='CodeTerminal::open_code_current_dir',
      label='Open Code',
      tip='Open Code in %s' % file.get_name()
    )
    item.connect('activate', self.menu_background_activate_cb, file)
    return item,

