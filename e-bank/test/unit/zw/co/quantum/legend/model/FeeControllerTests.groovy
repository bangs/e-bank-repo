package zw.co.quantum.legend.model



import org.junit.*
import grails.test.mixin.*

@TestFor(FeeController)
@Mock(Fee)
class FeeControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/fee/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.feeInstanceList.size() == 0
        assert model.feeInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.feeInstance != null
    }

    void testSave() {
        controller.save()

        assert model.feeInstance != null
        assert view == '/fee/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/fee/show/1'
        assert controller.flash.message != null
        assert Fee.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/fee/list'


        populateValidParams(params)
        def fee = new Fee(params)

        assert fee.save() != null

        params.id = fee.id

        def model = controller.show()

        assert model.feeInstance == fee
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/fee/list'


        populateValidParams(params)
        def fee = new Fee(params)

        assert fee.save() != null

        params.id = fee.id

        def model = controller.edit()

        assert model.feeInstance == fee
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/fee/list'

        response.reset()


        populateValidParams(params)
        def fee = new Fee(params)

        assert fee.save() != null

        // test invalid parameters in update
        params.id = fee.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/fee/edit"
        assert model.feeInstance != null

        fee.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/fee/show/$fee.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        fee.clearErrors()

        populateValidParams(params)
        params.id = fee.id
        params.version = -1
        controller.update()

        assert view == "/fee/edit"
        assert model.feeInstance != null
        assert model.feeInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/fee/list'

        response.reset()

        populateValidParams(params)
        def fee = new Fee(params)

        assert fee.save() != null
        assert Fee.count() == 1

        params.id = fee.id

        controller.delete()

        assert Fee.count() == 0
        assert Fee.get(fee.id) == null
        assert response.redirectedUrl == '/fee/list'
    }
}
