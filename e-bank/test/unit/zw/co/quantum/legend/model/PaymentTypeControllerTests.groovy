package zw.co.quantum.legend.model



import org.junit.*
import grails.test.mixin.*

@TestFor(PaymentTypeController)
@Mock(PaymentType)
class PaymentTypeControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/paymentType/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.paymentTypeInstanceList.size() == 0
        assert model.paymentTypeInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.paymentTypeInstance != null
    }

    void testSave() {
        controller.save()

        assert model.paymentTypeInstance != null
        assert view == '/paymentType/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/paymentType/show/1'
        assert controller.flash.message != null
        assert PaymentType.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/paymentType/list'


        populateValidParams(params)
        def paymentType = new PaymentType(params)

        assert paymentType.save() != null

        params.id = paymentType.id

        def model = controller.show()

        assert model.paymentTypeInstance == paymentType
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/paymentType/list'


        populateValidParams(params)
        def paymentType = new PaymentType(params)

        assert paymentType.save() != null

        params.id = paymentType.id

        def model = controller.edit()

        assert model.paymentTypeInstance == paymentType
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/paymentType/list'

        response.reset()


        populateValidParams(params)
        def paymentType = new PaymentType(params)

        assert paymentType.save() != null

        // test invalid parameters in update
        params.id = paymentType.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/paymentType/edit"
        assert model.paymentTypeInstance != null

        paymentType.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/paymentType/show/$paymentType.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        paymentType.clearErrors()

        populateValidParams(params)
        params.id = paymentType.id
        params.version = -1
        controller.update()

        assert view == "/paymentType/edit"
        assert model.paymentTypeInstance != null
        assert model.paymentTypeInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/paymentType/list'

        response.reset()

        populateValidParams(params)
        def paymentType = new PaymentType(params)

        assert paymentType.save() != null
        assert PaymentType.count() == 1

        params.id = paymentType.id

        controller.delete()

        assert PaymentType.count() == 0
        assert PaymentType.get(paymentType.id) == null
        assert response.redirectedUrl == '/paymentType/list'
    }
}
