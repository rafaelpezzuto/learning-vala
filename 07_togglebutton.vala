using Gtk;

public class Application : Gtk.Window {

    private void toggled (Gtk.ToggleButton button) {
        stdout.printf ("%s: %s\n", button.label, button.active ? "true" : "false");
    }


    public Application () {
        this.set_title ("Toggle Buttons!");
        this.destroy.connect (Gtk.main_quit);
        this.set_border_width (10);
        this.set_default_size (350, 100);
        this.window_position = Gtk.WindowPosition.CENTER;

        Gtk.Box box = new Gtk.Box (Gtk.Orientation.VERTICAL, 0);
        this.add (box);

        Gtk.ToggleButton button1 = new Gtk.ToggleButton.with_label ("Button 1");
        box.pack_start (button1, false, false, 0);
        button1.toggled.connect(toggled);

        Gtk.ToggleButton button2 = new Gtk.ToggleButton.with_label ("Button 2");
        box.pack_start (button2, false, false, 0);
        button2.toggled.connect(toggled);
    }

    public static int main (string[] args){
        Gtk.init (ref args);

        Application app = new Application ();
        app.show_all ();
        Gtk.main ();
        return 0;
    }
}
