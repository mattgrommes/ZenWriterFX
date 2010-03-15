/*
 * Main.fx
 *
 * Created on Mar 15, 2010, 9:58:54 AM
 */
package zenwriterfx;

import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.paint.Color;
import javafx.scene.media.MediaPlayer;
import javafx.scene.media.Media;
import javafx.scene.media.MediaError;
import javafx.scene.image.ImageView;
import javafx.scene.image.Image;
import zen.like.TextEditor;
import javafx.ext.swing.SwingComponent;

/**
 * @author dick
 */

var scene: Scene;
def theme = Theme.DEFAULT;
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

            editorNode
        ]
        fill: theme.fill
    }

}

MediaPlayer {
    media : Media {
        source : "{__DIR__}sounds/background/OceanWave.wav"
    }
    autoPlay:true
    repeatCount: MediaPlayer.REPEAT_FOREVER
    onError : function(e) {
        println(e.message);
    }

}.play();


editorNode.requestFocus();
