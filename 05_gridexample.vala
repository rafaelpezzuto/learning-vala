using Gtk;

class GridExample : Gtk.Window {

    void callback(string data){
        stdout.printf("Hello again - %s was pressed\n", data);
    }

    public bool on_delete_event() {
        Gtk.main_quit();
        return false;
    }

    public GridExample () {

        this.set_title("Grid Packing Example");
        this.delete_event.connect(this.on_delete_event);
        this.set_border_width(20);

        var grid = new Gtk.Grid();
        this.add(grid);

        var button = new Gtk.Button.with_label("button 1");
        button.clicked.connect( ()=>{ this.callback("button 1");});
        grid.attach (button, 0, 0, 1, 1);
        button.show();

        button = new Gtk.Button.with_label("button 2");
        button.clicked.connect( () => { this.callback("button 2"); } );
        grid.attach(button, 1, 0, 1, 1);
        button.show();

        button = new Gtk.Button.with_label("button 3");
        button.clicked.connect( () => { this.callback("button 3"); } );
        grid.attach_next_to(button, grid.get_child_at(0, 1), Gtk.PositionType.RIGHT, 1, 1);
        button.show();

        button = new Gtk.Button.with_label("button 4");
        button.clicked.connect( () => { this.callback("button 4"); } );
        grid.attach_next_to(button, grid.get_child_at(0, 0), Gtk.PositionType.BOTTOM, 1, 2);
        button.show();

        button = new Gtk.Button.with_label("button 5");
        button.clicked.connect( () => { this.callback("button 5"); } );
        grid.attach(button, 1, 1, 2, 1);
        button.show();

        button = new Gtk.Button.with_label("button 6");
        button.clicked.connect( () => { this.callback("button 6"); } );
        grid.attach(button, 1, 2, 1, 1);
        button.show();

        button = new Gtk.Button.with_label("button 7");
        button.clicked.connect( () => { this.callback("button 7"); } );
        grid.attach(button, 2, 2, 1, 1);
        button.show();

        button = new Gtk.Button.with_label("Quit");
        button.clicked.connect( ()=> { Gtk.main_quit(); });
        grid.attach(button, 0, 3, 3, 1);
        button.show();
        grid.show();
    }

    public static int main(string[] args){

        Gtk.init(ref args);
        var gridexample = new GridExample();

        gridexample.show();

        Gtk.main();

        return 0;
    }
}
