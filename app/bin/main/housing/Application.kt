package housing

import kotlinx.serialization.*
import java.util.UUID

@Serializable
data class Application(val name:String, val residents:MutableList<Resident>, val cause:String) {
    var id:UUID = UUID.randomUUID()
}
@Serializable
data class Resident(val fnr:String, val name:String)