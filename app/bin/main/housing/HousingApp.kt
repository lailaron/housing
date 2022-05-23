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
import housing.ApplicationService

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

