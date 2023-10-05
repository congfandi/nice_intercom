import android.app.Application
import io.intercom.android.sdk.Intercom
import io.intercom.android.sdk.identity.Registration

class MainApplication : Application() {

    override fun onCreate() {
        super.onCreate()
        Intercom.initialize(
            this,
            "android_sdk-656a05dcb597e06b628a2ffae0024b72a4d2679c",
            "sc5zsb29"
        )

    }
}