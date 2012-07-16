package zw.co.quantum.legend.model



import org.junit.*
import grails.test.mixin.*

@TestFor(ChecklistController)
@Mock(Checklist)
class ChecklistControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/checklist/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.checklistInstanceList.size() == 0
        assert model.checklistInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.checklistInstance != null
    }

    void testSave() {
        controller.save()

        assert model.checklistInstance != null
        assert view == '/checklist/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/checklist/show/1'
        assert controller.flash.message != null
        assert Checklist.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/checklist/list'


        populateValidParams(params)
        def checklist = new Checklist(params)

        assert checklist.save() != null

        params.id = checklist.id

        def model = controller.show()

        assert model.checklistInstance == checklist
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/checklist/list'


        populateValidParams(params)
        def checklist = new Checklist(params)

        assert checklist.save() != null

        params.id = checklist.id

        def model = controller.edit()

        assert model.checklistInstance == checklist
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/checklist/list'

        response.reset()


        populateValidParams(params)
        def checklist = new Checklist(params)

        assert checklist.save() != null

        // test invalid parameters in update
        params.id = checklist.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/checklist/edit"
        assert model.checklistInstance != null

        checklist.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/checklist/show/$checklist.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        checklist.clearErrors()

        populateValidParams(params)
        params.id = checklist.id
        params.version = -1
        controller.update()

        assert view == "/checklist/edit"
        assert model.checklistInstance != null
        assert model.checklistInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/checklist/list'

        response.reset()

        populateValidParams(params)
        def checklist = new Checklist(params)

        assert checklist.save() != null
        assert Checklist.count() == 1

        params.id = checklist.id

        controller.delete()

        assert Checklist.count() == 0
        assert Checklist.get(checklist.id) == null
        assert response.redirectedUrl == '/checklist/list'
    }
}
