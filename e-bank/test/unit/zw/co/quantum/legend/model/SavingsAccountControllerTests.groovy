package zw.co.quantum.legend.model



import org.junit.*
import grails.test.mixin.*

@TestFor(SavingsAccountController)
@Mock(SavingsAccount)
class SavingsAccountControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/savingsAccount/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.savingsAccountInstanceList.size() == 0
        assert model.savingsAccountInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.savingsAccountInstance != null
    }

    void testSave() {
        controller.save()

        assert model.savingsAccountInstance != null
        assert view == '/savingsAccount/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/savingsAccount/show/1'
        assert controller.flash.message != null
        assert SavingsAccount.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/savingsAccount/list'


        populateValidParams(params)
        def savingsAccount = new SavingsAccount(params)

        assert savingsAccount.save() != null

        params.id = savingsAccount.id

        def model = controller.show()

        assert model.savingsAccountInstance == savingsAccount
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/savingsAccount/list'


        populateValidParams(params)
        def savingsAccount = new SavingsAccount(params)

        assert savingsAccount.save() != null

        params.id = savingsAccount.id

        def model = controller.edit()

        assert model.savingsAccountInstance == savingsAccount
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/savingsAccount/list'

        response.reset()


        populateValidParams(params)
        def savingsAccount = new SavingsAccount(params)

        assert savingsAccount.save() != null

        // test invalid parameters in update
        params.id = savingsAccount.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/savingsAccount/edit"
        assert model.savingsAccountInstance != null

        savingsAccount.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/savingsAccount/show/$savingsAccount.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        savingsAccount.clearErrors()

        populateValidParams(params)
        params.id = savingsAccount.id
        params.version = -1
        controller.update()

        assert view == "/savingsAccount/edit"
        assert model.savingsAccountInstance != null
        assert model.savingsAccountInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/savingsAccount/list'

        response.reset()

        populateValidParams(params)
        def savingsAccount = new SavingsAccount(params)

        assert savingsAccount.save() != null
        assert SavingsAccount.count() == 1

        params.id = savingsAccount.id

        controller.delete()

        assert SavingsAccount.count() == 0
        assert SavingsAccount.get(savingsAccount.id) == null
        assert response.redirectedUrl == '/savingsAccount/list'
    }
}
