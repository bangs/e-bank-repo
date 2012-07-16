package zw.co.quantum.legend.model



import org.junit.*
import grails.test.mixin.*

@TestFor(ClientGroupController)
@Mock(ClientGroup)
class ClientGroupControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/clientGroup/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.clientGroupInstanceList.size() == 0
        assert model.clientGroupInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.clientGroupInstance != null
    }

    void testSave() {
        controller.save()

        assert model.clientGroupInstance != null
        assert view == '/clientGroup/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/clientGroup/show/1'
        assert controller.flash.message != null
        assert ClientGroup.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/clientGroup/list'


        populateValidParams(params)
        def clientGroup = new ClientGroup(params)

        assert clientGroup.save() != null

        params.id = clientGroup.id

        def model = controller.show()

        assert model.clientGroupInstance == clientGroup
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/clientGroup/list'


        populateValidParams(params)
        def clientGroup = new ClientGroup(params)

        assert clientGroup.save() != null

        params.id = clientGroup.id

        def model = controller.edit()

        assert model.clientGroupInstance == clientGroup
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/clientGroup/list'

        response.reset()


        populateValidParams(params)
        def clientGroup = new ClientGroup(params)

        assert clientGroup.save() != null

        // test invalid parameters in update
        params.id = clientGroup.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/clientGroup/edit"
        assert model.clientGroupInstance != null

        clientGroup.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/clientGroup/show/$clientGroup.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        clientGroup.clearErrors()

        populateValidParams(params)
        params.id = clientGroup.id
        params.version = -1
        controller.update()

        assert view == "/clientGroup/edit"
        assert model.clientGroupInstance != null
        assert model.clientGroupInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/clientGroup/list'

        response.reset()

        populateValidParams(params)
        def clientGroup = new ClientGroup(params)

        assert clientGroup.save() != null
        assert ClientGroup.count() == 1

        params.id = clientGroup.id

        controller.delete()

        assert ClientGroup.count() == 0
        assert ClientGroup.get(clientGroup.id) == null
        assert response.redirectedUrl == '/clientGroup/list'
    }
}
