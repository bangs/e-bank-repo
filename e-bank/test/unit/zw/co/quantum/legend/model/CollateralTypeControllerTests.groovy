package zw.co.quantum.legend.model



import org.junit.*
import grails.test.mixin.*

@TestFor(CollateralTypeController)
@Mock(CollateralType)
class CollateralTypeControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/collateralType/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.collateralTypeInstanceList.size() == 0
        assert model.collateralTypeInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.collateralTypeInstance != null
    }

    void testSave() {
        controller.save()

        assert model.collateralTypeInstance != null
        assert view == '/collateralType/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/collateralType/show/1'
        assert controller.flash.message != null
        assert CollateralType.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/collateralType/list'


        populateValidParams(params)
        def collateralType = new CollateralType(params)

        assert collateralType.save() != null

        params.id = collateralType.id

        def model = controller.show()

        assert model.collateralTypeInstance == collateralType
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/collateralType/list'


        populateValidParams(params)
        def collateralType = new CollateralType(params)

        assert collateralType.save() != null

        params.id = collateralType.id

        def model = controller.edit()

        assert model.collateralTypeInstance == collateralType
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/collateralType/list'

        response.reset()


        populateValidParams(params)
        def collateralType = new CollateralType(params)

        assert collateralType.save() != null

        // test invalid parameters in update
        params.id = collateralType.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/collateralType/edit"
        assert model.collateralTypeInstance != null

        collateralType.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/collateralType/show/$collateralType.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        collateralType.clearErrors()

        populateValidParams(params)
        params.id = collateralType.id
        params.version = -1
        controller.update()

        assert view == "/collateralType/edit"
        assert model.collateralTypeInstance != null
        assert model.collateralTypeInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/collateralType/list'

        response.reset()

        populateValidParams(params)
        def collateralType = new CollateralType(params)

        assert collateralType.save() != null
        assert CollateralType.count() == 1

        params.id = collateralType.id

        controller.delete()

        assert CollateralType.count() == 0
        assert CollateralType.get(collateralType.id) == null
        assert response.redirectedUrl == '/collateralType/list'
    }
}
