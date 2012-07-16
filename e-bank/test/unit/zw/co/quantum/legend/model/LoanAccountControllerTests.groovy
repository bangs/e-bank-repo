package zw.co.quantum.legend.model



import org.junit.*
import grails.test.mixin.*

@TestFor(LoanAccountController)
@Mock(LoanAccount)
class LoanAccountControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/loanAccount/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.loanAccountInstanceList.size() == 0
        assert model.loanAccountInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.loanAccountInstance != null
    }

    void testSave() {
        controller.save()

        assert model.loanAccountInstance != null
        assert view == '/loanAccount/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/loanAccount/show/1'
        assert controller.flash.message != null
        assert LoanAccount.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/loanAccount/list'


        populateValidParams(params)
        def loanAccount = new LoanAccount(params)

        assert loanAccount.save() != null

        params.id = loanAccount.id

        def model = controller.show()

        assert model.loanAccountInstance == loanAccount
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/loanAccount/list'


        populateValidParams(params)
        def loanAccount = new LoanAccount(params)

        assert loanAccount.save() != null

        params.id = loanAccount.id

        def model = controller.edit()

        assert model.loanAccountInstance == loanAccount
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/loanAccount/list'

        response.reset()


        populateValidParams(params)
        def loanAccount = new LoanAccount(params)

        assert loanAccount.save() != null

        // test invalid parameters in update
        params.id = loanAccount.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/loanAccount/edit"
        assert model.loanAccountInstance != null

        loanAccount.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/loanAccount/show/$loanAccount.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        loanAccount.clearErrors()

        populateValidParams(params)
        params.id = loanAccount.id
        params.version = -1
        controller.update()

        assert view == "/loanAccount/edit"
        assert model.loanAccountInstance != null
        assert model.loanAccountInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/loanAccount/list'

        response.reset()

        populateValidParams(params)
        def loanAccount = new LoanAccount(params)

        assert loanAccount.save() != null
        assert LoanAccount.count() == 1

        params.id = loanAccount.id

        controller.delete()

        assert LoanAccount.count() == 0
        assert LoanAccount.get(loanAccount.id) == null
        assert response.redirectedUrl == '/loanAccount/list'
    }
}
