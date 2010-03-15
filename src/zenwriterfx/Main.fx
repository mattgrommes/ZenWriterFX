/*
 * Main.fx
 *
 * Created on Mar 15, 2010, 9:58:54 AM
 */
package zenwriterfx;

import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.paint.Color;
<<<<<<< HEAD:src/zenwriterfx/Main.fx
<<<<<<< HEAD:src/zenwriterfx/Main.fx
import javafx.scene.media.MediaPlayer;
import javafx.scene.media.Media;
import javafx.scene.media.MediaError;
=======
=======
>>>>>>> 567a49c8b9bf57f8e041d82cd242edb14bd6fdfc:src/zenwriterfx/Main.fx
import javafx.scene.image.ImageView;
import javafx.scene.image.Image;
import zen.like.TextEditor;
import javafx.ext.swing.SwingComponent;
<<<<<<< HEAD:src/zenwriterfx/Main.fx
>>>>>>> 053b55a2625ae88a8fa9c9eaa511f737bb56cf98:src/zenwriterfx/Main.fx
=======
>>>>>>> 567a49c8b9bf57f8e041d82cd242edb14bd6fdfc:src/zenwriterfx/Main.fx

/**
 * @author dick
 */

var scene: Scene;
def theme = Theme.DEFAULT;
<<<<<<< HEAD:src/zenwriterfx/Main.fx
var editor: SwingComponent = TextEditor.create(theme.font) as SwingComponent;

var width: Number = bind stage.width on replace {
    editor.width = width * (theme.endX - theme.beginX);
    editor.translateX = width * theme.beginX;
};
var height: Number = bind stage.height on replace {
    editor.height = height * (theme.endY - theme.beginY);
    editor.translateY = height * theme.beginY;
=======
def editor = TextEditor.create(theme.font, theme.textColor, theme.selectionColor, theme.selectionTextColor);
def editorNode: SwingComponent = editor.node as SwingComponent;
editorNode.focusTraversable = true;

var width: Number = bind stage.width on replace {
    editorNode.width = width * (theme.endX - theme.beginX);
    editorNode.translateX = width * theme.beginX;
};
var height: Number = bind stage.height on replace {
    editorNode.height = height * (theme.endY - theme.beginY);
    editorNode.translateY = height * theme.beginY;
>>>>>>> 567a49c8b9bf57f8e041d82cd242edb14bd6fdfc:src/zenwriterfx/Main.fx
};

def stage: Stage = Stage {
    fullScreen: true
    title: "ZenWriterFX"
    scene: scene = Scene {
        content: [
            ImageView {
                opacity: theme.opacity
                image: Image {
                    backgroundLoading: true
                    url: theme.url
                }
                fitWidth: bind width
                fitHeight: bind height
            }

<<<<<<< HEAD:src/zenwriterfx/Main.fx
            editor
        ]
        fill: Color.WHITE
=======
            editorNode
        ]
        fill: theme.fill
>>>>>>> 567a49c8b9bf57f8e041d82cd242edb14bd6fdfc:src/zenwriterfx/Main.fx
    }

}

<<<<<<< HEAD:src/zenwriterfx/Main.fx
=======
editorNode.requestFocus();
>>>>>>> 567a49c8b9bf57f8e041d82cd242edb14bd6fdfc:src/zenwriterfx/Main.fx
