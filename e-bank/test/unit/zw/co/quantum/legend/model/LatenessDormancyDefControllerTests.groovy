package zw.co.quantum.legend.model



import org.junit.*
import grails.test.mixin.*

@TestFor(LatenessDormancyDefController)
@Mock(LatenessDormancyDef)
class LatenessDormancyDefControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/latenessDormancyDef/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.latenessDormancyDefInstanceList.size() == 0
        assert model.latenessDormancyDefInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.latenessDormancyDefInstance != null
    }

    void testSave() {
        controller.save()

        assert model.latenessDormancyDefInstance != null
        assert view == '/latenessDormancyDef/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/latenessDormancyDef/show/1'
        assert controller.flash.message != null
        assert LatenessDormancyDef.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/latenessDormancyDef/list'


        populateValidParams(params)
        def latenessDormancyDef = new LatenessDormancyDef(params)

        assert latenessDormancyDef.save() != null

        params.id = latenessDormancyDef.id

        def model = controller.show()

        assert model.latenessDormancyDefInstance == latenessDormancyDef
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/latenessDormancyDef/list'


        populateValidParams(params)
        def latenessDormancyDef = new LatenessDormancyDef(params)

        assert latenessDormancyDef.save() != null

        params.id = latenessDormancyDef.id

        def model = controller.edit()

        assert model.latenessDormancyDefInstance == latenessDormancyDef
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/latenessDormancyDef/list'

        response.reset()


        populateValidParams(params)
        def latenessDormancyDef = new LatenessDormancyDef(params)

        assert latenessDormancyDef.save() != null

        // test invalid parameters in update
        params.id = latenessDormancyDef.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/latenessDormancyDef/edit"
        assert model.latenessDormancyDefInstance != null

        latenessDormancyDef.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/latenessDormancyDef/show/$latenessDormancyDef.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        latenessDormancyDef.clearErrors()

        populateValidParams(params)
        params.id = latenessDormancyDef.id
        params.version = -1
        controller.update()

        assert view == "/latenessDormancyDef/edit"
        assert model.latenessDormancyDefInstance != null
        assert model.latenessDormancyDefInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/latenessDormancyDef/list'

        response.reset()

        populateValidParams(params)
        def latenessDormancyDef = new LatenessDormancyDef(params)

        assert latenessDormancyDef.save() != null
        assert LatenessDormancyDef.count() == 1

        params.id = latenessDormancyDef.id

        controller.delete()

        assert LatenessDormancyDef.count() == 0
        assert LatenessDormancyDef.get(latenessDormancyDef.id) == null
        assert response.redirectedUrl == '/latenessDormancyDef/list'
    }
}
