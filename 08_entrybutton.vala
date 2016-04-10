using Gtk;

public class Application : Gtk.Window {
	
	public Application () {

		this.title = "Text Entry";
		this.window_position = Gtk.WindowPosition.CENTER;
		this.destroy.connect (Gtk.main_quit);
		this.set_default_size (350, 70);
		this.set_border_width (10);

		Gtk.Entry entry = new Gtk.Entry ();
		this.add (entry);

		entry.set_text ("Hello, world!");

		entry.set_icon_from_icon_name (Gtk.EntryIconPosition.SECONDARY, "edit-clear");

		entry.icon_press.connect ((pos, event) => {
			if (pos == Gtk.EntryIconPosition.SECONDARY) {
				entry.set_text ("");
			}
		});

		entry.activate.connect (() => {
			unowned string str = entry.get_text ();
			stdout.printf ("%s\n", str);
		});
	}

	public static int main (string[] args){
		Gtk.init (ref args);

		Application app = new Application ();
		app.show_all ();
		Gtk.main ();
		return 0;
	}
}