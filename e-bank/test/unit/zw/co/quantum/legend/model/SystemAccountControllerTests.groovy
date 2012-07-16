package zw.co.quantum.legend.model



import org.junit.*
import grails.test.mixin.*

@TestFor(SystemAccountController)
@Mock(SystemAccount)
class SystemAccountControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/systemAccount/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.systemAccountInstanceList.size() == 0
        assert model.systemAccountInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.systemAccountInstance != null
    }

    void testSave() {
        controller.save()

        assert model.systemAccountInstance != null
        assert view == '/systemAccount/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/systemAccount/show/1'
        assert controller.flash.message != null
        assert SystemAccount.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/systemAccount/list'


        populateValidParams(params)
        def systemAccount = new SystemAccount(params)

        assert systemAccount.save() != null

        params.id = systemAccount.id

        def model = controller.show()

        assert model.systemAccountInstance == systemAccount
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/systemAccount/list'


        populateValidParams(params)
        def systemAccount = new SystemAccount(params)

        assert systemAccount.save() != null

        params.id = systemAccount.id

        def model = controller.edit()

        assert model.systemAccountInstance == systemAccount
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/systemAccount/list'

        response.reset()


        populateValidParams(params)
        def systemAccount = new SystemAccount(params)

        assert systemAccount.save() != null

        // test invalid parameters in update
        params.id = systemAccount.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/systemAccount/edit"
        assert model.systemAccountInstance != null

        systemAccount.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/systemAccount/show/$systemAccount.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        systemAccount.clearErrors()

        populateValidParams(params)
        params.id = systemAccount.id
        params.version = -1
        controller.update()

        assert view == "/systemAccount/edit"
        assert model.systemAccountInstance != null
        assert model.systemAccountInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/systemAccount/list'

        response.reset()

        populateValidParams(params)
        def systemAccount = new SystemAccount(params)

        assert systemAccount.save() != null
        assert SystemAccount.count() == 1

        params.id = systemAccount.id

        controller.delete()

        assert SystemAccount.count() == 0
        assert SystemAccount.get(systemAccount.id) == null
        assert response.redirectedUrl == '/systemAccount/list'
    }
}
