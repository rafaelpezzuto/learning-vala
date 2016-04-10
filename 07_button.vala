using Gtk;

static Gtk.Box xpm_label_box (string xpm_filename, string label_text) {
    Gtk.Box box;
    Gtk.Label label;
    Gtk.Image image;

    box = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 0);
    box.set_border_width (2);

    image = new Gtk.Image.from_file (xpm_filename);

    label = new Gtk.Label (label_text);

    box.pack_start (image, false, false, 3);
    box.pack_start (label, false, false, 3);

    image.show ();
    label.show ();

    return box;
}

class ButtonWindow : Gtk.Window {

    Gtk.Button button;
    Gtk.Box box;

    void callback (string data) {
        stdout.printf ("Hello again - %s was pressed\n", data);
    }

    public ButtonWindow () {
        this.set_title ("Pixmap'd Buttons!");
        this.destroy.connect (()=>{Gtk.main_quit ();});
        this.delete_event.connect (()=>{return false;});
        this.set_border_width (10);
        this.button = new Gtk.Button ();
        this.button.clicked.connect (()=>{this.callback("cool button");});
        this.box = xpm_label_box ("img.png", "cool button");
        this.box.show ();
        this.button.add (box);
        this.button.show ();
        this.add (button);
    }

    public static int main (string[] args){
        Gtk.init (ref args);

        var buttonwindow = new ButtonWindow ();
        buttonwindow.show ();

        Gtk.main ();

        return 0;
    }
}
