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
import javafx.scene.media.MediaView;
import zen.like.MenuPanel;

/**
 * @author dick
 */

var scene: Scene;
def theme = Theme.DEFAULT;
def keyTyped = function(): Void {
    theme.clickSoundMediaView.mediaPlayer.play();
}
def editor = TextEditor.create(theme.font, theme.textColor, theme.selectionColor, theme.selectionTextColor, keyTyped);
def editorNode: SwingComponent = editor.node as SwingComponent;

def menuPanel = MenuPanel {};

editorNode.focusTraversable = true;

var width: Number = bind stage.width on replace {
    editorNode.width = width * (theme.endX - theme.beginX);
    editorNode.translateX = width * theme.beginX;
    menuPanel.x = width * theme.panelX;
    menuPanel.width = width * theme.panelWidth;
};
var height: Number = bind stage.height on replace {
    editorNode.height = height * (theme.endY - theme.beginY);
    editorNode.translateY = height * theme.beginY;
    menuPanel.y = height * theme.panelY;
    menuPanel.height = height * theme.panelHeight;
};

var bgplayer = MediaPlayer {
                media : Media {
                    source : "file:///home/matt/workspace/ZenWriterFX/src/zenwriterfx/sounds/background/OceanWave.wav"
                }
                autoPlay:true
                repeatCount: MediaPlayer.REPEAT_FOREVER
                onError : function(e) {
                    println(e);
                }

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
                    url: theme.backgroundImage
                }
                fitWidth: bind width
                fitHeight: bind height
            },
            editorNode,
            menuPanel
        ]
        fill: theme.fill
    }

}

bgplayer.play();

editorNode.requestFocus();
