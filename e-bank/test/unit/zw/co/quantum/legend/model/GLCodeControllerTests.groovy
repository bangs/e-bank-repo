package zw.co.quantum.legend.model



import org.junit.*
import grails.test.mixin.*

@TestFor(GLCodeController)
@Mock(GLCode)
class GLCodeControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/GLCode/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.GLCodeInstanceList.size() == 0
        assert model.GLCodeInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.GLCodeInstance != null
    }

    void testSave() {
        controller.save()

        assert model.GLCodeInstance != null
        assert view == '/GLCode/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/GLCode/show/1'
        assert controller.flash.message != null
        assert GLCode.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/GLCode/list'


        populateValidParams(params)
        def GLCode = new GLCode(params)

        assert GLCode.save() != null

        params.id = GLCode.id

        def model = controller.show()

        assert model.GLCodeInstance == GLCode
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/GLCode/list'


        populateValidParams(params)
        def GLCode = new GLCode(params)

        assert GLCode.save() != null

        params.id = GLCode.id

        def model = controller.edit()

        assert model.GLCodeInstance == GLCode
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/GLCode/list'

        response.reset()


        populateValidParams(params)
        def GLCode = new GLCode(params)

        assert GLCode.save() != null

        // test invalid parameters in update
        params.id = GLCode.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/GLCode/edit"
        assert model.GLCodeInstance != null

        GLCode.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/GLCode/show/$GLCode.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        GLCode.clearErrors()

        populateValidParams(params)
        params.id = GLCode.id
        params.version = -1
        controller.update()

        assert view == "/GLCode/edit"
        assert model.GLCodeInstance != null
        assert model.GLCodeInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/GLCode/list'

        response.reset()

        populateValidParams(params)
        def GLCode = new GLCode(params)

        assert GLCode.save() != null
        assert GLCode.count() == 1

        params.id = GLCode.id

        controller.delete()

        assert GLCode.count() == 0
        assert GLCode.get(GLCode.id) == null
        assert response.redirectedUrl == '/GLCode/list'
    }
}
