package org.codehaus.groovy.grails.plugins.orm.auditable



import org.junit.*
import grails.test.mixin.*

@TestFor(AuditLogEventController)
@Mock(AuditLogEvent)
class AuditLogEventControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/auditLogEvent/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.auditLogEventInstanceList.size() == 0
        assert model.auditLogEventInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.auditLogEventInstance != null
    }

    void testSave() {
        controller.save()

        assert model.auditLogEventInstance != null
        assert view == '/auditLogEvent/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/auditLogEvent/show/1'
        assert controller.flash.message != null
        assert AuditLogEvent.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/auditLogEvent/list'


        populateValidParams(params)
        def auditLogEvent = new AuditLogEvent(params)

        assert auditLogEvent.save() != null

        params.id = auditLogEvent.id

        def model = controller.show()

        assert model.auditLogEventInstance == auditLogEvent
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/auditLogEvent/list'


        populateValidParams(params)
        def auditLogEvent = new AuditLogEvent(params)

        assert auditLogEvent.save() != null

        params.id = auditLogEvent.id

        def model = controller.edit()

        assert model.auditLogEventInstance == auditLogEvent
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/auditLogEvent/list'

        response.reset()


        populateValidParams(params)
        def auditLogEvent = new AuditLogEvent(params)

        assert auditLogEvent.save() != null

        // test invalid parameters in update
        params.id = auditLogEvent.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/auditLogEvent/edit"
        assert model.auditLogEventInstance != null

        auditLogEvent.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/auditLogEvent/show/$auditLogEvent.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        auditLogEvent.clearErrors()

        populateValidParams(params)
        params.id = auditLogEvent.id
        params.version = -1
        controller.update()

        assert view == "/auditLogEvent/edit"
        assert model.auditLogEventInstance != null
        assert model.auditLogEventInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/auditLogEvent/list'

        response.reset()

        populateValidParams(params)
        def auditLogEvent = new AuditLogEvent(params)

        assert auditLogEvent.save() != null
        assert AuditLogEvent.count() == 1

        params.id = auditLogEvent.id

        controller.delete()

        assert AuditLogEvent.count() == 0
        assert AuditLogEvent.get(auditLogEvent.id) == null
        assert response.redirectedUrl == '/auditLogEvent/list'
    }
}
