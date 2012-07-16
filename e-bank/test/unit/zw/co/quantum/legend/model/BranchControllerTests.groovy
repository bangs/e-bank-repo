package zw.co.quantum.legend.model



import org.junit.*
import grails.test.mixin.*

@TestFor(BranchController)
@Mock(Branch)
class BranchControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/branch/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.branchInstanceList.size() == 0
        assert model.branchInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.branchInstance != null
    }

    void testSave() {
        controller.save()

        assert model.branchInstance != null
        assert view == '/branch/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/branch/show/1'
        assert controller.flash.message != null
        assert Branch.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/branch/list'


        populateValidParams(params)
        def branch = new Branch(params)

        assert branch.save() != null

        params.id = branch.id

        def model = controller.show()

        assert model.branchInstance == branch
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/branch/list'


        populateValidParams(params)
        def branch = new Branch(params)

        assert branch.save() != null

        params.id = branch.id

        def model = controller.edit()

        assert model.branchInstance == branch
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/branch/list'

        response.reset()


        populateValidParams(params)
        def branch = new Branch(params)

        assert branch.save() != null

        // test invalid parameters in update
        params.id = branch.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/branch/edit"
        assert model.branchInstance != null

        branch.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/branch/show/$branch.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        branch.clearErrors()

        populateValidParams(params)
        params.id = branch.id
        params.version = -1
        controller.update()

        assert view == "/branch/edit"
        assert model.branchInstance != null
        assert model.branchInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/branch/list'

        response.reset()

        populateValidParams(params)
        def branch = new Branch(params)

        assert branch.save() != null
        assert Branch.count() == 1

        params.id = branch.id

        controller.delete()

        assert Branch.count() == 0
        assert Branch.get(branch.id) == null
        assert response.redirectedUrl == '/branch/list'
    }
}
