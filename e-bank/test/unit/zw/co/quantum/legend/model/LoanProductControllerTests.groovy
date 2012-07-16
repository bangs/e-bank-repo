package zw.co.quantum.legend.model



import org.junit.*
import grails.test.mixin.*

@TestFor(LoanProductController)
@Mock(LoanProduct)
class LoanProductControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/loanProduct/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.loanProductInstanceList.size() == 0
        assert model.loanProductInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.loanProductInstance != null
    }

    void testSave() {
        controller.save()

        assert model.loanProductInstance != null
        assert view == '/loanProduct/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/loanProduct/show/1'
        assert controller.flash.message != null
        assert LoanProduct.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/loanProduct/list'


        populateValidParams(params)
        def loanProduct = new LoanProduct(params)

        assert loanProduct.save() != null

        params.id = loanProduct.id

        def model = controller.show()

        assert model.loanProductInstance == loanProduct
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/loanProduct/list'


        populateValidParams(params)
        def loanProduct = new LoanProduct(params)

        assert loanProduct.save() != null

        params.id = loanProduct.id

        def model = controller.edit()

        assert model.loanProductInstance == loanProduct
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/loanProduct/list'

        response.reset()


        populateValidParams(params)
        def loanProduct = new LoanProduct(params)

        assert loanProduct.save() != null

        // test invalid parameters in update
        params.id = loanProduct.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/loanProduct/edit"
        assert model.loanProductInstance != null

        loanProduct.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/loanProduct/show/$loanProduct.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        loanProduct.clearErrors()

        populateValidParams(params)
        params.id = loanProduct.id
        params.version = -1
        controller.update()

        assert view == "/loanProduct/edit"
        assert model.loanProductInstance != null
        assert model.loanProductInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/loanProduct/list'

        response.reset()

        populateValidParams(params)
        def loanProduct = new LoanProduct(params)

        assert loanProduct.save() != null
        assert LoanProduct.count() == 1

        params.id = loanProduct.id

        controller.delete()

        assert LoanProduct.count() == 0
        assert LoanProduct.get(loanProduct.id) == null
        assert response.redirectedUrl == '/loanProduct/list'
    }
}
