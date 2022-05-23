package housing

import kotlinx.serialization.*
import io.ktor.application.*
import io.ktor.features.*
import io.ktor.serialization.*
import io.ktor.request.*
import io.ktor.response.*
import io.ktor.routing.*
import io.ktor.http.*
import io.ktor.server.netty.Netty
import io.ktor.server.engine.embeddedServer
import io.ktor.gson.*
import java.util.UUID

@Serializable
data class Application(val name:String, val residents:MutableList<Resident>, val cause:String) {
    var id:UUID = UUID.randomUUID()
}
data class Resident(val fnr:String, val name:String)

class ApplicationService() {
    val store: MutableMap<UUID, Application> = HashMap()

    fun admitApplication(application: Application): UUID {
        application.id = UUID.randomUUID()
        store.put(application.id, application)
        return application.id
    }

    fun get(id: UUID): Application? {
        return store.get(id)
    }

    fun list(): MutableCollection<Application>{
        return store.values
    }
}

fun main(args: Array<String>) {
    
    embeddedServer(Netty, 8080) {

        val applicationService = ApplicationService()

        install(ContentNegotiation) {
            gson()
        }
        
        routing {
            get("/housing/application/{id}") {
                val id = call.parameters["id"]
                val application = applicationService.get(UUID.fromString(id))
                if ( application == null) {
                    call.respondText("No application found with id " + id)
                } else {
                    call.respond(application)
                }
            }
            get("/housing/application") {              
                call.respond(applicationService.list())
            }
            post("/housing/application") {
                val application = call.receive<Application>()
                val id = applicationService.admitApplication(application)
                call.respondText("Applications stored with id " + id, status = HttpStatusCode.Created)
            }
        }
    }.start(wait = true)
}

