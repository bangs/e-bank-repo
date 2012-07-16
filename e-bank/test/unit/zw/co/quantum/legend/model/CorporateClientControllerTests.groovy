package zw.co.quantum.legend.model



import org.junit.*
import grails.test.mixin.*

@TestFor(CorporateClientController)
@Mock(CorporateClient)
class CorporateClientControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/corporateClient/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.corporateClientInstanceList.size() == 0
        assert model.corporateClientInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.corporateClientInstance != null
    }

    void testSave() {
        controller.save()

        assert model.corporateClientInstance != null
        assert view == '/corporateClient/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/corporateClient/show/1'
        assert controller.flash.message != null
        assert CorporateClient.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/corporateClient/list'


        populateValidParams(params)
        def corporateClient = new CorporateClient(params)

        assert corporateClient.save() != null

        params.id = corporateClient.id

        def model = controller.show()

        assert model.corporateClientInstance == corporateClient
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/corporateClient/list'


        populateValidParams(params)
        def corporateClient = new CorporateClient(params)

        assert corporateClient.save() != null

        params.id = corporateClient.id

        def model = controller.edit()

        assert model.corporateClientInstance == corporateClient
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/corporateClient/list'

        response.reset()


        populateValidParams(params)
        def corporateClient = new CorporateClient(params)

        assert corporateClient.save() != null

        // test invalid parameters in update
        params.id = corporateClient.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/corporateClient/edit"
        assert model.corporateClientInstance != null

        corporateClient.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/corporateClient/show/$corporateClient.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        corporateClient.clearErrors()

        populateValidParams(params)
        params.id = corporateClient.id
        params.version = -1
        controller.update()

        assert view == "/corporateClient/edit"
        assert model.corporateClientInstance != null
        assert model.corporateClientInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/corporateClient/list'

        response.reset()

        populateValidParams(params)
        def corporateClient = new CorporateClient(params)

        assert corporateClient.save() != null
        assert CorporateClient.count() == 1

        params.id = corporateClient.id

        controller.delete()

        assert CorporateClient.count() == 0
        assert CorporateClient.get(corporateClient.id) == null
        assert response.redirectedUrl == '/corporateClient/list'
    }
}
