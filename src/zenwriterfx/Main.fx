/*
 * Main.fx
 *
 * Created on Mar 15, 2010, 9:58:54 AM
 */
package zenwriterfx;

import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.text.Text;
import javafx.scene.text.Font;
import javafx.scene.paint.Color;
import javafx.scene.media.MediaPlayer;
import javafx.scene.media.Media;
import javafx.scene.media.MediaError;

/**
 * @author dick
 */
Stage {
    fullScreen: true
    title: "ZenWriterFX"
    scene: Scene {
        content: [
            Text {
                font: Font {
                    size: 16
                }
                x: 10
                y: 30
                content: "Application content"
            }
        ]
        fill: Color.AQUAMARINE
    }

}

var tri : MediaPlayer = MediaPlayer {
    media : Media {
        source : "{__DIR__}Triangle.wav"
    }
    repeatCount:MediaPlayer.REPEAT_FOREVER
    autoPlay:true
    volume:100.0
    onError : function(me : MediaError) {
        println("Error {me.message}")
    }
};

