package zw.co.quantum.legend.model



import org.junit.*
import grails.test.mixin.*

@TestFor(SavingsProductController)
@Mock(SavingsProduct)
class SavingsProductControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/savingsProduct/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.savingsProductInstanceList.size() == 0
        assert model.savingsProductInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.savingsProductInstance != null
    }

    void testSave() {
        controller.save()

        assert model.savingsProductInstance != null
        assert view == '/savingsProduct/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/savingsProduct/show/1'
        assert controller.flash.message != null
        assert SavingsProduct.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/savingsProduct/list'


        populateValidParams(params)
        def savingsProduct = new SavingsProduct(params)

        assert savingsProduct.save() != null

        params.id = savingsProduct.id

        def model = controller.show()

        assert model.savingsProductInstance == savingsProduct
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/savingsProduct/list'


        populateValidParams(params)
        def savingsProduct = new SavingsProduct(params)

        assert savingsProduct.save() != null

        params.id = savingsProduct.id

        def model = controller.edit()

        assert model.savingsProductInstance == savingsProduct
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/savingsProduct/list'

        response.reset()


        populateValidParams(params)
        def savingsProduct = new SavingsProduct(params)

        assert savingsProduct.save() != null

        // test invalid parameters in update
        params.id = savingsProduct.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/savingsProduct/edit"
        assert model.savingsProductInstance != null

        savingsProduct.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/savingsProduct/show/$savingsProduct.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        savingsProduct.clearErrors()

        populateValidParams(params)
        params.id = savingsProduct.id
        params.version = -1
        controller.update()

        assert view == "/savingsProduct/edit"
        assert model.savingsProductInstance != null
        assert model.savingsProductInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/savingsProduct/list'

        response.reset()

        populateValidParams(params)
        def savingsProduct = new SavingsProduct(params)

        assert savingsProduct.save() != null
        assert SavingsProduct.count() == 1

        params.id = savingsProduct.id

        controller.delete()

        assert SavingsProduct.count() == 0
        assert SavingsProduct.get(savingsProduct.id) == null
        assert response.redirectedUrl == '/savingsProduct/list'
    }
}
