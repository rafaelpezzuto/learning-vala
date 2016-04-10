using Gtk;

public class Application : Gtk.Window {

    private void toggled (Gtk.ToggleButton button) {
        stdout.printf ("%s\n", button.label);
    }

    public Application () {

        this.title = "Radio Button";
        this.window_position = Gtk.WindowPosition.CENTER;
        this.destroy.connect (Gtk.main_quit);
        this.set_default_size (400,100);

        Gtk.Box box = new Gtk.Box (Gtk.Orientation.VERTICAL, 0);
        this.add (box);

        Gtk.RadioButton button1 = new Gtk.RadioButton.with_label_from_widget (null, "Button 1");
        box.pack_start (button1, false, false, 0);
        button1.toggled.connect (toggled);

        Gtk.RadioButton button2 = new Gtk.RadioButton.with_label_from_widget (button1, "Button 2");
        box.pack_start (button2, false, false, 0);
        button2.toggled.connect (toggled);

        Gtk.RadioButton button3 = new Gtk.RadioButton.with_label_from_widget (button1, "Button 3");
        box.pack_start (button3, false, false, 0);
        button3.toggled.connect (toggled);
        button3.set_active (true);
    }

    public static int main (string[] args) {

        Gtk.init (ref args);
        Application app = new Application ();
        app.show_all ();
        Gtk.main ();
        return 0;
    }
}
