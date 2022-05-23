package housing;

import java.util.UUID
import housing.Application

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
