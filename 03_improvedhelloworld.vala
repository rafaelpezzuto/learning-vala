using Gtk;

class HelloWorld : Gtk.Window {
    private Gtk.Button button1;
    private Gtk.Button button2;
    private Gtk.Button button3;
    private Gtk.Box box;

    void callback (string data) {
        stdout.printf("Hello! - %s was pressed\n", data);
    }

    bool on_delete_event () {
        Gtk.main_quit ();
        return false;
    }

    public HelloWorld () {
        this.set_title ("Hello Buttons!");
        this.delete_event.connect (this.on_delete_event);
        this.set_border_width (10);

        box = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 0);
        this.add (box);

        this.button1 = new Gtk.Button.with_label ("Button 1");
        this.button1.clicked.connect (() => { this.callback ("Button 1");});
        box.pack_start (button1, true, true, 0);
        button1.show ();
        
        this.button2 = new Gtk.Button.with_label ("Button 2");
        this.button2.clicked.connect (() => { this.callback ("Button 2");});
        box.pack_start (button2, true, true, 0);
        button2.show ();

        this.button3 = new Gtk.Button.with_label ("Exit");
        this.button3.clicked.connect (() => { this.callback ("Exit");});
        GLib.Signal.connect_swapped (this.button3, "clicked", (GLib.Callback) this.on_delete_event, this);
        box.pack_start (button3, true, true, 0);
        button3.show ();

        box.show ();
    }

    public static int main (string[] args) {
        Gtk.init (ref args);

        var hello = new HelloWorld ();

        hello.show ();

        Gtk.main ();

        return 0;
    }
}
