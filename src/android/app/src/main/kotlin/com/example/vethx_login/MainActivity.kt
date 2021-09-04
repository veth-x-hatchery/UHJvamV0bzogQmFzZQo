package br.tech.vethx.beta

import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterFragmentActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)
    }
}

// import io.flutter.embedding.android.FlutterFragmentActivity
// import io.flutter.embedding.engine.FlutterEngine
// import io.flutter.plugins.GeneratedPluginRegistrant
// import android.content.Context
// class MainActivity: FlutterFragmentActivity() {
//     override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
//         GeneratedPluginRegistrant.registerWith(flutterEngine)
//     }
// }

// import android.content.Context
// import io.flutter.embedding.android.FlutterActivity
// import io.flutter.embedding.android.FlutterFragmentActivity
// import io.flutter.embedding.engine.FlutterEngine
// import io.flutter.plugins.GeneratedPluginRegistrant

// class MainActivity: FlutterFragmentActivity() {
//     companion object {
//         var engine: FlutterEngine? = null
//         fun provideEngine(context: Context): FlutterEngine {
//             val eng = engine ?: FlutterEngine(context, emptyArray(), true, false)
//             engine = eng
//             return eng
//         }
//     }

//     override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
//         GeneratedPluginRegistrant.registerWith(flutterEngine)
//     }

//     override fun provideFlutterEngine(context: Context): FlutterEngine? {
//         return provideEngine(this)
//     }
// }