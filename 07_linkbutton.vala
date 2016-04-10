using Gtk;

public class Application : Gtk.Window {

    public Application () {

        this.title = "Link   Button";
        this.window_position = Gtk.WindowPosition.CENTER;
        this.destroy.connect (Gtk.main_quit);
        this.set_default_size (400,400);

        Gtk.LinkButton button = new Gtk.LinkButton.with_label ("http://www.rafaelpezzuto.com", "My personal site");
        this.add (button);
    }

    public static int main (string[] args) {

        Gtk.init (ref args);
        Application app = new Application ();
        app.show_all ();
        Gtk.main ();
        return 0;
    }
}   
