package zw.co.quantum.legend.model



import org.junit.*
import grails.test.mixin.*

@TestFor(IndividualClientController)
@Mock(IndividualClient)
class IndividualClientControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/individualClient/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.individualClientInstanceList.size() == 0
        assert model.individualClientInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.individualClientInstance != null
    }

    void testSave() {
        controller.save()

        assert model.individualClientInstance != null
        assert view == '/individualClient/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/individualClient/show/1'
        assert controller.flash.message != null
        assert IndividualClient.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/individualClient/list'


        populateValidParams(params)
        def individualClient = new IndividualClient(params)

        assert individualClient.save() != null

        params.id = individualClient.id

        def model = controller.show()

        assert model.individualClientInstance == individualClient
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/individualClient/list'


        populateValidParams(params)
        def individualClient = new IndividualClient(params)

        assert individualClient.save() != null

        params.id = individualClient.id

        def model = controller.edit()

        assert model.individualClientInstance == individualClient
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/individualClient/list'

        response.reset()


        populateValidParams(params)
        def individualClient = new IndividualClient(params)

        assert individualClient.save() != null

        // test invalid parameters in update
        params.id = individualClient.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/individualClient/edit"
        assert model.individualClientInstance != null

        individualClient.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/individualClient/show/$individualClient.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        individualClient.clearErrors()

        populateValidParams(params)
        params.id = individualClient.id
        params.version = -1
        controller.update()

        assert view == "/individualClient/edit"
        assert model.individualClientInstance != null
        assert model.individualClientInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/individualClient/list'

        response.reset()

        populateValidParams(params)
        def individualClient = new IndividualClient(params)

        assert individualClient.save() != null
        assert IndividualClient.count() == 1

        params.id = individualClient.id

        controller.delete()

        assert IndividualClient.count() == 0
        assert IndividualClient.get(individualClient.id) == null
        assert response.redirectedUrl == '/individualClient/list'
    }
}
