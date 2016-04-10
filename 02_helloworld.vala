using Gtk;

class HelloWorld : Gtk.Window {
    private Gtk.Button button;e

    public void hello () {
        stdout.printf("Hello World\n");
    }

    public bool on_delete_event () {
        stdout.printf("delete event ocurred\n");
        return false;
    }

    public void on_destroy () {
        Gtk.main_quit ();
    }

    public HelloWorld () {
        this.delete_event.connect (this.on_delete_event);
        this.destroy.connect (this.on_destroy);
        this.set_border_width (10);
        this.button = new Gtk.Button.with_label ("Hello World");
        this.button.clicked.connect (this.hello);
        GLib.Signal.connect_swapped (this.button, "clicked", (GLib.Callback) this.on_destroy, this);

        this.add (this.button);
    }

    public static int main (string[] args) {
        Gtk.init (ref args);

        var hello = new HelloWorld ();
        hello.show_all ();
        Gtk.main ();

        return 0;
    }
}
